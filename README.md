# Azure CLI Storage

This project demonstrates how to use **Azure CLI** to automate the creation of a storage account, container, and upload a file.

## What this script does
- Creates a **resource group**
- Creates a **storage account**
- Creates a **container**
- Uploads a **sample file**
- Lists files in the container

## Usage
Clone this repo:

```bash
git clone https://github.com/flashdev53/azure_auto_store.git
cd azure_auto_store
```

Make the script executable:

```bash
chmod +x azure_store.sh
```
Run the script:

```bash
./azure_store.sh
```
**Important**: Azure resources cost money/credits (small for storage, but still).
If this is just for practice, you can clean up everything by deleting the resource group when done:

```bash
az group delete --name devdemo-rg --yes --no-wait
```
# Contributing
Pull requests are welcome!
If you’d like to add features (like branch customization, repo descriptions, or private repo support), open an issue first.