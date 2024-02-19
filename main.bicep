@description('Specifies the geographical location where the storage account will be deployed.')
param location string = 'northeurope'
@description('Specifies the name of the storage account. Ensure it is unique within Azure and follows naming conventions.')
@maxLength(24)
@minLength(3)
param storageName string

@description('Defines the type of storage account to create. Options include BlobStorage, BlockBlobStorage, FileStorage, Storage, and StorageV2. Default is StorageV2, offering the latest features and performance enhancements.')
@allowed([ 'BlobStorage'
  'BlockBlobStorage'
  'FileStorage'
  'Storage'
  'StorageV2' ])
param kind string = 'StorageV2'

@description('Specifies the SKU (Stock Keeping Unit) for the storage account. SKUs determine pricing, availability, and performance characteristics. Options include Premium_LRS, Premium_ZRS, Standard_GRS, Standard_GZRS, Standard_LRS, Standard_RAGRS, Standard_RAGZRS, and Standard_ZRS. Default is Standard_LRS.')
@allowed([ 'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS' ])
param skuName string = 'Standard_LRS'

@description('Specifies the access tier for the storage account. Options include Hot or Cool. Hot access tier is suitable for frequently accessed data, while Cool access tier is ideal for infrequently accessed data with lower storage costs. Leave blank for the default access tier.')
@allowed([
  'Hot'
  'Cold'
])
param accessTier string

resource storageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  sku: {
    name: skuName
  }
  kind: kind
  name: storageName
  location: location
  properties: {
    accessTier: accessTier
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}
