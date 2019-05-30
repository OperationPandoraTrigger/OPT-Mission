REM ~dp0 ist die Variable, die auf den Ordner der Batch-Datei verweist. So kann die Datei von überall aufgerufen werden, ohne dass sich relative Pfade ändern.
REM ~dp0 muss in "" eingefasst werden, sonst gibt es Probleme, wenn Leer- oder Sonderzeichen im Pfad enthalten sind. Yay, Windows!

REM TODO: -x glob, um .git und tools auszuschließen
REM TODO: Konfig, um Arma 3\MPMissions-Dir angeben zu können, wohin die Mission gepackt werden soll, z.B. "E:\Steam\steamapps\common\Arma 3\MPMissions\OPT_Dev.Altis.pbo"


"%~dp0"\..\programs\armake2.exe build -v  "%~dp0" "%~dp0"\test.pbo