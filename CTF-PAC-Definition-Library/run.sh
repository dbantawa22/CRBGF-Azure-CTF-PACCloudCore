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


    echo '------------------- Policy Definition --------------------'
    echo $DEPLOYMENT_NAME

    ## policies.json - Policy Definitions ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-definition-policies-JSON --template-file ./CTF-PAC-Definition-Library/Policy-Definitions/policies.json


    echo '------------------- Policy Initiative --------------------'
    echo $DEPLOYMENT_NAME
    
    ## Policy Initiative - Network Traffic Logs ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-network-traffic-logs --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_network_traffic_logs.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_network_traffic_logs.parameters.json
    
    ## Policy Initiative - Not Allowed Resource Types ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-not-allowed-resource-types --template-file  ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_not_allowed_resource_types.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_not_allowed_resource_types.parameters.json
    
    ## Policy Initiative - Deny Public IP ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-deny-Public-IP --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_deny_publicIP.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_deny_publicIP.parameters.json
    
    ## Policy Initiative - Public Endpoints ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-public-endpoints --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_DENY-PublicEndpoints.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_DENY-PublicEndpoints.parameters.json
    
    ## Policy Initiative - Network Traffic Control ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-network-traffic-control --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_network_traffic_control.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_network_traffic_control.parameters.json 
    
    ## Policy Initiative - Allowed Locations ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-allowed-locations --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_allowed_locations.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_allowed_locations.parameters.json

    ## Policy Initiative - KV ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-Key-Vault --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_keyvault.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_keyvault.parameters.json
    
    ## Policy Initiative - VM Sizes ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-Allowed-VM-SKUs --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_allowed_vm_sizes.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_allowed_vm_sizes.parameters.json
    
    ## Policy Initiative - Tagging ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-Tagging --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_tagging.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_tagging.parameters.json

    ## Policy Initiative - Diagnostic Settings to Event Hub ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-Diagnostic-Settings-to-Event-Hub --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_diagnosticSettings_toEH.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_diagnosticSettings_toEH.parameters.json

    ## Policy Initiative - VM Backup ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-VM-Backup --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_vm_backup.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_vm_backup.parameters.json

    ## Policy Initiative - DDoS ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-DDoS --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_ddos.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_ddos.parameters.json
    
    ## Policy Initiative - Private DNS Zone ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-Private-DNS-Zone --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_DINE-PrivateDNSZones.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_DINE-PrivateDNSZones.parameters.json

    ## Policy Initiative - Deny IP Forwarding ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-Deny-IP-Forwarding --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_deny_ipforwarding.json

    ## Policy Initiative - TLS SSL Encryption in Transit ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-TLS-SSL-Encryption --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_TLS_SSL_Encryption.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_TLS_SSL_Encryption.parameters.json

    ## Policy Initiative - Deny Audit Resources with Encryption ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-CMK-Encryption --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_CMK_Encryption.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_CMK_Encryption.parameters.json

    ## Policy Initiative - Diagnostic Settings to LAW ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-Diagnostic-Settings-to-LAW --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_diagnosticSettings_toLAW.json --CTF-PAC-Assignment-Deployment/Global ./Parameters/assignment_diagnosticSettings_toLAW.parameters.json

    ## Policy Initiative - AG WAF ##
    az deployment mg create --location uksouth --management-group-id MGMT_ROOT --name policy-initiative-Enforce-AG-WAF --template-file ./CTF-PAC-Definition-Library/Policy-Initiatives/initiative_enforce_AG_WAF.json --parameters ./CTF-PAC-Assignment-Deployment/Global/assignment_enforce_AG_WAF.parameters.json

}


main() {
    echo "Start MAIN()"
    connect_deployment    
    echo "End MAIN()"
}


main