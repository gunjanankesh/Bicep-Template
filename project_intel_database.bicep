param servers_sql_server_one_pdm_dev_name string = 'sql-server-one-pdm-dev'

resource servers_sql_server_one_pdm_dev_name_resource 'Microsoft.Sql/servers@2014-04-01' = {
  name: servers_sql_server_one_pdm_dev_name
  location: 'westus'
  properties: {
    administratorLogin: 'one_pdm_admin'
    administratorLoginPassword: 'ankesh123'
    version: '12.0'
    publicNetworkAccess: 'Enabled'
    administrators: {
      administratorType: 'ActiveDirectory'
      principalType: 'Group'
      login: 'ankesh.gunjan@intel.com'
      sid: '864311e8-f759-4896-9ea7-524a73094952'
      tenantId: '46c98d88-e344-4ed4-8496-4ed7712e255d'
    }
    restrictOutboundNetworkAccess: 'Disabled'
  }
}

resource servers_sql_server_one_pdm_dev_name_ActiveDirectory 'Microsoft.Sql/servers/administrators@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'activeDirectory'
  properties: {
    administratorType: 'ActiveDirectory'
    login: 'ankesh.gunjan@intel.com'
    sid: '864311e8-f759-4896-9ea7-524a73094952'
    tenantId: '46c98d88-e344-4ed4-8496-4ed7712e255d'
  }
}

resource servers_sql_server_one_pdm_dev_name_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sql_server_one_pdm_dev_name_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sql_server_one_pdm_dev_name_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sql_server_one_pdm_dev_name_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sql_server_one_pdm_dev_name_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource servers_sql_server_one_pdm_dev_name_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'default'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_servers_sql_server_one_pdm_dev_name_Default 'Microsoft.Sql/servers/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'default'
  properties: {
    isDevopsAuditEnabled: false
    retentionDays: 0
    auditActionsAndGroups: [
      'SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP'
      'FAILED_DATABASE_AUTHENTICATION_GROUP'
      'BATCH_COMPLETED_GROUP'
    ]
    isAzureMonitorTargetEnabled: true
    state: 'Enabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_azureADOnlyAuthentications_servers_sql_server_one_pdm_dev_name_Default 'Microsoft.Sql/servers/azureADOnlyAuthentications@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'Default'
  properties: {
    azureADOnlyAuthentication: false
  }
}

resource Microsoft_Sql_servers_connectionPolicies_servers_sql_server_one_pdm_dev_name_default 'Microsoft.Sql/servers/connectionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'default'
  properties: {
    connectionType: 'Default'
  }
}

resource servers_sql_server_one_pdm_dev_name_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_sql_server_one_pdm_dev_name}/master/Default'
  properties: {
    auditingState: 'Disabled'
  }
  
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_dev_name_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  name: '${servers_sql_server_one_pdm_dev_name}/master/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_dev_name_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  name: '${servers_sql_server_one_pdm_dev_name}/master/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_dev_name_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  name: '${servers_sql_server_one_pdm_dev_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  name: '${servers_sql_server_one_pdm_dev_name}/master/Current'
  properties: {}
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_dev_name_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2014-04-01' = {
  name: '${servers_sql_server_one_pdm_dev_name}/master/Default'
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

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_dev_name_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  name: '${servers_sql_server_one_pdm_dev_name}/master/Current'
  properties: {
    state: 'Disabled'
  }
  
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_dev_name_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  name: '${servers_sql_server_one_pdm_dev_name}/master/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
      emails: []
    }
  }
  dependsOn: [
    servers_sql_server_one_pdm_dev_name_resource
  ]
}

resource Microsoft_Sql_servers_devOpsAuditingSettings_servers_sql_server_one_pdm_dev_name_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: true
    state: 'Enabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_sql_server_one_pdm_dev_name_db_elasticpool_dev 'Microsoft.Sql/servers/elasticPools@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-elasticpool-dev'
  location: 'westus'
  sku: {
    name: 'GP_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 4
  }
  properties: {
    maxSizeBytes: 107374182400
    perDatabaseSettings: {
      minCapacity: 1
      maxCapacity: 4
    }
    zoneRedundant: false
    licenseType: 'LicenseIncluded'
    maintenanceConfigurationId: '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
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

resource Microsoft_Sql_servers_extendedAuditingSettings_servers_sql_server_one_pdm_dev_name_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'default'
  properties: {
    isDevopsAuditEnabled: false
    retentionDays: 0
    auditActionsAndGroups: [
      'SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP'
      'FAILED_DATABASE_AUTHENTICATION_GROUP'
      'BATCH_COMPLETED_GROUP'
    ]
    isAzureMonitorTargetEnabled: true
    state: 'Enabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_sql_server_one_pdm_dev_name_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource servers_sql_server_one_pdm_dev_name_CHProxyRange 'Microsoft.Sql/servers/firewallRules@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'CHProxyRange'
  properties: {
    startIpAddress: '192.55.55.1'
    endIpAddress: '192.55.55.224'
  }
}

resource servers_sql_server_one_pdm_dev_name_ClientIPAddress_2021_09_17_06_26_43 'Microsoft.Sql/servers/firewallRules@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'ClientIPAddress_2021-09-17_06:26:43'
  properties: {
    startIpAddress: '106.51.104.52'
    endIpAddress: '106.51.104.52'
  }
}

