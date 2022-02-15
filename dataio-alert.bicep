param metricAlerts_ONEPDM_DEV_DB_DATA_IO_ALERT_name string = 'ONEPDM-DEV-DB-CICDTEST-DATA-IO-ALERT'
param metricAlerts_Database_IO_name string = 'db-cicd-test'
param servers_sql_server_one_pdm_dev_externalid string = '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/resourceGroups/OnePdm-Development/providers/Microsoft.Sql/servers/sql-server-one-pdm-dev'
param actionGroups_onepdm_platform_alerts_externalid string = '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/resourceGroups/onepdm-development/providers/microsoft.insights/actionGroups/onepdm-platform-alerts'

resource metricAlerts_ONEPDM_DEV_DB_DATA_IO_ALERT_name_resource 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: metricAlerts_ONEPDM_DEV_DB_DATA_IO_ALERT_name
  location: 'global'
  tags: {
    Environment: 'Development'
  }
  properties: {
    severity: 2
    enabled: true
    scopes: [
      '${servers_sql_server_one_pdm_dev_externalid}/databases/${metricAlerts_Database_IO_name}'
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      allOf: [
        {
          threshold: 50
          name: 'Metric1'
          metricNamespace: 'Microsoft.Sql/servers/databases'
          metricName: 'physical_data_read_percent'
          operator: 'GreaterThanOrEqual'
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
        actionGroupId: actionGroups_onepdm_platform_alerts_externalid
        webHookProperties: {}
      }
    ]
  }
}
