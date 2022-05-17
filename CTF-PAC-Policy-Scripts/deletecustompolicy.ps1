#Login-AzAccount
Connect-AzAccount -Tenant 'cf36141c-ddd7-45a7-b073-111f66d0b30c' -SubscriptionId '5ba7b7b9-5e6d-4e47-a765-ddf9054d1413'
Set-AzContext -Subscription "5ba7b7b9-5e6d-4e47-a765-ddf9054d1413" -tenant "cf36141c-ddd7-45a7-b073-111f66d0b30c"
function Remove-PolicyAssignment {
    param(
        [bool][parameter(Mandatory)]$RemoveAll,
        [object]$PolicyAssignment,
        [string][parameter(Mandatory)]$ManagmentGroupName 
    ) 
    
    if ($RemoveAll -eq $true){
    
    $mgmtid = (Get-AzManagementGroup -GroupName $ManagmentGroupName).Id
    $PolicyAssignments = Get-AzPolicyAssignment -Scope $mgmtid
    foreach ($item in $PolicyAssignments) {
        Remove-AzPolicyAssignment -Id $item.PolicyAssignmentId
    }
    }else{
        #Remove Policy Def
        foreach ($item in $PolicyAssignment){
        $PolicyAssignment  = Get-AzPolicyAssignment -Name $item.Name
        Remove-AzPolicyAssignment -Id $PolicyAssignment.ResourceId
        }
        }     
}  
function Remove-AzCustomPolicySet {
    param(
        [bool][parameter(Mandatory)]$RemoveAll,
        [string][parameter(Mandatory)]$ManagmentGroupName 
        #[object]$PolicySetList
    )
    if ($RemoveAll -eq $true){
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

function Remove-AzCustomPolicyDefinition {
    param(
        [bool][parameter(Mandatory)]$RemoveAll,
        [string][parameter(Mandatory)]$ManagmentGroupName 
        #[object]$PolicyDefinitionList
    )

    if ($RemoveAll -eq $true){
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

Remove-PolicyAssignment -RemoveAll $true -ManagmentGroupName 'testmanagementgroup'
Remove-AzCustomPolicySet -RemoveAll $true -ManagmentGroupName 'testmanagementgroup'
Remove-AzCustomPolicyDefinition -RemoveAll $true -ManagmentGroupName 'testmanagementgroup'


