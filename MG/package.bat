@echo off

cd "%UE55_PATH%/Engine/Build/BatchFiles/"

RunUAT.bat BuildCookRun ^
    -targetplatform=Win64 ^
    -configuration=Shipping ^
    -utf8output ^
    -unattended ^
    -cook ^
    -stage ^
    -archive ^
    -archivedirectory="%~dp0\Build" ^
    -package ^
    -pak ^
    -iostore ^
    -project="%~dp0\MG.uproject"
