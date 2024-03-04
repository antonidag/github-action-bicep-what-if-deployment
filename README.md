# Github Action Bicep what-if deployment
## Description
Project files for building, validating and preforming what-if deployment. 

See my full blog post [here](https://www.antonbjorkman.com)!
## Installation
Let's gather our tools:

- Az CLI 🧙
- Az Bicep extension
```
az bicep install
```
__Step 1:__ Login to Azure

```
az login
```
This will prompt a new window in your browser and allow you to log in to your account.

__Step 2:__ Set the subscription
```
az account set --subscription {SUBSCRIPTION_ID} 
```
__Step 3:__ Build Bicep template 
```
az bicep build --file main.bicep
```

__Step 4:__ Validate the deployment
```
az deployment group validate 
--resource-group {RESOURCE_GROUP} 
--name ValidateDeployment  
--template-file main.bicep 
--parameters main.bicepparam
```

__Step 5:__ Perform a What-if deployment
```
az deployment group what-if 
--resource-group {RESOURCE_GROUP} 
--name WhatIfDeployment 
--template-file main.bicep 
--parameters main.bicepparam
```
