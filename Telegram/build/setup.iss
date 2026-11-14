; Aqzelo Inno Setup Script
; Based on Telegram Desktop setup.iss

#define MyAppName "Aqzelo"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Aqzelo Team"
#define MyAppURL "https://github.com/motelyz/aqzelo"
#define MyAppExeName "Aqzelo.exe"

[Setup]
AppId={A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={userappdata}\Aqzelo
DefaultGroupName=Aqzelo
AllowNoIcons=yes
OutputDir=.
OutputBaseFilename=Aqzelo_setup
Compression=lzma/ultra64
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "Aqzelo.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "Updater.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "d3dcompiler_47.dll"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Aqzelo"; Filename: "{app}\Aqzelo.exe"; WorkingDir: "{app}"
Name: "{group}\Uninstall Aqzelo"; Filename: "{uninstallexe}"; WorkingDir: "{app}"
Name: "{commondesktop}\Aqzelo"; Filename: "{app}\Aqzelo.exe"; WorkingDir: "{app}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Aqzelo"; Filename: "{app}\Aqzelo.exe"; WorkingDir: "{app}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\Aqzelo.exe"; Description: "{cm:LaunchProgram,Aqzelo}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{app}\data"
Type: filesandordirs; Name: "{app}\tdata"
Type: filesandordirs; Name: "{app}\tcache"
Type: filesandordirs; Name: "{app}\tdumps"
Type: filesandordirs; Name: "{app}\modules"
Type: filesandordirs; Name: "{userappdata}\Aqzelo\data"
Type: filesandordirs; Name: "{userappdata}\Aqzelo\tdata"
Type: filesandordirs; Name: "{userappdata}\Aqzelo\tcache"
Type: filesandordirs; Name: "{userappdata}\Aqzelo\tdumps"
Type: filesandordirs; Name: "{userappdata}\Aqzelo\modules"

[Code]
function CurUninstallStepChanged(CurUninstallStep: TUninstallStep): Boolean;
begin
  if CurUninstallStep = usUninstall then begin
    Exec(ExpandConstant('{app}\Aqzelo.exe'), '-cleanup', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  end;
  Result := True;
end;

function CurStepChanged(CurStep: TSetupStep): Boolean;
var
  ResultCode: Integer;
  MachinePath: String;
  MachineUninstall: String;
  MachineUninstallExe: String;
  MachineUninstallParams: String;
  MachineUninstallExeExists: Boolean;
begin
  if CurStep = ssPostInstall then begin
    MachinePath := ExpandConstant('{localappdata}\Aqzelo');
    if DirExists(MachinePath) then begin
      MachineUninstall := '';
      MachineUninstallExe := MachinePath + '\unins000.exe';
      if FileExists(MachineUninstallExe) then begin
        MachineUninstallParams := '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART';
        Exec(MachineUninstallExe, MachineUninstallParams, '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
      end;
      Exec(ExpandConstant('{app}\Aqzelo.exe'), '-fixprevious', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    end;
  end;
  Result := True;
end;
