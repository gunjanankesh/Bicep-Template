resource servers_sql_server_one_pdm_dev_name_db_elasticpool_dev 'Microsoft.Sql/servers/elasticPools@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-elasticpool-dev'
  location: 'westus'
  sku: {
    name: 'BasicPool'
    tier: 'Basic'
    capacity: 50
  }
properties: {
  perDatabaseSettings: {
    minCapacity: 0
    maxCapacity: 5
  
    }
    zoneRedundant: false
    licenseType: 'LicenseIncluded'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
  }
}
