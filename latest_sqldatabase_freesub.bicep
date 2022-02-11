param servers_sql_server_one_pdm_dev_name string = 'sql-server-one-pdm-ankesh'
resource servers_sql_server_one_pdm_dev_name_resource 'Microsoft.Sql/servers@2021-05-01-preview' = {
  name: servers_sql_server_one_pdm_dev_name
  location: 'westus'
  properties: {
    administratorLogin: 'one_pdm_admin'
    administratorLoginPassword: 'Welcome@123#'
    version: '12.0'
    publicNetworkAccess: 'Enabled'
    restrictOutboundNetworkAccess: 'Disabled'
  }
}
resource servers_sql_server_one_pdm_dev_name_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}
resource servers_sql_server_one_pdm_dev_name_db_elasticpool_dev 'Microsoft.Sql/servers/elasticPools@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-elasticpool-dev'
  location: 'westus'
  sku: {
    name: 'BasicPool'
    tier: 'Basic'
    capacity: 100
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
resource servers_sql_server_one_pdm_dev_name_current 'Microsoft.Sql/servers/encryptionProtector@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'current'
  properties: {
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
    autoRotationEnabled: false
  }
}
resource servers_sql_server_one_pdm_dev_name_db_aml 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-aml'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}
resource servers_sql_server_one_pdm_dev_name_db_bom 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-bom'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}
resource servers_sql_server_one_pdm_dev_name_db_change_order 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-change-order'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}
resource servers_sql_server_one_pdm_dev_name_db_cicd_test 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-cicd-test'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}
resource servers_sql_server_one_pdm_dev_name_db_identity 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-identity'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}
resource servers_sql_server_one_pdm_dev_name_db_item 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-item'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}
resource servers_sql_server_one_pdm_dev_name_db_misc 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-misc'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}
resource servers_sql_server_one_pdm_dev_name_db_aml_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_bom_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_change_order_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_cicd_test_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_identity_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_item_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_misc_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_aml_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_bom_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_change_order_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_cicd_test_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_identity_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_item_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_misc_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_aml_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_bom_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_change_order_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_cicd_test_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_identity_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_item_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}
resource servers_sql_server_one_pdm_dev_name_db_misc_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}






