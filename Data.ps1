$host.UI.RawUI.WindowTitle = "Cracked Lunar Client by BW Rusher"

echo "---------------------------------------------------------------------------------"
echo "    
  _                               _____                _            _ 
 | |                             / ____|              | |          | | TM
 | |    _   _ _ __   __ _ _ __  | |     _ __ __ _  ___| | _____  __| |
 | |   | | | | '_ \ / _` | '__| | |    | '__/ _` |/ __| |/ / _ \/ _` |
 | |___| |_| | | | | (_| | |    | |____| | | (_| | (__|   <  __/ (_| |
 |______\__,_|_| |_|\__,_|_|     \_____|_|  \__,_|\___|_|\_\___|\__,_|
                                                                      
                                                                      "                        
echo "---------------------------------------------------------------------------------"
echo "Lunar Client Crack"
echo "Agent: Nilsen84"
echo "@BW Rusher / YouTube"
echo "---------------------------------------------------------------------------------"

if ($args[0]) {
  $playerName = $args[0]
} else {
  $playerName = Read-Host -Prompt "Enter your name you want to play with"
}

if (-Not (Test-Path "$env:userprofile\.lunarclient\CrackedAccount.jar")) {
  echo "Please wait"
  Invoke-WebRequest -Uri "https://github.com/Nilsen84/lunar-client-agents/releases/download/v1.2.0/CrackedAccount.jar" -OutFile "$env:userprofile\.lunarclient\CrackedAccount.jar"
}

$javaJre = (Resolve-Path "$env:userprofile\.lunarclient\jre\*\zulu17*\bin")[0]
cd "$env:userprofile\.lunarclient\offline\multiver"

$launchArgs = "--add-modules", "jdk.naming.dns", "--add-exports", "jdk.naming.dns/com.sun.jndi.dns=java.naming", "-Djna.boot.library.path=$env:userprofile\.lunarclient\offline\multiver\natives", "-Dlog4j2.formatMsgNoLookups=true", "--add-opens", "java.base/java.io=ALL-UNNAMED", "-javaagent:$env:userprofile\.lunarclient\CrackedAccount.jar=$playerName", "-Xms1G", "-Xmx4000m", "-Xmn768m", "-XX:+DisableAttachMechanism", "-Djava.library.path=$env:userprofile\.lunarclient\offline\multiver\natives", "-cp", "lunar-lang.jar;lunar-emote.jar;lunar.jar;optifine-0.1.0-SNAPSHOT-all.jar;v1_8-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;genesis-0.1.0-SNAPSHOT-all.jar", "com.moonsworth.lunar.genesis.Genesis", "--version", "1.8.9", "--accessToken", "0", "--assetIndex", "1.8"
if ($args[1]) {
  $launchArgs += '--gameDir', $args[1]
}
$launchArgs += "--userProperties", "{}", "--texturesDir", "$env:userprofile\.lunarclient\textures", "--width", "854", "--height", "480", "--ichorClassPath", "lunar-lang.jar,lunar-emote.jar,lunar.jar,optifine-0.1.0-SNAPSHOT-all.jar,v1_8-0.1.0-SNAPSHOT-all.jar,common-0.1.0-SNAPSHOT-all.jar,genesis-0.1.0-SNAPSHOT-all.jar", "--ichorExternalFiles", "OptiFine_v1_8.jar", "--workingDirectory", ".", "--classpathDir", "$env:userprofile\.lunarclient\offline\multiver"

& "$javaJre\java.exe" $launchArgs