# Pre-Cutover Checklist - Azure Migration
# Author: Vikas Rao | Senior DevOps Engineer

## 48 Hours Before Cutover

- [ ] Azure Migrate replication status: All VMs show 'Ready to migrate'
- [ ] Test failover completed successfully in isolated VNet
- [ ] Application smoke tests passed on Azure VMs
- [ ] DNS TTL reduced to 60 seconds
- [ ] Stakeholder notification sent
- [ ] Rollback plan reviewed and approved by Change Advisory Board
- [ ] On-call roster confirmed for cutover window

## 24 Hours Before Cutover

- [ ] Final replication sync verified (delta < 100MB)
- [ ] Database backup completed and verified
- [ ] Azure Backup enabled on target VMs
- [ ] NSG rules reviewed and validated
- [ ] Private endpoint connectivity tested
- [ ] SSL certificates valid for >30 days on Azure Load Balancer
- [ ] Monitoring and alerting configured in Azure Monitor

## 4 Hours Before Cutover

- [ ] Maintenance window communicated to end users
- [ ] Application placed in maintenance mode
- [ ] Final incremental backup/snapshot triggered
- [ ] Azure Support ticket raised (proactive notification)
- [ ] War room bridge opened

## During Cutover

- [ ] Stop replication and trigger migration
- [ ] Update DNS records to Azure IP addresses
- [ ] Verify application health via monitoring dashboard
- [ ] Confirm database connectivity from Azure VMs
- [ ] Run post-migration validation script
- [ ] Business sign-off received

## Post-Cutover (First 24 Hours)

- [ ] Monitor application performance metrics
- [ ] Review Azure Monitor alerts
- [ ] Decommission on-premises VMs after 48h hold period
- [ ] Update CMDB with new Azure resource details
- [ ] Document lessons learned