@secure()
param vulnerabilityAssessments_Default_storageContainerPath string
param servers_sql_server_one_pdm_ankesh_name string = 'sql-server-one-pdm-ankesh'

resource servers_sql_server_one_pdm_ankesh_name_resource 'Microsoft.Sql/servers@2021-05-01-preview' = {
  name: servers_sql_server_one_pdm_ankesh_name
  location: 'westus'
  kind: 'v12.0'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    administratorLogin: 'one_pdm_admin'
    version: '12.0'
    publicNetworkAccess: 'Enabled'
    keyId: 'https://ankesh-key-vault.vault.azure.net/keys/custom-key/ac1be1217a7d4603bd88fc52bb87e662'
    restrictOutboundNetworkAccess: 'Disabled'
  }
}

resource servers_sql_server_one_pdm_ankesh_name_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sql_server_one_pdm_ankesh_name_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sql_server_one_pdm_ankesh_name_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sql_server_one_pdm_ankesh_name_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sql_server_one_pdm_ankesh_name_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource servers_sql_server_one_pdm_ankesh_name_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'default'
  location: 'West US'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_servers_sql_server_one_pdm_ankesh_name_Default 'Microsoft.Sql/servers/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_connectionPolicies_servers_sql_server_one_pdm_ankesh_name_default 'Microsoft.Sql/servers/connectionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'default'
  location: 'westus'
  properties: {
    connectionType: 'Default'
  }
}

resource servers_sql_server_one_pdm_ankesh_name_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_sql_server_one_pdm_ankesh_name}/master/Default'
  location: 'West US'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_ankesh_name_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  name: '${servers_sql_server_one_pdm_ankesh_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_ankesh_name_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  name: '${servers_sql_server_one_pdm_ankesh_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_ankesh_name_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  name: '${servers_sql_server_one_pdm_ankesh_name}/master/Default'
  location: 'West US'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  name: '${servers_sql_server_one_pdm_ankesh_name}/master/Current'
  properties: {}
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_ankesh_name_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  name: '${servers_sql_server_one_pdm_ankesh_name}/master/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_ankesh_name_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  name: '${servers_sql_server_one_pdm_ankesh_name}/master/Current'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_ankesh_name_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  name: '${servers_sql_server_one_pdm_ankesh_name}/master/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_devOpsAuditingSettings_servers_sql_server_one_pdm_ankesh_name_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_sql_server_one_pdm_ankesh_name_db_elasticpool_dev 'Microsoft.Sql/servers/elasticPools@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'db-elasticpool-dev'
  location: 'westus'
  sku: {
    name: 'BasicPool'
    tier: 'Basic'
    capacity: 100
  }
  kind: 'pool'
  properties: {
    maxSizeBytes: 10485760000
    perDatabaseSettings: {
      minCapacity: 0
      maxCapacity: 5
    }
    zoneRedundant: false
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
  }
}

resource servers_sql_server_one_pdm_ankesh_name_current 'Microsoft.Sql/servers/encryptionProtector@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'current'
  kind: 'azurekeyvault'
  properties: {
    serverKeyName: 'ankesh-key-vault_custom-key_ac1be1217a7d4603bd88fc52bb87e662'
    serverKeyType: 'AzureKeyVault'
    autoRotationEnabled: false
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_servers_sql_server_one_pdm_ankesh_name_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_sql_server_one_pdm_ankesh_name_ankesh_key_vault_custom_key_ac1be1217a7d4603bd88fc52bb87e662 'Microsoft.Sql/servers/keys@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'ankesh-key-vault_custom-key_ac1be1217a7d4603bd88fc52bb87e662'
  location: 'West US'
  kind: 'azurekeyvault'
  properties: {
    serverKeyType: 'AzureKeyVault'
    uri: 'https://ankesh-key-vault.vault.azure.net/keys/custom-key/ac1be1217a7d4603bd88fc52bb87e662'
  }
}

resource servers_sql_server_one_pdm_ankesh_name_ServiceManaged 'Microsoft.Sql/servers/keys@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'ServiceManaged'
  kind: 'servicemanaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_securityAlertPolicies_servers_sql_server_one_pdm_ankesh_name_Default 'Microsoft.Sql/servers/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_servers_sql_server_one_pdm_ankesh_name_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
    storageContainerPath: vulnerabilityAssessments_Default_storageContainerPath
  }
}

