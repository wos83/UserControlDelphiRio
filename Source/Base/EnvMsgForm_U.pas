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

unit EnvMsgForm_U;

interface

{$I 'UserControl.inc'}

uses
  Variants,
  Vcl.Buttons,
  Classes,
  Vcl.Controls,
  DB,
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

  UCBase;

type
  TEnvMsgForm = class(TForm)
    Panel1: TPanel;
    lbTitulo: TLabel;
    Image1: TImage;
    gbPara: TGroupBox;
    rbUsuario: TRadioButton;
    rbTodos: TRadioButton;
    dbUsuario: TDBLookupComboBox;
    gbMensagem: TGroupBox;
    lbAssunto: TLabel;
    lbMensagem: TLabel;
    EditAssunto: TEdit;
    MemoMsg: TMemo;
    btEnvia: TBitBtn;
    btCancela: TBitBtn;
    DataSource1: TDataSource;
    procedure btCancelaClick(Sender: TObject);
    procedure dbUsuarioCloseUp(Sender: TObject);
    procedure rbUsuarioClick(Sender: TObject);
    procedure btEnviaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject); // added by fduenas
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EnvMsgForm: TEnvMsgForm;

implementation

uses
  MsgsForm_U,
  UCMessages;

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

procedure TEnvMsgForm.btCancelaClick(Sender: TObject);
begin
  Close;
end;

procedure TEnvMsgForm.dbUsuarioCloseUp(Sender: TObject);
begin
  if dbUsuario.KeyValue <> null then
    rbUsuario.Checked := True;
end;

procedure TEnvMsgForm.rbUsuarioClick(Sender: TObject);
begin
  if not rbUsuario.Checked then
    dbUsuario.KeyValue := null;
end;

procedure TEnvMsgForm.btEnviaClick(Sender: TObject);
begin
  if rbUsuario.Checked then
    TUCApplicationMessage(MsgsForm.Owner)
      .SendAppMessage(MsgsForm.DSUsuarios.FieldByName('IdUser').AsInteger,
      EditAssunto.Text, MemoMsg.Text)
  else
    with MsgsForm.DSUsuarios do
    begin
      First;
      while not EOF do
      begin
        TUCApplicationMessage(MsgsForm.Owner)
          .SendAppMessage(FieldByName('IdUser').AsInteger, EditAssunto.Text,
          MemoMsg.Text);
        Next;
      end;
    end;
  Close;
end;

procedure TEnvMsgForm.FormCreate(Sender: TObject);
begin
  with TUCApplicationMessage(Owner).UserControl.UserSettings.AppMessages do
  begin
    Self.Caption := MsgSend_WindowCaption;
    lbTitulo.Caption := MsgSend_Title;
    gbPara.Caption := MsgSend_GroupTo;
    rbUsuario.Caption := MsgSend_RadioUser;
    rbTodos.Caption := MsgSend_RadioAll;
    gbMensagem.Caption := MsgSend_GroupMessage;
    lbAssunto.Caption := MsgSend_LabelSubject;
    lbMensagem.Caption := MsgSend_LabelMessageText;
    btCancela.Caption := MsgSend_BtCancel;
    btEnvia.Caption := MsgSend_BtSend;
  end;
end;

end.
