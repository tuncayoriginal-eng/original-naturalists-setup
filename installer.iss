#define MyAppName "Originals Naturalists Manager"
#define MyAppVersion "0.0.5"
#define MyAppPublisher "Originals"
#define MyAppExeName "OriginalsNaturalistsManager.exe"

[Setup]
AppId={{B8A2F6C7-7E4B-4C0A-9A55-0A1B2C3D0005}}

AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}

SetupIconFile=onm.ico

ArchitecturesInstallIn64BitMode=x64compatible
AppMutex=OriginalsNaturalistsManagerMutex

DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}

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

en.KeepSettingsQuestion=Do you want to keep application settings?
ru.KeepSettingsQuestion=Сохранить настройки приложения?

en.KeepSettingsInfo=If you choose No, all settings will be deleted.
ru.KeepSettingsInfo=Если выбрать «Нет», все настройки будут удалены.

; ================= TASKS =================

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalOptions}"; Flags: unchecked

; ================= FILES =================

[Files]
Source: "OriginalsNaturalistsManager.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "onm.ico"; DestDir: "{app}"; Flags: ignoreversion

Source: "D3DCompiler_47_cor3.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "PenImc_cor3.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "PresentationNative_cor3.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "vcruntime140_cor3.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "wpfgfx_cor3.dll"; DestDir: "{app}"; Flags: ignoreversion

; ================= ICONS =================

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

; ================= RUN =================
; ✔ ОДНА СТРОКА — ОБЯЗАТЕЛЬНО

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Открыть {#MyAppExeName}"; Flags: nowait postinstall skipifsilent shellexec

; ================= CODE =================

[Code]
var
  KeepSettings: Boolean;

procedure InitializeUninstallProgressForm;
begin
  KeepSettings :=
    MsgBox(
      ExpandConstant('{cm:KeepSettingsQuestion}') + #13#10#13#10 +
      ExpandConstant('{cm:KeepSettingsInfo}'),
      mbConfirmation,
      MB_YESNO or MB_DEFBUTTON1
    ) = IDYES;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if (CurUninstallStep = usUninstall) and (not KeepSettings) then
  begin
    DelTree(
      ExpandConstant('{userappdata}\OriginalsNaturalistsManager'),
      True,
      True,
      True
    );
  end;
end;