resource servers_sql_server_one_pdm_ankesh_name_db_aml 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'db-aml'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 0
  }
  kind: 'v12.0,user,pool'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648
    elasticPoolId: servers_sql_server_one_pdm_ankesh_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_ankesh_name_db_bom 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'db-bom'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 0
  }
  kind: 'v12.0,user,pool'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648
    elasticPoolId: servers_sql_server_one_pdm_ankesh_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_ankesh_name_db_change_order 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'db-change-order'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 0
  }
  kind: 'v12.0,user,pool'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648
    elasticPoolId: servers_sql_server_one_pdm_ankesh_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_ankesh_name_db_cicd_test 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'db-cicd-test'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 0
  }
  kind: 'v12.0,user,pool'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648
    elasticPoolId: servers_sql_server_one_pdm_ankesh_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_ankesh_name_db_identity 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'db-identity'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 0
  }
  kind: 'v12.0,user,pool'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648
    elasticPoolId: servers_sql_server_one_pdm_ankesh_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_ankesh_name_db_item 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'db-item'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 0
  }
  kind: 'v12.0,user,pool'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648
    elasticPoolId: servers_sql_server_one_pdm_ankesh_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_ankesh_name_db_misc 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_resource
  name: 'db-misc'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'Basic'
    capacity: 0
  }
  kind: 'v12.0,user,pool'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648
    elasticPoolId: servers_sql_server_one_pdm_ankesh_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_ankesh_name_db_aml_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_bom_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_change_order_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_cicd_test_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_identity_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_item_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_misc_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_aml_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_bom_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_change_order_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_cicd_test_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_identity_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_item_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_misc_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_aml_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_bom_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_change_order_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_cicd_test_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_identity_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_item_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_misc_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_aml_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_bom_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_change_order_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_cicd_test_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_identity_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_item_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_misc_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_aml_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_bom_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_change_order_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_cicd_test_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_identity_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_item_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_misc_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_aml_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'default'
  location: 'West US'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_bom_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'default'
  location: 'West US'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_change_order_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'default'
  location: 'West US'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_cicd_test_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'default'
  location: 'West US'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_identity_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'default'
  location: 'West US'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_item_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'default'
  location: 'West US'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_misc_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'default'
  location: 'West US'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_ankesh_name_db_aml_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_ankesh_name_db_bom_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_ankesh_name_db_change_order_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_ankesh_name_db_cicd_test_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_ankesh_name_db_identity_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_ankesh_name_db_item_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_ankesh_name_db_misc_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_aml_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_bom_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_change_order_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_cicd_test_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_identity_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_item_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_misc_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_aml_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 24
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_bom_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 24
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_change_order_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 24
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_cicd_test_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 24
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_identity_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 24
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_item_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 24
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_ankesh_name_db_misc_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 24
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_ankesh_name_db_aml_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_ankesh_name_db_bom_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_ankesh_name_db_change_order_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_ankesh_name_db_cicd_test_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_ankesh_name_db_identity_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_ankesh_name_db_item_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_ankesh_name_db_misc_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_ankesh_name_db_aml_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'Default'
  location: 'West US'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_ankesh_name_db_bom_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'Default'
  location: 'West US'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_ankesh_name_db_change_order_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'Default'
  location: 'West US'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_ankesh_name_db_cicd_test_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'Default'
  location: 'West US'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_ankesh_name_db_identity_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'Default'
  location: 'West US'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_ankesh_name_db_item_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'Default'
  location: 'West US'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_ankesh_name_db_misc_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'Default'
  location: 'West US'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_aml_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'current'
  properties: {}
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_bom_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'current'
  properties: {}
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_change_order_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'current'
  properties: {}
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_cicd_test_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'current'
  properties: {}
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_identity_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'current'
  properties: {}
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_item_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'current'
  properties: {}
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource servers_sql_server_one_pdm_ankesh_name_db_misc_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'current'
  properties: {}
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_ankesh_name_db_aml_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_ankesh_name_db_bom_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_ankesh_name_db_change_order_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_ankesh_name_db_cicd_test_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_ankesh_name_db_identity_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_ankesh_name_db_item_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_ankesh_name_db_misc_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_ankesh_name_db_aml_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_ankesh_name_db_bom_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_ankesh_name_db_change_order_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_ankesh_name_db_cicd_test_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_ankesh_name_db_identity_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_ankesh_name_db_item_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_ankesh_name_db_misc_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_ankesh_name_db_aml_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_aml
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_ankesh_name_db_bom_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_bom
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_ankesh_name_db_change_order_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_change_order
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_ankesh_name_db_cicd_test_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_cicd_test
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_ankesh_name_db_identity_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_identity
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_ankesh_name_db_item_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_item
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_ankesh_name_db_misc_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_ankesh_name_db_misc
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_sql_server_one_pdm_ankesh_name_resource
  ]
}