resource servers_sql_server_one_pdm_dev_name_ClientIPAddress_2022_1_20_12_12_29 'Microsoft.Sql/servers/firewallRules@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'ClientIPAddress_2022-1-20_12-12-29'
  properties: {
    startIpAddress: '198.175.68.44'
    endIpAddress: '198.175.68.44'
  }
}

resource servers_sql_server_one_pdm_dev_name_FMProxyRange 'Microsoft.Sql/servers/firewallRules@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'FMProxyRange'
  properties: {
    startIpAddress: '192.55.52.192'
    endIpAddress: '192.55.52.224'
  }
}

resource servers_sql_server_one_pdm_dev_name_IINDProxyRange 'Microsoft.Sql/servers/firewallRules@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'IINDProxyRange'
  properties: {
    startIpAddress: '192.55.79.96'
    endIpAddress: '192.55.79.128'
  }
}

resource servers_sql_server_one_pdm_dev_name_JFProxyRange 'Microsoft.Sql/servers/firewallRules@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'JFProxyRange'
  properties: {
    startIpAddress: '134.134.139.72'
    endIpAddress: '134.134.139.88'
  }
}

resource servers_sql_server_one_pdm_dev_name_ORProxyRange 'Microsoft.Sql/servers/firewallRules@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'ORProxyRange'
  properties: {
    startIpAddress: '134.134.136.192'
    endIpAddress: '134.134.136.224'
  }
}

resource servers_sql_server_one_pdm_dev_name_PGProxyRange 'Microsoft.Sql/servers/firewallRules@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'PGProxyRange'
  properties: {
    startIpAddress: '192.198.147.171'
    endIpAddress: '192.198.147.224'
  }
}

resource servers_sql_server_one_pdm_dev_name_sqlvmmonitoring 'Microsoft.Sql/servers/firewallRules@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'sqlvmmonitoring'
  properties: {
    startIpAddress: '10.115.254.196'
    endIpAddress: '10.115.254.196'
  }
}

resource servers_sql_server_one_pdm_dev_name_ServiceManaged 'Microsoft.Sql/servers/keys@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'ServiceManaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_securityAlertPolicies_servers_sql_server_one_pdm_dev_name_Default 'Microsoft.Sql/servers/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'Default'
  properties: {
    state: 'Enabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: true
    retentionDays: 0
  }
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_servers_sql_server_one_pdm_dev_name_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'default'
  properties: {
#disable-next-line no-hardcoded-env-urls
    storageContainerPath: 'https://sqlvaisi7oajwyu6lw.blob.core.windows.net/vulnerability-assessment/'
    recurringScans: {
      isEnabled: true
      emailSubscriptionAdmins: true
      emails: []
    }
  }
}

resource servers_sql_server_one_pdm_dev_name_db_aml 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-aml'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'GeneralPurpose'
    capacity: 0
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 16106127360
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_dev_name_db_bom 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-bom'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'GeneralPurpose'
    capacity: 0
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_dev_name_db_change_order 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-change-order'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'GeneralPurpose'
    capacity: 0
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_dev_name_db_cicd_test 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-cicd-test'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'GeneralPurpose'
    capacity: 0
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 21474836480
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_dev_name_db_identity 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-identity'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'GeneralPurpose'
    capacity: 0
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_dev_name_db_item 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-item'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'GeneralPurpose'
    capacity: 0
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 53687091200
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_dev_name_db_misc 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_resource
  name: 'db-misc'
  location: 'westus'
  sku: {
    name: 'ElasticPool'
    tier: 'GeneralPurpose'
    capacity: 0
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    elasticPoolId: servers_sql_server_one_pdm_dev_name_db_elasticpool_dev.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/b6c9c478-52f2-4ff2-813b-e2fcb6197557/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_sql_server_one_pdm_dev_name_db_aml_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_bom_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
 
}

resource servers_sql_server_one_pdm_dev_name_db_change_order_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_cicd_test_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_identity_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
 
}

resource servers_sql_server_one_pdm_dev_name_db_item_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_misc_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_aml_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
 
}

resource servers_sql_server_one_pdm_dev_name_db_bom_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
 
}

resource servers_sql_server_one_pdm_dev_name_db_change_order_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_cicd_test_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
 
}

