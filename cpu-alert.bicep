param metricAlerts_ONEPDM_DEV_DB_CPU_ALERT_name string = 'ONEPDM-DEV-DB-IDENTITY-CPU-ALERT'
param servers_sql_server_one_pdm_dev_externalid string = '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/resourceGroups/OnePdm-Development/providers/Microsoft.Sql/servers/sql-server-one-pdm-dev'
param metricAlerts_Database_name string ='db-identity'
param actiongroups_onepdm_platform_alerts_externalid string = '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/resourceGroups/onepdm-development/providers/microsoft.insights/actiongroups/onepdm-platform-alerts'

targetScope = 'resourceGroup'

resource metricAlerts_ONEPDM_DEV_DB_CPU_ALERT_name_resource 'microsoft.insights/metricAlerts@2018-03-01' = {
  name: metricAlerts_ONEPDM_DEV_DB_CPU_ALERT_name
  location: 'global'
  tags: {
    Environment: 'Development'
  }
  properties: {
    severity: 2
    enabled: true
    scopes: [
      '${servers_sql_server_one_pdm_dev_externalid}/databases/${metricAlerts_Database_name}'
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      allOf: [
        {
          threshold: 50
          name: 'Metric1'
          metricNamespace: 'Microsoft.Sql/servers/databases'
          metricName: 'cpu_percent'
          operator: 'GreaterThan'
          timeAggregation: 'Maximum'
          criterionType: 'StaticThresholdCriterion'
        }
      ]
      'odata.type': 'Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria'
    }
    autoMitigate: true
    targetResourceType: 'Microsoft.Sql/servers/databases'
    actions: [
      {
        actionGroupId: actiongroups_onepdm_platform_alerts_externalid
        webHookProperties: {}
      }
    ]
  }
}
