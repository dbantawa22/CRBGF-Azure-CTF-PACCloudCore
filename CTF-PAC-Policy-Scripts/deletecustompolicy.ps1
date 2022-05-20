#Login-AzAccount

Connect-AzAccount -SubscriptionId '4ce27a75-a843-43b4-99ed-006804c35d7e' -Tenant '2eaefbef-4530-46a0-9c3a-1bae7a45d64d'
Set-AzContext -Subscription "4ce27a75-a843-43b4-99ed-006804c35d7e" -tenant "2eaefbef-4530-46a0-9c3a-1bae7a45d64d"

#Delete Policy Assignments
function Remove-PolicyAssignment {
    param(
        [bool][parameter(Mandatory)]$RemoveAll,
        [object]$PolicyAssignment,
        [string][parameter(Mandatory)]$ManagmentGroupName,

        [switch]$Verbose = $true
    )
    
    if ($RemoveAll -eq $true) {
    
        $mgmtid = (Get-AzManagementGroup -GroupName $ManagmentGroupName).Id
        $PolicyAssignments = Get-AzPolicyAssignment -Scope $mgmtid
        foreach ($item in $PolicyAssignments) {
            Remove-AzPolicyAssignment -Id $item.PolicyAssignmentId
        }
    }
    else {
        #Remove Policy Def
        foreach ($item in $PolicyAssignment) {
            $PolicyAssignment = Get-AzPolicyAssignment -Name $item.Name
            Remove-AzPolicyAssignment -Id $PolicyAssignment.ResourceId
        }
    }     
}

#Delete Policy Initiatives
function Remove-AzCustomPolicySet {
    param(
        [bool][parameter(Mandatory)]$RemoveAll,
        [string][parameter(Mandatory)]$ManagmentGroupName 
        #[object]$PolicySetList
    )
    if ($RemoveAll -eq $true) {
        $PSet = Get-AzPolicySetDefinition -Custom -ManagementGroupName $ManagmentGroupName
        #Remove Policy Set
        foreach ($item in $PSet) {
            Remove-AzPolicySetDefinition -Id $item.PolicySetDefinitionId -Force
        }
        <#}else{
    #Remove Policy Def
    foreach ($item in $PolicySetList){
    $PolicySet = Get-AzPolicyDefinition -Name $item.Name
    Remove-AzPolicySetDefinition -Id $PolicySet.PolicySetDefinitionId
    }#>
    } 
} 

#Delete Policy Definitions
function Remove-AzCustomPolicyDefinition {
    param(
        [bool][parameter(Mandatory)]$RemoveAll,
        [string][parameter(Mandatory)]$ManagmentGroupName 
        #[object]$PolicyDefinitionList
    )

    if ($RemoveAll -eq $true) {
        $PDef = Get-AzPolicyDefinition -Custom -ManagementGroupName $ManagmentGroupName
        #Remove Policy Def
        foreach ($item in $PDef) {
            Remove-AzPolicySetDefinition -Id $item.PolicyDefinitionId -Force
        }
        <#}else{
    #Remove Policy Def
    foreach ($item in $PolicyDefinitionList){
    $Policy = Get-AzPolicyDefinition -Name $item.Name
    Remove-AzPolicySetDefinition -Id $Policy.PolicyDefinitionId
    }#>
    }
} 
#$PolicyDefinitionNameList = Import-Csv $env:USERPROFILE\desktop\PolicyDefinitionNameList.csv

Remove-PolicyAssignment
Remove-AzCustomPolicySet
Remove-AzCustomPolicyDefinition


<#
Remove-PolicyAssignment -RemoveAll $true -ManagmentGroupName 'MGMT_ROOT'
Remove-AzCustomPolicySet -RemoveAll $true -ManagmentGroupName 'MGMT_ROOT'
Remove-AzCustomPolicyDefinition -RemoveAll $true -ManagmentGroupName 'MGMT_ROOT'
#>