#!/bin/bash


connect_deployment()
{
    AZURE_SUBSCRIPTION_ID="4ce27a75-a843-43b4-99ed-006804c35d7e"
    echo $AZURE_SUBSCRIPTION_ID

    #az login
    echo 'az login and set subscription'
    az account set --subscription $AZURE_SUBSCRIPTION_ID

    echo 'az account show'
    az account show

    LOCATION="uksouth"
    DEPLOYMENT_NAME="policy-"$LOCATION 
    AZ_PAC_LIBRARY_PATH="https://raw.githubusercontent.com/dbantawa22/NewCo-Azure-CTF-PACLibrary/main/"


    echo '------------------- Policy Definition --------------------'
    echo $DEPLOYMENT_NAME

    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-definition-deployment-policies-JSON --template-file --parameters ./Parameters/assignment_enforce_AG_WAF.parameters.json


    echo '------------------- Policy Set Definition --------------------'
    echo $DEPLOYMENT_NAME
    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --template-file ./PolicySetDefinitions/policyset_network_traffic_logs.json --name policy-network_traffic_logs

    # az deployment sub create --name $DEPLOYMENT_NAME --location $LOCATION --template-uri $AZ_PAC_LIBRARY_PATH"BICEP-azure-security-policies-subscription/main"

    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --template-file  ./PolicySetDefinitions/policyset_not_allowed_resource_types.json --name policy-Deployment-17

    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --template-file  ./policyset_allowed_vm_sizes.json --name policy-Deployment-15

    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-denyIP --template-file ./PolicySetDefinitions/policyset_denyIP.json --parameters ./Parameters/assignment_denyIP.parameters.json

    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --template-file ./DENY-PublicEndpointsPolicySetDefinition.json --name policy-Deployment-3

    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --template-file ./policyset_ipforwarding.json --name policy-Deployment-6
    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-network_traffic --template-file ./PolicySetDefinitions/policyset_network_traffic.json --parameters ./Parameters/assignment_network_traffic.parameters.json 
   
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --template-file ./policyset_diagnostic_settings.json --name policy-Deployment-10
    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --template-file ./policyset_log_storage.json --name policy-Deployment-11
    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-allowed-locations --template-file ./PolicySetDefinitions/policyset_allowed_locations.json --parameters ./Parameters/assignment_allowed_locations.parameters.json

    ## Policy Set - KV TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-kv --template-file ./PolicySetDefinitions/policyset_keyvault.json --parameters ./Parameters/assignment_keyvault.parameters.json
    
    ## Policy Set - VM Sizes TESTING ##    
    #az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-allowed-vms --template-file ./PolicySetDefinitions/policyset_allowed_vm_sizes.json --parameters ./Parameters/assignment_allowed_vm_sizes.parameters.json
    
    ## Policy Set - Tagging TESTING ##
    #az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-tagging --template-file ./PolicySetDefinitions/policyset_tagging.json --parameters ./Parameters/assignment_tagging.parameters.json

    ## Policy Set - Diagnostic Settings TESTING ##
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-diagnostic-settings --template-file ./PolicySetDefinitions/policyset_diagnostic_settings.json --parameters ./Parameters/assignment_diagnostic_settings.parameters.json

    ## Policy Set - VM Backup TESTING ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-vm-backup --template-file ./PolicySetDefinitions/policyset_vm_backup.json --parameters ./Parameters/assignment_vm_backup.parameters.json

    ## Policy Set - DDoS TESTING ##    
    #az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-ddos --template-file ./PolicySetDefinitions/policyset_ddos.json --parameters ./Parameters/assignment_ddos.parameters.json
    
    ## Policy Set - Private DNS TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-Private-DNS-Zone --template-file ./PolicySetDefinitions/DINE-PrivateDNSZonesPolicySetDefinition.json --parameters ./Parameters/assignment_DINE-PrivateDNSZonesPolicySetDefinition.parameters.json

    # ## Policy Set - IP Forwarding TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-IP-Forwarding --template-file ./PolicySetDefinitions/policyset_ipforwarding.json

    # ## Policy Set - TLS SSL Encryption in Transit TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-TLS-SSL --template-file ./PolicySetDefinitions/policyset_TLS_SSL_Encryption.json --parameters ./Parameters/assignment_TLS_SSL_Encryption.parameters.json

    # ## Policy Set - Deny Audit Resources with Encryption TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-CMK-Encryption --template-file ./PolicySetDefinitions/policyset_CMK_Encryption.json --parameters ./Parameters/assignment_CMK_Encryption.parameters.json

    # ## Policy Set - Deploy Diagnostic Settings for Azure Resources TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-deploy-DiagnosticSettings --template-file ./PolicySetDefinitions/policyset_deployDiagnosticSettings.json --parameters ./Parameters/assignment_deployDiagnosticSettings.parameters.json

    # ## Policy Set - WAF TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-definition-Enforce-AG-WAF2 --template-file ./PolicySetDefinitions/policyset_enforce_AG_WAF.json --parameters ./Parameters/assignment_enforce_AG_WAF.parameters.json


    echo '------------------- Policy Set Assignments --------------------'
    echo $DEPLOYMENT_NAME

    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-denyIP --template-file ./Assignments/assignment_denyIP.json --parameters ./Parameters/assignment_denyIP.parameters.json
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-network_traffic --template-file ./Assignments/assignment_network_traffic.json --parameters ./Parameters/assignment_network_traffic.parameters.json
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-not_allowed_resource_types --template-file ./Assignments/assignment_not_allowed_resource_types.json --parameters ./Parameters/assignment_not_allowed_resource_types.parameters.json
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-network_traffic_logs --template-file ./Assignments/assignment_network_traffic_logs.json --parameters ./Parameters/assignment_network_traffic_logs.parameters.json

    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-allowed_locations --template-file ./Assignments/assignment_allowed_locations.json --parameters ./Parameters/assignment_allowed_locations.parameters.json

    ## Assignment - KV TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-keyvault --template-file ./Assignments/assignment_keyvault.json --parameters ./Parameters/assignment_keyvault.parameters.json

    ## Assignment - VM Sizes TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-allowed-vms --template-file ./Assignments/assignment_allowed_vm_sizes.json --parameters ./Parameters/assignment_allowed_vm_sizes.parameters.json

    # ## Assignment - DDoS TESTING ##    
    #az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-ddos --template-file ./Assignments/assignment_ddos.json --parameters ./Parameters/assignment_ddos.parameters.json

    # ## Assignment - Tagging TESTING ##    
    #az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-tagging --template-file ./Assignments/assignment_tagging.json --parameters ./Parameters/assignment_tagging.parameters.json

    # ## Assignment - Diagnostic Settings TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-diagnostic-settings --template-file ./Assignments/assignment_diagnostic_settings.json --parameters ./Parameters/assignment_diagnostic_settings.parameters.json

    # ## Assignment - VM Backup TESTING ##    
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-vm-backup --template-file ./Assignments/assignment_vm_backup.json --parameters ./Parameters/assignment_vm_backup.parameters.json

    # ## Assignment - DNS Zone DINE TESTING ##
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-Private-DNS-Zone --template-file ./Assignments/assignment_DINE-PrivateDNSZonesPolicySetDefinition.json --parameters ./Parameters/assignment_DINE-PrivateDNSZonesPolicySetDefinition.parameters.json

    # ## Assignment - IP Forwarding TESTING ##
    #az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-IP-Forwarding --template-file ./Assignments/assignment_ipforwarding.json

    # ## Assignment - TLS SSL Encryption in Transit TESTING ##
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-TLS-SSL --template-file ./Assignments/assignment_TLS_SSL_Encryption.json --parameters ./Parameters/assignment_TLS_SSL_Encryption.parameters.json

    # ## Assignment - Deny Audit Resources with Encryption TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name assignment-CMK_Encryption --template-file ./Assignments/assignment_CMK_Encryption.json --parameters ./Parameters/assignment_CMK_Encryption.parameters.json

    # ## Assignment - Deploy Diagnostic Settings for Azure Resources TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name assignment-definition-deploy-DiagnosticSettings --template-file ./Assignments/assignment_deployDiagnosticSettings.json --parameters ./Parameters/assignment_deployDiagnosticSettings.parameters.json

    # ## Assignment - WAF TESTING ##    
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-enforce_AG_WAF2 --template-file ./Assignments/assignment_enforce_AG_WAF.json --parameters ./Parameters/assignment_enforce_AG_WAF.parameters.json


    # echo '------------------- Allowed Locations Assignments - with Parameters --------------------'
    # echo $DEPLOYMENT_NAME

    # az account set --subscription "aa7b5893-24b8-48f5-9be6-5544ef964417"
    # az account set --name "Vitor - Visual Studio Enterprise Subscription"
    # az deployment sub create --location eastus --name policy-set-assignment-allowed_locations_eastus --template-file ./Assignments/assignment_allowed_locations.json --parameters ./Parameters/assignment_allowed_locations_eus.parameters.json

    # # az account set --subscription "aa7b5893-24b8-48f5-9be6-5544ef964417"
    # # az account set --name "Vitor - Visual Studio Enterprise Subscription"
    # # az deployment sub create --location eastus2 --name policy-set-assignment-allowed_locations_eastus2 --template-file ./Assignments/assignment_allowed_locations.json --parameters ./Parameters/assignment_allowed_locations_eus2.parameters.json
    
    # az account set --subscription "7d0ec199-2cbe-447f-a0ff-f0d813582a21"
    # az account set --name "Professional 1"
    # az deployment sub create --location northeurope --name policy-set-assignment-allowed_locations_northeurope --template-file ./Assignments/assignment_allowed_locations.json --parameters ./Parameters/assignment_allowed_locations_neu.parameters.json
    
    # az account set --subscription "4ce27a75-a843-43b4-99ed-006804c35d7e"
    # az account set --name "Vitor MSDN Premium"
    # az deployment sub create --location uksouth --name policy-set-assignment-allowed_locations_southuk --template-file ./Assignments/assignment_allowed_locations.json --parameters ./Parameters/assignment_allowed_locations_suk.parameters.json
    
    # az account set --subscription "0808dcbf-2e54-48d8-9ef9-7e899fd4eddc"
    # az account set --name "Vitor - Visual Studio Professional Subscription"
    # az deployment sub create --location westus2 --name policy-set-assignment-allowed_locations_westus2 --template-file ./Assignments/assignment_allowed_locations.json --parameters ./Parameters/assignment_allowed_locations_wus2.parameters.json


}


main() {
    echo "Start MAIN()"
    connect_deployment    
    echo "End MAIN()"
}


main