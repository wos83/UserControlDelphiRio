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
unit TrocaSenha_U;

interface

{$I 'UserControl.inc'}

uses
  {$IFDEF DELPHIXE2_UP}
  System.UITypes,
  {$ENDIF}

  Variants,
  Vcl.Buttons,
  Classes,
  Vcl.Controls,
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

  UCBase; { Por Vicente Barros Leonel }

type
  TTrocaSenha = class(TForm)
    Panel1: TPanel;
    lbDescricao: TLabel;
    Image1: TImage;
    Panel3: TPanel;
    btGrava: TBitBtn;
    btCancel: TBitBtn;
    Panel2: TPanel;
    lbSenhaAtu: TLabel;
    lbNovaSenha: TLabel;
    lbConfirma: TLabel;
    EditAtu: TEdit;
    EditNova: TEdit;
    EditConfirma: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    fUsercontrol: TUserControl; { Por Vicente Barros Leonel }
    ForcarTroca: Boolean;
    { Public declarations }
  end;

implementation

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

procedure TTrocaSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TTrocaSenha.btCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TTrocaSenha.FormActivate(Sender: TObject);
begin
  EditAtu.CharCase := Self.fUsercontrol.Login.CharCasePass;
  EditNova.CharCase := Self.fUsercontrol.Login.CharCasePass;
  EditConfirma.CharCase := Self.fUsercontrol.Login.CharCasePass;
  { Por Vicente Barros Leonel }
end;

procedure TTrocaSenha.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ForcarTroca = True then
  begin
    CanClose := False;
    MessageDlg(fUsercontrol.UserSettings.CommonMessages.ForcaTrocaSenha,
      mtWarning, [mbOK], 0);
  end;
end;

end.
