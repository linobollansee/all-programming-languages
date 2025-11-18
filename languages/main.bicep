// Bicep (Azure IaC)
param location string = 'eastus'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'helloworld${uniqueString(resourceGroup().id)}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

output message string = 'Hello, World!'
