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
    AZ_PAC_LIBRARY_PATH="https://raw.githubusercontent.com/dbantawa22/CRBGF-Azure-CTF-PACCloudCore/main/"


    echo '------------------- Policy Assignments --------------------'
    echo $DEPLOYMENT_NAME

    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-denyIP --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_denyIP.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_denyIP.parameters.json
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-network_traffic --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_network_traffic.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_network_traffic.parameters.json
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-not_allowed_resource_types --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_not_allowed_resource_types.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_not_allowed_resource_types.parameters.json
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-network_traffic_logs --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_network_traffic_logs.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_network_traffic_logs.parameters.json
    # az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-set-assignment-allowed_locations --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_allowed_locations.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_allowed_locations.parameters.json

    ## Assignment - KV ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-assignment-Key-Vault --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_keyvault.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_keyvault.parameters.json

    ## Assignment - VM Sizes ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-assignment-Allowed-VM-SKUs --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_allowed_vm_sizes.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_allowed_vm_sizes.parameters.json

    ## Assignment - Tagging ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-assignment-Tagging --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_tagging.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_tagging.parameters.json

    ## Assignment - Diagnostic Settings ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-assignment-diagnostic-settings --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_diagnostic_settings.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_diagnostic_settings.parameters.json

    ## Assignment - VM Backup ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-assignment-VM-Backup --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_vm_backup.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_vm_backup.parameters.json

    ## Assignment - DDoS ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-assignment-DDoS --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_ddos.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_ddos.parameters.json

    ## Assignment - Private DNS Zone ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-assignment-Private-DNS-Zone --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_DINE-PrivateDNSZonesPolicySetDefinition.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_DINE-PrivateDNSZonesPolicySetDefinition.parameters.json

    ## Assignment - Deny IP Forwarding ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-assignment-Deny-IP-Forwarding --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_deny_ipforwarding.json

    ## Assignment - TLS SSL Encryption in Transit ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-assignment-TLS-SSL-Encryption --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_TLS_SSL_Encryption.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_TLS_SSL_Encryption.parameters.json

    ## Assignment - Deny Audit Resources with Encryption ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-assignment-CMK_Encryption --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_CMK_Encryption.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_CMK_Encryption.parameters.json

    ## Assignment - Diagnostic Settings to LAW ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-assignment-Diagnostic-Settings-to-LAW --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_diagnosticSettings_toLAW.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_diagnosticSettings_toLAW.parameters.json

    ## Assignment - AG WAF ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-assignment-Enforce-AG-WAF --template-file ./CTF-PAC-Assignment-Library/Policy-Assignments/assignment_enforce_AG_WAF.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_enforce_AG_WAF.parameters.json

}


main() {
    echo "Start MAIN()"
    connect_deployment    
    echo "End MAIN()"
}


main