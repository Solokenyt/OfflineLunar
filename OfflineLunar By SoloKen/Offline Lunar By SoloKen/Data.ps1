$host.UI.RawUI.WindowTitle = "Offline Lunar By SoloKen v0.69"
echo "1.Added HitdelayFix (Allows To Use 1.7 Hits Like Solar Tweaks)
2.Added LunarPacks Support (Allows To USe lunarPack)
3.Added Lunar Overlay (Allows To Change lunar Font and Theme)
4.Added RemovePlus (For Fps)
5.Added RemovePinnedServers (Remove Lunar.gg Ip from Servers)
6.Added BetterPermormance (MoreFps+)"
echo "---------------------------------------------------------------------------------------------------"
echo "
  _                                     
 | |                                    
 | |       _   _   _ __     __ _   _ __ 
 | |      | | | | | '_ \   / _` | | '__|
 | |____  | |_| | | | | | | (_| | | |   
 |______|  \__,_| |_| |_|  \__,_| |_|   
                                        
                                        "
echo "---------------------------------------------------------------------------------------------------"
echo "@SoloKenMC/ YouTube   Link : https://www.youtube.com/@SoloKenMC"
echo "---------------------------------------------------------------------------------------------------"

if ($args[0]) {
  $playerName = $args[0]
} else {
  $playerName = Read-Host -Prompt "Enter your Enter Yout Cracked/Offline Username"
}

if (-Not (Test-Path "$env:userprofile\.lunarclient\CrackedAccount.jar")) {
  echo "Downloaded Cracked Account Support"
  Invoke-WebRequest -Uri "https://github.com/Solokenyt/OfflineLunar/releases/download/CrackedAccounts/CrackedAccount.jar" -OutFile "$env:userprofile\.lunarclient\CrackedAccount.jar"
}
if (-Not (Test-Path "$env:userprofile\.lunarclient\HitDelayFix.jar")) {
  echo "Downloaded Hitdelay Fix"
  Invoke-WebRequest -Uri "https://github.com/Solokenyt/OfflineLunar/releases/download/CrackedAccounts/HitDelayFix.jar" -OutFile "$env:userprofile\.lunarclient\HitDelayFix.jar"
}
if (-Not (Test-Path "$env:userprofile\.lunarclient\LunarEnable.jar")) {
  echo "Downloaded BetterPerformance"
  Invoke-WebRequest -Uri "https://github.com/Solokenyt/OfflineLunar/releases/download/CrackedAccounts/LunarEnable.jar" -OutFile "$env:userprofile\.lunarclient\LunarEnable.jar"
}
if (-Not (Test-Path "$env:userprofile\.lunarclient\LunarPacksFix.jar")) {
  echo "Downloaded LunarPack Support"
  Invoke-WebRequest -Uri "https://github.com/Solokenyt/OfflineLunar/releases/download/CrackedAccounts/LunarPacksFix.jar" -OutFile "$env:userprofile\.lunarclient\LunarPacksFix.jar"
}
if (-Not (Test-Path "$env:userprofile\.lunarclient\NoPinnedServers.jar")) {
  echo "Downloaded NoPinnedServer"
  Invoke-WebRequest -Uri "https://github.com/Solokenyt/OfflineLunar/releases/download/CrackedAccounts/NoPinnedServers.jar" -OutFile "$env:userprofile\.lunarclient\NoPinnedServers.jar"
}
if (-Not (Test-Path "$env:userprofile\.lunarclient\RemovePlus.jar")) {
  echo "Downloaded RemovePlus"
  Invoke-WebRequest -Uri "https://github.com/Solokenyt/OfflineLunar/releases/download/CrackedAccounts/RemovePlus.jar" -OutFile "$env:userprofile\.lunarclient\RemovePlus.jar"
}
$javaJre = (Resolve-Path "$env:userprofile\.lunarclient\jre\*\zulu17*\bin")[0]
cd "$env:userprofile\.lunarclient\offline\multiver"

$launchArgs = "--add-modules", "jdk.naming.dns", "--add-exports", "jdk.naming.dns/com.sun.jndi.dns=java.naming", "-Djna.boot.library.path=$env:userprofile\.lunarclient\offline\multiver\natives", "-Dlog4j2.formatMsgNoLookups=true", "--add-opens", "java.base/java.io=ALL-UNNAMED", "-javaagent:$env:userprofile\.lunarclient\CrackedAccount.jar=$playerName", "-Xms1G", "-Xmx4000m", "-Xmn768m", "-XX:+DisableAttachMechanism", "-Djava.library.path=$env:userprofile\.lunarclient\offline\multiver\natives", "-cp", "lunar-lang.jar;lunar-emote.jar;lunar.jar;optifine-0.1.0-SNAPSHOT-all.jar;v1_8-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;genesis-0.1.0-SNAPSHOT-all.jar", "com.moonsworth.lunar.genesis.Genesis", "--version", "1.8.9", "--accessToken", "0", "--assetIndex", "1.8"
if ($args[1]) {
  $launchArgs += '--gameDir', $args[1]
}
$launchArgs += "--userProperties", "{}", "--texturesDir", "$env:userprofile\.lunarclient\textures", "--width", "854", "--height", "480", "--ichorClassPath", "lunar-lang.jar,lunar-emote.jar,lunar.jar,optifine-0.1.0-SNAPSHOT-all.jar,v1_8-0.1.0-SNAPSHOT-all.jar,common-0.1.0-SNAPSHOT-all.jar,genesis-0.1.0-SNAPSHOT-all.jar", "--ichorExternalFiles", "OptiFine_v1_8.jar", "--workingDirectory", ".", "--classpathDir", "$env:userprofile\.lunarclient\offline\multiver"

& "$javaJre\java.exe" $launchArgs