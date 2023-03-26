    $totalDuration = New-TimeSpan -Seconds 0

Function Countdown-Timer {

[int]$studyminutes = Read-Host "`nEnter study session length in minutes"

[string]$endsound = "V:\Morrowind\Data Files\Sound\TR\fx\tr_ind_gong01.wav" #Replace this with a sound of your choosing.



$starttime = Get-date -Format "HH:mm"
Write-Host "`nStarting session, study hard!"

Write-Host "`nStart time: $starttime" 



Set-Clipboard -Value $studyminutes

$studyseconds = $studyminutes * 60
$delay = 1
for ($i = $studyseconds; $i -gt 0; $i = $i - $delay) {
    $percentcomplete = 100 - (($i / $studyseconds) * 100)
    Write-Progress -SecondsRemaining $i ` -Activity "session timer" ` -Status "session time remaining" ` -PercentComplete $percentcomplete
    Start-Sleep $delay
    }


$endtime = Get-date -Format "HH:mm"
Write-Host "`nEnd time: $endtime" 
$player = New-Object System.Media.SoundPlayer $endsound

$player.Play()

$studyDuration = New-TimeSpan -Seconds $studySeconds

$totalDuration = $totalDuration.Add($studyduration)




Write-Host "`nSession over, session lasted for: $studyduration" -ForegroundColor Green


Write-Host "`nYou've studied for " -NoNewline
Write-Host  "$($totalDuration.TotalMinutes) minutes" -NoNewline -ForegroundColor Yellow 
Write-Host " in total`n" -NoNewline

Take-Break


}



Function Take-Break {

[int]$breaktime = Read-Host "`nEnter break length in minutes"

[string]$endsound = "V:\Morrowind\Data Files\Sound\TR\fx\tr_ind_gong01.wav" #Replace this with a sound of your choosing.

Set-Clipboard -Value $breaktime

Write-Host "`nStarting break.."

$secondsb = $breaktime * 60
$delayb = 1
for ($i = $secondsb; $i -gt 0; $i = $i - $delayb) {
    $percentcompleteb = 100 - (($i / $secondsb) * 100)
    Write-Progress -SecondsRemaining $i ` -Activity "break timer" ` -Status "break time remaining" ` -PercentComplete $percentcompleteb
    Start-Sleep $delayb
    }

Write-Host "`nBreak over" -ForegroundColor Green
$player = New-Object System.Media.SoundPlayer $endsound

$player.Play()



Countdown-Timer


}


Countdown-Timer