resource servers_sql_server_one_pdm_dev_name_db_identity_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_item_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
 
}

resource servers_sql_server_one_pdm_dev_name_db_misc_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_aml_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_bom_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_change_order_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_cicd_test_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_identity_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_item_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_misc_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_aml_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_bom_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_change_order_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_cicd_test_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_identity_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
 
}

resource servers_sql_server_one_pdm_dev_name_db_item_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_misc_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_aml_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_bom_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_change_order_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_cicd_test_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_identity_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_item_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_misc_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }

}

resource servers_sql_server_one_pdm_dev_name_db_aml_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'default'
  properties: {
    auditingState: 'Disabled'
  }
 
}

resource servers_sql_server_one_pdm_dev_name_db_bom_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'default'
  properties: {
    auditingState: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_change_order_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'default'
  properties: {
    auditingState: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_cicd_test_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'default'
  properties: {
    auditingState: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_identity_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'default'
  properties: {
    auditingState: 'Disabled'
  }
 
}

resource servers_sql_server_one_pdm_dev_name_db_item_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'default'
  properties: {
    auditingState: 'Disabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_misc_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'default'
  properties: {
    auditingState: 'Disabled'
  }
  
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_dev_name_db_aml_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
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

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_dev_name_db_bom_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
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

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_dev_name_db_change_order_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
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

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_dev_name_db_cicd_test_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
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

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_dev_name_db_identity_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
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

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_dev_name_db_item_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: [
      'SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP'
      'FAILED_DATABASE_AUTHENTICATION_GROUP'
      'BATCH_COMPLETED_GROUP'
    ]
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
 
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_server_one_pdm_dev_name_db_misc_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
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

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_aml_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_bom_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_change_order_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_cicd_test_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_identity_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_item_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_misc_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_aml_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
  
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_bom_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
  
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_change_order_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
  
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_cicd_test_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
 
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_identity_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
  
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_item_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
  
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_server_one_pdm_dev_name_db_misc_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
  
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_dev_name_db_aml_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
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

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_dev_name_db_bom_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
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

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_dev_name_db_change_order_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
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

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_dev_name_db_cicd_test_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
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

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_dev_name_db_identity_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
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

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_dev_name_db_item_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: [
      'SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP'
      'FAILED_DATABASE_AUTHENTICATION_GROUP'
      'BATCH_COMPLETED_GROUP'
    ]
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_server_one_pdm_dev_name_db_misc_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
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

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_dev_name_db_aml_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'Default'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_dev_name_db_bom_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'Default'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_dev_name_db_change_order_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'Default'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_dev_name_db_cicd_test_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'Default'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_dev_name_db_identity_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'Default'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_dev_name_db_item_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'Default'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_server_one_pdm_dev_name_db_misc_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'Default'

  properties: {
    state: 'Enabled'
  }
  
}

resource servers_sql_server_one_pdm_dev_name_db_aml_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'current'
  properties: {}
  
}

resource servers_sql_server_one_pdm_dev_name_db_bom_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'current'
  properties: {}
  
}

resource servers_sql_server_one_pdm_dev_name_db_change_order_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'current'
  properties: {}
  
}

resource servers_sql_server_one_pdm_dev_name_db_cicd_test_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'current'
  properties: {}
  
}

resource servers_sql_server_one_pdm_dev_name_db_identity_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'current'
  properties: {}
  
}

resource servers_sql_server_one_pdm_dev_name_db_item_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'current'
  properties: {}
  
}

resource servers_sql_server_one_pdm_dev_name_db_misc_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'current'
  properties: {}
  
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_dev_name_db_aml_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
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
  
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_dev_name_db_bom_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
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
  
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_dev_name_db_change_order_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
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
 
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_dev_name_db_cicd_test_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
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
  
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_dev_name_db_identity_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
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
  
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_dev_name_db_item_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
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
  
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_server_one_pdm_dev_name_db_misc_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
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
  
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_dev_name_db_aml_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_dev_name_db_bom_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_dev_name_db_change_order_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_dev_name_db_cicd_test_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_dev_name_db_identity_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_dev_name_db_item_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_server_one_pdm_dev_name_db_misc_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_dev_name_db_aml_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_aml
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
      emails: []
    }
  }
 
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_dev_name_db_bom_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_bom
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
      emails: []
    }
  }
  
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_dev_name_db_change_order_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_change_order
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
      emails: []
    }
  }
 
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_dev_name_db_cicd_test_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_cicd_test
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
      emails: []
    }
  }
  
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_dev_name_db_identity_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_identity
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
      emails: []
    }
  }
 
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_dev_name_db_item_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_item
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
      emails: []
    }
  }
  
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_server_one_pdm_dev_name_db_misc_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-05-01-preview' = {
  parent: servers_sql_server_one_pdm_dev_name_db_misc
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
      emails: []
    }
  }
  
}
