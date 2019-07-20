# OPT-Mission
Repo für die OPT Mission (ohne Skripts).

Building
--------
To pack the mission to a PBO simply execute `tools\scripts\buildMission.bat`.

## Dialoge
Dialog-Klassen werden in der Mission unter `dialogs` gespeichert. Für jedes Modul wird hier ein eigener Ordner angelegt.
Anschließend in der `dialogs\include.hpp` entweder die Datei direkt includen, wenn es nur eine Datei ist. Ansonsten eine weitere `include.hpp` im Modulordner anlegen.


### OPTDef.hpp
Hier werden alle OPT-Konstanten gespeichert.
Diese müssen - wann immer möglich - verwendet werden.
- Farben für Controls
- IDDs und IDCs (sofern benötigt). Hier bitte immer einen neuen 100er Block anfangen.

### VanillaDef.hpp
Dies beinhaltet die Vanilla-Basisklassen, die man in seinen Dialogen einfach erben kann.
Diese Datei wird **NIE** von Hand bearbeitet!

Die Datei wird durch  [BIS_fnc_exportGUIBaseClasses](https://community.bistudio.com/wiki/BIS_fnc_exportGUIBaseClasses) erzeugt.
In der Debug-Konsole einfach
````
"Default" call BIS_fnc_exportGUIBaseClasses;
````
ausführen und via Copy & Paste ersetzen. Wenn man etwas ganz Außergewöhnliches braucht, kann es sein, dass man mit `"all"` aufrufen muss.

Wenn nur eine einzelne Konfig benötigt wird, kann man auch mit
````
utils 2
````
und dem Klassennamen (z.B. `"RscStructuredText"`) spezifische Konfigs abfragen.


Diese Datei nur updaten, wenn es absolut notwendig ist! Wenn sich Klassen unerwartet ändern, kann das vielfältige Auswirkungen auf alle Dialoge haben!