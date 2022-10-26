param name string
param location string = resourceGroup().location
param tags object = {}

param keyVaultName string
param connectionStringKey string = 'AZURE-COSMOS-CONNECTION-STRING'

module cosmos '../../cosmos/cosmos-account.bicep' = {
  name: 'cosmos-account'
  params: {
    name: name
    location: location
    connectionStringKey: connectionStringKey
    keyVaultName: keyVaultName
    kind: 'MongoDB'
    tags: tags
  }
}

output endpoint string = cosmos.outputs.endpoint
output connectionStringKey string = cosmos.outputs.connectionStringKey
output resourceId string = cosmos.outputs.resourceId
