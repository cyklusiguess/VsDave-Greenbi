@echo off
echo Installing Haxe libraries...

REM Universal for every version
haxelib install lime 7.8.0
haxelib install openfl 9.4.0
haxelib install flixel 4.8.1
haxelib install hscript 2.5.0
haxelib install hxcpp 4.3.2
haxelib install lime-samples 7.0.0
haxelib install flixel-tools 1.5.1
haxelib install flixel-demos 3.2.0
haxelib install flixel-templates 2.7.0
haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc
haxelib install flixel-addons 2.11.0
haxelib install flixel-ui 2.5.0
haxelib install polymod 1.3.1

echo Installing Newgrounds API (try both if needed)...
haxelib install newgrounds 1.1.5
IF ERRORLEVEL 1 (
    haxelib install newgrounds 1.2.0
)

REM Additional for 1.5 and up
haxelib install actuate
haxelib git linc_luajit https://github.com/nebulazorua/linc_luajit.git
haxelib git hxvm-luajit https://github.com/nebulazorua/hxvm-luajit
haxelib git faxe https://github.com/uhrobots/faxe
haxelib git extension-webm https://github.com/KadeDev/extension-webm
lime rebuild extension-webm windows

echo.
echo ========== DONE ==========
echo To build the game, navigate to your source folder and run:
echo lime test windows
pause
