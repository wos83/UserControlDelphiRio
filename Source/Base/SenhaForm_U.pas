{ **************************************************************************** }
{ Projeto: Componentes User Control ShowDelphi Edition                         }
{ Biblioteca multiplataforma de componentes Delphi para o controle de usu�rios }
{                                                                              }
{ Baseado nos pacotes Open Source User Control 2.31 RC1                        }
{
Autor da vers�o Original: Rodrigo Alves Cordeiro

Colaboradores da vers�o original
Alexandre Oliveira Campioni - alexandre.rural@netsite.com.br
Bernard Grandmougin
Carlos Guerra
Daniel Wszelaki
Everton Ramos [BS2 Internet]
Francisco Due�as - fduenas@flashmail.com
Germ�n H. Cravero
Luciano Almeida Pimenta [ClubeDelphi.net]
Luiz Benevenuto - luiz@siffra.com
Luiz Fernando Severnini
Peter van Mierlo
Rodolfo Ferezin Moreira - rodolfo.fm@bol.com.br
Rodrigo Palhano (WertherOO)
Ronald Marconi
Sergiy Sekela (Dr.Web)
Stefan Nawrath
Vicente Barros Leonel [ Fknyght ]

*******************************************************************************}
{ Vers�o ShowDelphi Edition                                                    }
{                                                                              }
{ Direitos Autorais Reservados (c) 2015   Giovani Da Cruz                      }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{ Voc� pode obter a �ltima vers�o desse arquivo na pagina do projeto           }
{ User Control ShowDelphi Edition                                              }
{ Componentes localizado em http://infussolucoes.github.io/usercontrol-sd/     }
{                                                                              }
{ Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la  }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{ Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM    }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{ Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto }
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{                                                                              }
{ Comunidade Show Delphi - www.showdelphi.com.br                               }
{                                                                              }
{ Giovani Da Cruz  -  giovani@infus.inf.br  -  www.infus.inf.br                }
{                                                                              }
{ ****************************************************************************** }

{ ******************************************************************************
  |* Historico
  |*
  |* 01/07/2015: Giovani Da Cruz
  |*  - Cria��o e distribui��o da Primeira Versao ShowDelphi
  ******************************************************************************* }

unit SenhaForm_U;

interface

{$I 'UserControl.inc'}

uses
  Variants,
  Vcl.Buttons,
  Classes,
  Vcl.Controls,
  Vcl.DBCtrls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Messages,
  Vcl.StdCtrls,
  SysUtils,
  {$IFDEF FPC}
  {$IFDEF WINDOWS}Windows,{$ELSE}LCLType,{$ENDIF}
  {$ELSE}
  Windows,
  {$ENDIF}

  {$IFDEF DELPHIXE2_UP}
  System.UITypes,
  {$ENDIF}

  UCBase;

type
  TSenhaForm = class(TForm)
    edtSenha: TEdit;
    edtConfirmaSenha: TEdit;
    btnOK: TBitBtn;
    BtCancel: TBitBtn;
    LabelSenha: TLabel;
    LabelConfirma: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function CompararSenhas(Senha, ConfirmaSenha: String): Boolean;
  public
    fUserControl: TUserControl;
    { Public declarations }
  end;

implementation

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

{ TSenhaForm }

function TSenhaForm.CompararSenhas(Senha, ConfirmaSenha: String): Boolean;
begin
  Result := False;
  With fUserControl do
  begin
    if (UserPasswordChange.ForcePassword) and (Senha = '') then
      MessageDlg(UserSettings.CommonMessages.ChangePasswordError.
        PasswordRequired, mtWarning, [mbOK], 0)
    else if Length(Senha) < UserPasswordChange.MinPasswordLength then
      MessageDlg(Format(UserSettings.CommonMessages.ChangePasswordError.
        MinPasswordLength, [UserPasswordChange.MinPasswordLength]), mtWarning,
        [mbOK], 0)
    else if Pos(LowerCase(Senha), 'abcdeasdfqwerzxcv1234567890321654987teste' +
      LowerCase(CurrentUser.UserName) + LowerCase(CurrentUser.UserLogin)) > 0
    then
      MessageDlg(UserSettings.CommonMessages.ChangePasswordError.
        InvalidNewPassword, mtWarning, [mbOK], 0)
    else if (Senha <> ConfirmaSenha) then
      MessageDlg(UserSettings.CommonMessages.ChangePasswordError.
        NewPasswordError, mtWarning, [mbOK], 0)
    else
      Result := true;
  End;
end;

procedure TSenhaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TSenhaForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not(ModalResult = mrCancel) then
  begin
    CanClose := CompararSenhas(edtSenha.Text, edtConfirmaSenha.Text);
    if not CanClose then
      edtSenha.SetFocus;
  end;
end;

procedure TSenhaForm.FormCreate(Sender: TObject);
begin
  edtSenha.Clear;
  edtConfirmaSenha.Clear;
end;

procedure TSenhaForm.FormShow(Sender: TObject);
begin
  edtSenha.CharCase := fUserControl.Login.CharCasePass;
  edtConfirmaSenha.CharCase := fUserControl.Login.CharCasePass;
  LabelSenha.Caption := fUserControl.UserSettings.Login.LabelPassword;
  LabelConfirma.Caption := fUserControl.UserSettings.ChangePassword.
    LabelConfirm;
  btnOK.Caption := fUserControl.UserSettings.Login.BtOk;
  BtCancel.Caption := fUserControl.UserSettings.Login.BtCancel;
end;

end.
