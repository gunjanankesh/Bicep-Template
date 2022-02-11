{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
      "vulnerabilityAssessments_Default_storageContainerPath": {
          "type": "SecureString"
      },
      "servers_sql_server_one_pdm_ankesh_name": {
          "defaultValue": "sql-server-one-pdm-ankesh",
          "type": "String"
      }
  },
  "variables": {},
  "resources": [
      {
          "type": "Microsoft.Sql/servers",
          "apiVersion": "2021-05-01-preview",
          "name": "[parameters('servers_sql_server_one_pdm_ankesh_name')]",
          "location": "westus",
          "kind": "v12.0",
          "identity": {
              "type": "SystemAssigned"
          },
          "properties": {
              "administratorLogin": "one_pdm_admin",
              "version": "12.0",
              "publicNetworkAccess": "Enabled",
              "keyId": "https://ankesh-key-vault.vault.azure.net/keys/custom-key/ac1be1217a7d4603bd88fc52bb87e662",
              "restrictOutboundNetworkAccess": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/CreateIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/DbParameterization')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/DefragmentIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/DropIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/ForceLastGoodPlan')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/auditingPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "auditingState": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/auditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "auditActionsAndGroups": [],
              "isStorageSecondaryKeyInUse": false,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/connectionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/default')]",
          "location": "westus",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "connectionType": "Default"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/master/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "auditingState": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/master/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/extendedAuditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/master/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/geoBackupPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/master/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/ledgerDigestUploads",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/master/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {}
      },
      {
          "type": "Microsoft.Sql/servers/databases/securityAlertPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/master/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Disabled",
              "disabledAlerts": [
                  ""
              ],
              "emailAddresses": [
                  ""
              ],
              "emailAccountAdmins": false,
              "retentionDays": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/master/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/vulnerabilityAssessments",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/master/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "recurringScans": {
                  "isEnabled": false,
                  "emailSubscriptionAdmins": true
              }
          }
      },
      {
          "type": "Microsoft.Sql/servers/devOpsAuditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/elasticPools",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-elasticpool-dev')]",
          "location": "westus",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "sku": {
              "name": "BasicPool",
              "tier": "Basic",
              "capacity": 100
          },
          "kind": "pool",
          "properties": {
              "maxSizeBytes": 10485760000,
              "perDatabaseSettings": {
                  "minCapacity": 0,
                  "maxCapacity": 5
              },
              "zoneRedundant": false,
              "maintenanceConfigurationId": "/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default"
          }
      },
      {
          "type": "Microsoft.Sql/servers/encryptionProtector",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "kind": "azurekeyvault",
          "properties": {
              "serverKeyName": "ankesh-key-vault_custom-key_ac1be1217a7d4603bd88fc52bb87e662",
              "serverKeyType": "AzureKeyVault",
              "autoRotationEnabled": false
          }
      },
      {
          "type": "Microsoft.Sql/servers/extendedAuditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "auditActionsAndGroups": [],
              "isStorageSecondaryKeyInUse": false,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/keys",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/ankesh-key-vault_custom-key_ac1be1217a7d4603bd88fc52bb87e662')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "kind": "azurekeyvault",
          "properties": {
              "serverKeyType": "AzureKeyVault",
              "uri": "https://ankesh-key-vault.vault.azure.net/keys/custom-key/ac1be1217a7d4603bd88fc52bb87e662"
          }
      },
      {
          "type": "Microsoft.Sql/servers/keys",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/ServiceManaged')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "kind": "servicemanaged",
          "properties": {
              "serverKeyType": "ServiceManaged"
          }
      },
      {
          "type": "Microsoft.Sql/servers/securityAlertPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Disabled",
              "disabledAlerts": [
                  ""
              ],
              "emailAddresses": [
                  ""
              ],
              "emailAccountAdmins": false,
              "retentionDays": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/vulnerabilityAssessments",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "recurringScans": {
                  "isEnabled": false,
                  "emailSubscriptionAdmins": true
              },
              "storageContainerPath": "[parameters('vulnerabilityAssessments_Default_storageContainerPath')]"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml')]",
          "location": "westus",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]",
              "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]"
          ],
          "sku": {
              "name": "ElasticPool",
              "tier": "Basic",
              "capacity": 0
          },
          "kind": "v12.0,user,pool",
          "properties": {
              "collation": "SQL_Latin1_General_CP1_CI_AS",
              "maxSizeBytes": 2147483648,
              "elasticPoolId": "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]",
              "catalogCollation": "SQL_Latin1_General_CP1_CI_AS",
              "zoneRedundant": false,
              "readScale": "Disabled",
              "requestedBackupStorageRedundancy": "Geo",
              "maintenanceConfigurationId": "/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default",
              "isLedgerOn": false
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom')]",
          "location": "westus",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]",
              "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]"
          ],
          "sku": {
              "name": "ElasticPool",
              "tier": "Basic",
              "capacity": 0
          },
          "kind": "v12.0,user,pool",
          "properties": {
              "collation": "SQL_Latin1_General_CP1_CI_AS",
              "maxSizeBytes": 2147483648,
              "elasticPoolId": "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]",
              "catalogCollation": "SQL_Latin1_General_CP1_CI_AS",
              "zoneRedundant": false,
              "readScale": "Disabled",
              "requestedBackupStorageRedundancy": "Geo",
              "maintenanceConfigurationId": "/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default",
              "isLedgerOn": false
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order')]",
          "location": "westus",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]",
              "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]"
          ],
          "sku": {
              "name": "ElasticPool",
              "tier": "Basic",
              "capacity": 0
          },
          "kind": "v12.0,user,pool",
          "properties": {
              "collation": "SQL_Latin1_General_CP1_CI_AS",
              "maxSizeBytes": 2147483648,
              "elasticPoolId": "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]",
              "catalogCollation": "SQL_Latin1_General_CP1_CI_AS",
              "zoneRedundant": false,
              "readScale": "Disabled",
              "requestedBackupStorageRedundancy": "Geo",
              "maintenanceConfigurationId": "/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default",
              "isLedgerOn": false
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test')]",
          "location": "westus",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]",
              "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]"
          ],
          "sku": {
              "name": "ElasticPool",
              "tier": "Basic",
              "capacity": 0
          },
          "kind": "v12.0,user,pool",
          "properties": {
              "collation": "SQL_Latin1_General_CP1_CI_AS",
              "maxSizeBytes": 2147483648,
              "elasticPoolId": "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]",
              "catalogCollation": "SQL_Latin1_General_CP1_CI_AS",
              "zoneRedundant": false,
              "readScale": "Disabled",
              "requestedBackupStorageRedundancy": "Geo",
              "maintenanceConfigurationId": "/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default",
              "isLedgerOn": false
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity')]",
          "location": "westus",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]",
              "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]"
          ],
          "sku": {
              "name": "ElasticPool",
              "tier": "Basic",
              "capacity": 0
          },
          "kind": "v12.0,user,pool",
          "properties": {
              "collation": "SQL_Latin1_General_CP1_CI_AS",
              "maxSizeBytes": 2147483648,
              "elasticPoolId": "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]",
              "catalogCollation": "SQL_Latin1_General_CP1_CI_AS",
              "zoneRedundant": false,
              "readScale": "Disabled",
              "requestedBackupStorageRedundancy": "Geo",
              "maintenanceConfigurationId": "/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default",
              "isLedgerOn": false
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item')]",
          "location": "westus",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]",
              "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]"
          ],
          "sku": {
              "name": "ElasticPool",
              "tier": "Basic",
              "capacity": 0
          },
          "kind": "v12.0,user,pool",
          "properties": {
              "collation": "SQL_Latin1_General_CP1_CI_AS",
              "maxSizeBytes": 2147483648,
              "elasticPoolId": "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]",
              "catalogCollation": "SQL_Latin1_General_CP1_CI_AS",
              "zoneRedundant": false,
              "readScale": "Disabled",
              "requestedBackupStorageRedundancy": "Geo",
              "maintenanceConfigurationId": "/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default",
              "isLedgerOn": false
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc')]",
          "location": "westus",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]",
              "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]"
          ],
          "sku": {
              "name": "ElasticPool",
              "tier": "Basic",
              "capacity": 0
          },
          "kind": "v12.0,user,pool",
          "properties": {
              "collation": "SQL_Latin1_General_CP1_CI_AS",
              "maxSizeBytes": 2147483648,
              "elasticPoolId": "[resourceId('Microsoft.Sql/servers/elasticPools', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-elasticpool-dev')]",
              "catalogCollation": "SQL_Latin1_General_CP1_CI_AS",
              "zoneRedundant": false,
              "readScale": "Disabled",
              "requestedBackupStorageRedundancy": "Geo",
              "maintenanceConfigurationId": "/subscriptions/3da4efcf-bbd7-4627-b177-57bffc2fe144/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default",
              "isLedgerOn": false
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/CreateIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/CreateIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/CreateIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/CreateIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/CreateIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/CreateIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/CreateIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/DbParameterization')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/DbParameterization')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/DbParameterization')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/DbParameterization')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/DbParameterization')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/DbParameterization')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/DbParameterization')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/DefragmentIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/DefragmentIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/DefragmentIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/DefragmentIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/DefragmentIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/DefragmentIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/DefragmentIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/DropIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/DropIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/DropIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/DropIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/DropIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/DropIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/DropIndex')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/ForceLastGoodPlan')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/ForceLastGoodPlan')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/ForceLastGoodPlan')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/ForceLastGoodPlan')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/ForceLastGoodPlan')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/ForceLastGoodPlan')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/advisors",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/ForceLastGoodPlan')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "autoExecuteValue": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "auditingState": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "auditingState": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "auditingState": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "auditingState": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "auditingState": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "auditingState": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "auditingState": "Disabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/auditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "weeklyRetention": "PT0S",
              "monthlyRetention": "PT0S",
              "yearlyRetention": "PT0S",
              "weekOfYear": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "weeklyRetention": "PT0S",
              "monthlyRetention": "PT0S",
              "yearlyRetention": "PT0S",
              "weekOfYear": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "weeklyRetention": "PT0S",
              "monthlyRetention": "PT0S",
              "yearlyRetention": "PT0S",
              "weekOfYear": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "weeklyRetention": "PT0S",
              "monthlyRetention": "PT0S",
              "yearlyRetention": "PT0S",
              "weekOfYear": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "weeklyRetention": "PT0S",
              "monthlyRetention": "PT0S",
              "yearlyRetention": "PT0S",
              "weekOfYear": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "weeklyRetention": "PT0S",
              "monthlyRetention": "PT0S",
              "yearlyRetention": "PT0S",
              "weekOfYear": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "weeklyRetention": "PT0S",
              "monthlyRetention": "PT0S",
              "yearlyRetention": "PT0S",
              "weekOfYear": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 7,
              "diffBackupIntervalInHours": 24
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 7,
              "diffBackupIntervalInHours": 24
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 7,
              "diffBackupIntervalInHours": 24
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 7,
              "diffBackupIntervalInHours": 24
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 7,
              "diffBackupIntervalInHours": 24
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 7,
              "diffBackupIntervalInHours": 24
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 7,
              "diffBackupIntervalInHours": 24
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/extendedAuditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/extendedAuditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/extendedAuditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/extendedAuditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/extendedAuditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/extendedAuditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/extendedAuditingSettings",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "retentionDays": 0,
              "isAzureMonitorTargetEnabled": false,
              "state": "Disabled",
              "storageAccountSubscriptionId": "00000000-0000-0000-0000-000000000000"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/geoBackupPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/geoBackupPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/geoBackupPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/geoBackupPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/geoBackupPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/geoBackupPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/geoBackupPolicies",
          "apiVersion": "2014-04-01",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/Default')]",
          "location": "West US",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/ledgerDigestUploads",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {}
      },
      {
          "type": "Microsoft.Sql/servers/databases/ledgerDigestUploads",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {}
      },
      {
          "type": "Microsoft.Sql/servers/databases/ledgerDigestUploads",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {}
      },
      {
          "type": "Microsoft.Sql/servers/databases/ledgerDigestUploads",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {}
      },
      {
          "type": "Microsoft.Sql/servers/databases/ledgerDigestUploads",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {}
      },
      {
          "type": "Microsoft.Sql/servers/databases/ledgerDigestUploads",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {}
      },
      {
          "type": "Microsoft.Sql/servers/databases/ledgerDigestUploads",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {}
      },
      {
          "type": "Microsoft.Sql/servers/databases/securityAlertPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Disabled",
              "disabledAlerts": [
                  ""
              ],
              "emailAddresses": [
                  ""
              ],
              "emailAccountAdmins": false,
              "retentionDays": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/securityAlertPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Disabled",
              "disabledAlerts": [
                  ""
              ],
              "emailAddresses": [
                  ""
              ],
              "emailAccountAdmins": false,
              "retentionDays": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/securityAlertPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Disabled",
              "disabledAlerts": [
                  ""
              ],
              "emailAddresses": [
                  ""
              ],
              "emailAccountAdmins": false,
              "retentionDays": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/securityAlertPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Disabled",
              "disabledAlerts": [
                  ""
              ],
              "emailAddresses": [
                  ""
              ],
              "emailAccountAdmins": false,
              "retentionDays": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/securityAlertPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Disabled",
              "disabledAlerts": [
                  ""
              ],
              "emailAddresses": [
                  ""
              ],
              "emailAccountAdmins": false,
              "retentionDays": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/securityAlertPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Disabled",
              "disabledAlerts": [
                  ""
              ],
              "emailAddresses": [
                  ""
              ],
              "emailAccountAdmins": false,
              "retentionDays": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/securityAlertPolicies",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Disabled",
              "disabledAlerts": [
                  ""
              ],
              "emailAddresses": [
                  ""
              ],
              "emailAccountAdmins": false,
              "retentionDays": 0
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/Current')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "state": "Enabled"
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/vulnerabilityAssessments",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-aml/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-aml')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "recurringScans": {
                  "isEnabled": false,
                  "emailSubscriptionAdmins": true
              }
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/vulnerabilityAssessments",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-bom/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-bom')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "recurringScans": {
                  "isEnabled": false,
                  "emailSubscriptionAdmins": true
              }
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/vulnerabilityAssessments",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-change-order/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-change-order')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "recurringScans": {
                  "isEnabled": false,
                  "emailSubscriptionAdmins": true
              }
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/vulnerabilityAssessments",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-cicd-test/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-cicd-test')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "recurringScans": {
                  "isEnabled": false,
                  "emailSubscriptionAdmins": true
              }
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/vulnerabilityAssessments",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-identity/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-identity')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "recurringScans": {
                  "isEnabled": false,
                  "emailSubscriptionAdmins": true
              }
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/vulnerabilityAssessments",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-item/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-item')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "recurringScans": {
                  "isEnabled": false,
                  "emailSubscriptionAdmins": true
              }
          }
      },
      {
          "type": "Microsoft.Sql/servers/databases/vulnerabilityAssessments",
          "apiVersion": "2021-05-01-preview",
          "name": "[concat(parameters('servers_sql_server_one_pdm_ankesh_name'), '/db-misc/Default')]",
          "dependsOn": [
              "[resourceId('Microsoft.Sql/servers/databases', parameters('servers_sql_server_one_pdm_ankesh_name'), 'db-misc')]",
              "[resourceId('Microsoft.Sql/servers', parameters('servers_sql_server_one_pdm_ankesh_name'))]"
          ],
          "properties": {
              "recurringScans": {
                  "isEnabled": false,
                  "emailSubscriptionAdmins": true
              }
          }
      }
  ]
}
