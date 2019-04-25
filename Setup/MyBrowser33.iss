; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "MyBrowser3.3.6"
#define MyAppNameCn "�Ұ��Ҽ������3.3.6"
#define MyAppVersion "3.3.6"
#define MyAppPublisher "5i5j"
#define MyAppURL "http://www.5i5j.com/"
#define MyAppExeName "MyBrowser.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
; ע��ÿ�����汾����Ҫ�޸������AppId�������������Ϊ��
; ����������λ��ʼ�ĳ�(33)��汾��(V33)һ�¼��ɣ�
AppId={{AF491E5A-6456-44ED-A568-1718C4FCB336}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher="�Ұ��Ҽ�"
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppPublisher}\{#MyAppName}
DefaultGroupName="�Ұ��Ҽ�"
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputBaseFilename=MyBrowserSetup3.3
Compression=lzma
SolidCompression=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkablealone

[Files]
Source: "..\Src\Bin\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
;Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{#MyAppNameCn}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppNameCn}}"; Filename: "{uninstallexe}"
; �����ݷ�ʽ
Name: "{commondesktop}\{#MyAppNameCn}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: {app}\vcredist_x86.exe; Parameters: /q; WorkingDir: {tmp}; Flags: skipifdoesntexist; StatusMsg: "Installing Microsoft Visual C++ Runtime ..."; Check: NeedInstallVC9SP1

[Code]
var
 vc9SP1Missing: Boolean;

function NeedInstallVC9SP1(): Boolean;
begin
 Result := vc9SP1Missing;
end;

function InitializeSetup(): Boolean;
var
 version: Cardinal;
begin
 if RegQueryDWordValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{e2803110-78b3-4664-a479-3611a381656a}', 'Version', version) = false
 then
   begin
     vc9SP1Missing := true;
   end;
 result := true;
end;