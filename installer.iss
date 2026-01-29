#define MyAppName "Originals Naturalists Manager"
#define MyAppVersion "0.0.4"
#define MyAppPublisher "Originals"
#define MyAppExeName "OriginalsNaturalistsManager.exe"

[Setup]
AppId={{B8A2F6C7-7E4B-4C0A-9A55-ONM-000000004}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}

; 64-bit app → Program Files
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}

; ===== OUTPUT =====
OutputDir=output
OutputBaseFilename=ONM-{#MyAppVersion}-setup

Compression=lzma
SolidCompression=yes

WizardStyle=modern
PrivilegesRequired=admin

DisableProgramGroupPage=yes
DisableWelcomePage=no

UninstallDisplayIcon={app}\{#MyAppExeName}

; ================= LANGUAGES =================

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"

; ================= CUSTOM MESSAGES =================

[CustomMessages]
en.CreateDesktopIcon=Create a desktop shortcut
ru.CreateDesktopIcon=Создать ярлык на рабочем столе

en.AdditionalOptions=Additional options:
ru.AdditionalOptions=Дополнительные параметры:

; ================= TASKS =================

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalOptions}"; Flags: unchecked

; ================= FILES =================

[Files]
Source: "*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion

; ================= ICONS =================

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

; ================= RUN =================

[Run]
Filename: "{app}\{#MyAppExeName}"; Flags: nowait postinstall skipifsilent
