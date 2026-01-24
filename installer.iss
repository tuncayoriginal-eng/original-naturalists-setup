#define MyAppName "Originals Naturalists Manager"
#define MyAppVersion "0.0.3"
#define MyAppPublisher "Originals"
#define MyAppExeName "OriginalsNaturalistsManager.exe"

[Setup]
AppId={{B8A2F6C7-7E4B-4C0A-9A55-ONM000000001}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}

; ✅ Program Files
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}

OutputDir=output
OutputBaseFilename=OriginalsNaturalistsManager_Setup
Compression=lzma
SolidCompression=yes

WizardStyle=modern

; 🔥 ОБЯЗАТЕЛЬНО для Program Files
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
Name: "desktopicon"; \
Description: "{cm:CreateDesktopIcon}"; \
GroupDescription: "{cm:AdditionalOptions}"; \
Flags: unchecked

; ================= FILES =================

[Files]
Source: "OriginalsNaturalistsManager.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "OriginalsNaturalistsManager.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "OriginalsNaturalistsManager.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "OriginalsNaturalistsManager.deps.json"; DestDir: "{app}"; Flags: ignoreversion

; ================= ICONS =================

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

; ================= RUN =================

[Run]
Filename: "{app}\{#MyAppExeName}"; Flags: nowait postinstall skipifsilent
