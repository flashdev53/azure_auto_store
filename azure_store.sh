#!/bin/bash

RESOURCE_GROUP="devdemo-rg"
STORAGE_ACCOUNT="demostore$RANDOM"
CONTAINER_NAME="devdemocontainer"
FILE_NAME="demo.txt"
LOCATION="centralindia"

echo "Starting Azure Storage Automation..."

echo "Demo text content" > $FILE_NAME
echo "Test file created: $FILE_NAME"

az group create --name $RESOURCE_GROUP  --location $LOCATION
echo "Resource group created: $RESOURCE_GROUP"

az storage account create \
    --name $STORAGE_ACCOUNT \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION \
    --sku Standard_LRS
echo "Storage account created: $STORAGE_ACCOUNT"

STORAGE_KEY=$(az storage account keys list \
    --resource-group $RESOURCE_GROUP \
    --account-name $STORAGE_ACCOUNT \
    --query "[0].value" -o tsv)
echo "Retrieved storage account key"

az storage container create \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT \
  --account-key $STORAGE_KEY
echo "Container created: $CONTAINER_NAME"

az storage blob upload \
  --container-name $CONTAINER_NAME \
  --file $FILE_NAME \
  --name $FILE_NAME \
  --account-name $STORAGE_ACCOUNT \
  --account-key $STORAGE_KEY
echo "File uploaded: $FILE_NAME"

echo "Files inside container:"
az storage blob list \
  --container-name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT \
  --account-key $STORAGE_KEY \
  -o table