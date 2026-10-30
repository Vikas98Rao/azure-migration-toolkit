# Post-Migration Validation Script
# Author: Vikas Rao | Senior DevOps Engineer
# Run after Azure Migrate cutover to validate workload health

param(
    [string]$ResourceGroupName,
    [string]$SubscriptionId,
    [string[]]$VMNames
)

Set-AzContext -SubscriptionId $SubscriptionId | Out-Null
$results = @()

foreach ($vmName in $VMNames) {
    Write-Host "Validating VM: $vmName"
    $vm = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $vmName -Status
    $powerState = ($vm.Statuses | Where-Object { $_.Code -like 'PowerState*' }).DisplayStatus

    $result = [PSCustomObject]@{
        VMName        = $vmName
        PowerState    = $powerState
        ProvisionState= $vm.Statuses[0].DisplayStatus
        OSType        = $vm.StorageProfile.OsDisk.OsType
        Validated     = $powerState -eq 'VM running'
    }
    $results += $result
}

$results | Format-Table -AutoSize

$failed = $results | Where-Object { -not $_.Validated }
if ($failed) {
    Write-Host "FAILED VMs found - investigate before decommissioning on-premises:"
    $failed | Format-Table -AutoSize
    exit 1
} else {
    Write-Host "All VMs validated successfully. Migration complete."
}