$logFile = $PSScriptRoot+'\MyScript'+'.log'

$shell = " $PSScriptRoot\BiW.ps1"
try {
    
	Register-ScheduledTask Wallpaper Wallpaper (New-ScheduledTaskAction powershell $shell ) (New-ScheduledTaskTrigger -Daily -At 10:00)  (New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -RunOnlyIfNetworkAvailable -StartWhenAvailable)
    "Task successfully created: shell = $shell" | Out-File $logFile  
} catch {

	$output =  "Error creating task: $($_.Exception.Message); shell = $shell" | Out-File $logFile  
}
