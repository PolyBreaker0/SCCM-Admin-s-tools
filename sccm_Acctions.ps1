cls


$Polices = {

$SCCMActions = @( "{00000000-0000-0000-0000-000000000021}",  #MachinePolicy
                  "{00000000-0000-0000-0000-000000000003}",  #DiscoveryData
                  "{00000000-0000-0000-0000-000000000071}",  #ComplianceEvaluation
                  "{00000000-0000-0000-0000-000000000121}",  #AppDeployment
                  "{00000000-0000-0000-0000-000000000001}",  #HardwareInventory
                  "{00000000-0000-0000-0000-000000000108}",  #UpdateDeployment
                  "{00000000-0000-0000-0000-000000000113}",  #UpdateScan
                  "{00000000-0000-0000-0000-000000000002}")  #SoftwareInventory  


   foreach ($action in $SCCMActions) 
     
    {  
    
                         
      Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule $action
      

    }
}

Invoke-Command -ScriptBlock $Polices
$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup("Refresh Completed",3,"SCCM Refresh")