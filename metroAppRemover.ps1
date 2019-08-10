function Continue-running{
    $ui2 = Read-Host "Would you like to remove more apps? (y) Yes (n) no"
    if ($ui2 -eq 'y'){
        Remove-MetroApp
        }elseif($ui2 -eq 'n')
        {
            return
    }
}


function Zune-Remover{
    Get-AppxPackage *zunemusic* | Remove-AppxPackage
    Get-AppxPackage *zunevideo* | Remove-AppxPackage
    Get-AppxPackage *photos* | Remove-AppxPackage
    Get-AppxPackage *windowscamera* | Remove-AppxPackage
    Get-AppxPackage *soundrecorder* | Remove-AppxPackage
}

function Bing-Remover{
    Get-AppxPackage *bingnews* | Remove-AppxPackage
    Get-AppxPackage *bingfinance* | Remove-AppxPackage
    Get-AppxPackage *bingsports* | Remove-AppxPackage
    Get-AppxPackage *bingweather* | Remove-AppxPackage
    Get-AppxPackage *windowsmaps* | Remove-AppxPackage
}

function Communication-Remover{
    Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
    Get-AppxPackage *people* | Remove-AppxPackage
    Get-AppxPackage *skypeapp* | Remove-AppxPackage
    Get-AppxPackage *windowsphone* | Remove-AppxPackage
    Get-AppxPackage *phone* | Remove-AppxPackage
    Get-AppxPackage *messaging* | Remove-AppxPackage
}

function Starter-Remover{
    Get-AppxPackage *windowsalarms* | Remove-AppxPackage
    Get-AppxPackage *officehub* | Remove-AppxPackage
    Get-AppxPackage *getstarted* | Remove-AppxPackage
    Get-AppxPackage *3dbuilder* | Remove-AppxPackage
    Get-AppxPackage *mixed* | Remove-AppxPackage
    Get-AppxPackage *feedback* | Remove-AppxPackage
    Get-AppxPackage *oneconnect* | Remove-AppxPackage
    Get-AppxPackage *onenote* | Remove-AppxPackage
    Get-AppxPackage *stickynotes* | Remove-AppxPackage
}


function Game-Remover{
    Get-AppxPackage *solitairecollection* | Remove-AppxPackage
    Get-AppxPackage *xboxapp* | Remove-AppxPackage
    Get-AppxPackage *xboxspeech* | Remove-AppxPackage
    Get-AppxPackage *xboxidentity* | Remove-AppxPackage
    Get-AppxPackage *xboxgamecallableui* | Remove-AppxPackage
    Get-AppxPackage *xboxgameoverlay* | Remove-AppxPackage
    Get-AppxPackage *xboxgamingoverlay* | Remove-AppxPackage
    Get-AppxPackage *xbox.tcui* | Remove-AppxPackage
}

function App-Restorer{
    Get-AppxPackage -AllUsers| Foreach {
    Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)\AppXManifest.xml”
}
}

function Stop-SilentInstall{
    Set-ItemProperty -Path 'HKCU:Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SilentInstalledAppsEnabled -Value 0
}


function Remove-MetroApp{
    Write-Host "
    ========================Metro App Remover===========================

    (a) All
    (b) Bing apps
    (c) Windows Communications Apps
    (d) Windows Starter Apps
    (e) Xbox And Games
    (f) Zune Apps
    (g) Stop Auto Installation Of Apps
    (h) Restore All Apps
    (q) Quit
    "
    Write-Host($appOptions)
    $ui = Read-Host "Which app(s) would you like to remove?"
    if ($ui -eq 'a'){
        Zune-Remover
        Bing-Remover
        Communication-Remover
        Starter-Remover
        Game-Remover
        Continue-running
        Stop-SilentInstall
    }elseif($ui -eq 'b'){
        Bing-Remover
        Continue-running
    }elseif($ui -eq 'c'){
        Communication-Remover
        Continue-running
    }elseif($ui -eq 'd'){
        Starter-Remover
        Continue-running
    }elseif($ui -eq 'e'){
        Game-Remover
        Continue-running
    }elseif($ui -eq 'f'){
        Zune-Remover
        Continue-running
    }elseif($ui -eq 'g'){
        Stop-SilentInstall
        Continue-running
    }elseif($ui -eq 'h'){
        App-Restorer
        Continue-running
    }elseif($ui -eq 'q'){
        return
    }else{
        Write-Host "
        *********** Invalid input. Choose from the list. ***********" -foregroundcolor red
        Remove-MetroApp
    }

}

Remove-MetroApp







