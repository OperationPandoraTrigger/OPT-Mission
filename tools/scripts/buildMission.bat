:: This script will build the OPT mission.
:: Per default this program pauses at the end of execution to let the user inspect the output of the called commands.
:: Param 1: If this value is noPause, the script won't pause at the end of execution

@ECHO OFF

:: Set mission name here
SET "MISSION=OPT-TestMission.Altis"

IF NOT EXIST "%~dp0.\..\..\%MISSION%\" (
	ECHO Mission %MISSION% not found.
	ECHO Check your configuration.
	ECHO Press any key to exit.
	PAUSE > NUL
	EXIT 1
)


IF EXIST "%~dp0.\..\..\PBO.old" (
	ECHO Deleting old backup ...
	RMDIR /S /Q "%~dp0.\..\..\PBO.old"
)

IF EXIST "%~dp0.\..\..\PBO\" (
	ECHO Backing up old build ...
	PUSHD "%~dp0.\..\..\"
	REN PBO PBO.old
	POPD
)

IF NOT EXIST "%~dp0.\..\..\PBO\" (
	ECHO Creating directories ...
	MKDIR "%~dp0.\..\..\PBO"
)

PUSHD "%~dp0..\..\%MISSION%\"
SET "Mission_Dir=%CD%"
POPD


ECHO Packing %MISSION%.pbo ...
CD /D "%Mission_Dir%"
"%~dp0.\..\programs\armake2.exe" pack "%Mission_Dir%" "%~dp0.\..\..\PBO\%MISSION%.pbo"

ECHO.
ECHO Done.

IF NOT [%1] == [noPause] (
	ECHO Press any key to exit.
	PAUSE > NUL
)
