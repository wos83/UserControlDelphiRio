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
unit pUcFrame_UserLogged;

interface

{$I 'UserControl.inc'}

uses
  Variants, Vcl.Buttons, Classes,
  Vcl.Controls, DB, Vcl.DBCtrls, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.Forms, Vcl.Graphics, Messages, Vcl.Samples.Spin, Vcl.StdCtrls,
  SysUtils,
  {$IFDEF FPC}
  {$IFDEF WINDOWS}Windows,{$ELSE}LCLType,{$ENDIF}
  {$ELSE}
  Windows,
  {$ENDIF}
  Vcl.DBGrids, Vcl.Grids, Vcl.Menus,


  IncUser_U, UCBase;

type
  TUCFrame_UsersLogged = class(TFrame)
    dsDados: TDataSource;
    DBGrid: TDBGrid;
    Panel3: TPanel;
    BitMsg: TBitBtn;
    BitRefresh: TBitBtn;
    PopupMenu1: TPopupMenu;
    miDeleteSelected: TMenuItem;
    miDeleteAll: TMenuItem;
    procedure BitRefreshClick(Sender: TObject);
    procedure BitMsgClick(Sender: TObject);
    procedure miDeleteSelectedClick(Sender: TObject);
    procedure miDeleteAllClick(Sender: TObject);
  private
    DSUserLogados: TDataset;
    UCMes: TUCApplicationMessage;
  public
    FUserControl: TUserControl;
    procedure SetWindow;
    destructor Destroy; override;
  end;

implementation

uses
  UCMessages;

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

procedure TUCFrame_UsersLogged.SetWindow;
const
  PreSQLStmt =
    'select ' +
    '  L.%s as LogonID, ' +
    '  U.%s as UserName, ' +
    '  U.%s as id, ' +
    '  U.%s as Login, ' +
    '  L.%s as MachineName, ' +
    '  L.%s as DATA ' +
    'from ' +
    '  %s L inner join ' +
    '  %s U on U.%s = L.%s left join ' +
    '  %s P on P.%s = U.%s ' +
    'where ' +
    '  L.%s = %s ';
var
  SQLStmt: String;
  I: Integer;
  Form: TForm;
begin
  UCMes := nil;
  Form := Application.MainForm;
  for I := 0 to Form.ComponentCount - 1 do
    if (Form.Components[I] is TUCApplicationMessage) then
      UCMes := TUCApplicationMessage(Form.Components[I]);
  BitMsg.Visible := UCMes <> nil;

  with FUserControl do
  begin
    SQLStmt := Format(PreSQLStmt, [
      TableUsersLogged.FieldLogonID, TableUsers.FieldUserName, TableUsers.FieldUserId, TableUsers.FieldLogin,
      TableUsersLogged.FieldMachineName, TableUsersLogged.FieldData, TableUsersLogged.TableName, TableUsers.TableName,
      TableUsers.FieldUserId, TableUsersLogged.FieldUserId, TableUsers.TableName, TableUsers.FieldUserId,
      TableUsers.FieldProfile, TableUsersLogged.FieldApplicationID, QuotedStr(ApplicationID)
    ]);

    DSUserLogados := DataConnector.UCGetSQLDataset(SQLStmt);

    with UserSettings.UsersLogged do
    begin
      Caption := LabelCaption;
      BitMsg.Caption := BtnMessage;
      BitRefresh.Caption := BtnRefresh;

      DBGrid.Columns[0].Title.Caption := ColName;
      DBGrid.Columns[1].Title.Caption := ColLogin;
      DBGrid.Columns[2].Title.Caption := ColComputer;
      DBGrid.Columns[3].Title.Caption := ColData;
    end;

  end;
  dsDados.Dataset := DSUserLogados;
end;

procedure TUCFrame_UsersLogged.BitRefreshClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    FUserControl.DataConnector.CloseDataSet(dsDados.Dataset);
    FUserControl.DataConnector.OpenDataSet(dsDados.Dataset);
  finally
    Screen.Cursor := crDefault;
  end;
end;

destructor TUCFrame_UsersLogged.Destroy;
begin
  FreeAndNil(DSUserLogados);
//  FreeAndNil(UCMes); Comentado propositalmente, pois este componente pertence ao form principal e n�o desta tela, ent�o n�o deve se dar free;
  inherited;
end;

procedure TUCFrame_UsersLogged.miDeleteAllClick(Sender: TObject);
const
  sql = 'delete from %s L where L.%s = %s and L.%s <> %s';
begin
  FUserControl.DataConnector.UCExecSQL(Format(sql, [
    FUserControl.TableUsersLogged.TableName,
    FUserControl.TableUsersLogged.FieldApplicationID,
    QuotedStr(FUserControl.ApplicationID),
    FUserControl.TableUsersLogged.FieldLogonID,
    QuotedStr(FUserControl.CurrentUser.IdLogon)
  ]));
  BitRefresh.Click;
end;

procedure TUCFrame_UsersLogged.miDeleteSelectedClick(Sender: TObject);
const
  sql = 'delete from %s L where L.%s = %s and L.%s = %s and L.%s <> %s';
begin
  FUserControl.DataConnector.UCExecSQL(Format(sql, [
    FUserControl.TableUsersLogged.TableName,
    FUserControl.TableUsersLogged.FieldApplicationID,
    QuotedStr(FUserControl.ApplicationID),
    FUserControl.TableUsersLogged.FieldLogonID,
    QuotedStr(dsDados.DataSet.FieldByName('LogonID').AsString),
    FUserControl.TableUsersLogged.FieldLogonID,
    QuotedStr(FUserControl.CurrentUser.IdLogon)
  ]));
  BitRefresh.Click;
end;

procedure TUCFrame_UsersLogged.BitMsgClick(Sender: TObject);
var
  Msg: String;
begin
  if Assigned(UCMes) then
    if InputQuery(FUserControl.UserSettings.UsersLogged.InputText,
      FUserControl.UserSettings.UsersLogged.InputCaption, Msg) = True then
      UCMes.SendAppMessage(dsDados.Dataset.FieldValues['id'],
        FUserControl.UserSettings.UsersLogged.MsgSystem, Msg);
end;

end.
