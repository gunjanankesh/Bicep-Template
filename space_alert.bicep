param metricAlerts_ONEPDM_DEV_DB_SPACE_FULL_ALERT_name string = 'ONEPDM-DEV-DB-IDENTITY-SPACE-FULL-ALERT'
param metricAlerts_database_sf_name string = 'db-identity'
param servers_sql_server_one_pdm_dev_externalid string = '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/resourceGroups/OnePdm-Development/providers/Microsoft.Sql/servers/sql-server-one-pdm-dev'
param actionGroups_ONEPDM_PLATFORM_ALERTS_externalid string = '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/resourceGroups/OnePdm-Development/providers/microsoft.insights/actionGroups/ONEPDM-PLATFORM-ALERTS'

resource metricAlerts_ONEPDM_DEV_DB_SPACE_FULL_ALERT_name_resource 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: metricAlerts_ONEPDM_DEV_DB_SPACE_FULL_ALERT_name
  location: 'global'
  tags: {
    Environment: 'Development'
  }
  properties: {
    severity: 1
    enabled: true
    scopes: [
      '${servers_sql_server_one_pdm_dev_externalid}/databases/${metricAlerts_database_sf_name}'
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      allOf: [
        {
          threshold: 90
          name: 'Metric1'
          metricNamespace: 'Microsoft.Sql/servers/databases'
          metricName: 'storage_percent'
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
        actionGroupId: actionGroups_ONEPDM_PLATFORM_ALERTS_externalid
        webHookProperties: {}
      }
    ]
  }
}
