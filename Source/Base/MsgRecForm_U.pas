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

unit MsgRecForm_U;

interface

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
  Vcl.Samples.Spin,
  Vcl.StdCtrls,
  SysUtils,
  {$IFDEF FPC}
  {$IFDEF WINDOWS}Windows,{$ELSE}LCLType,{$ENDIF}
  {$ELSE}
  Windows,
  {$ENDIF}

  UCBase;

type
  TMsgRecForm = class(TForm)
    Panel1: TPanel;
    lbTitulo: TLabel;
    Image1: TImage;
    lbDE: TLabel;
    stDe: TStaticText;
    lbAssunto: TLabel;
    stAssunto: TStaticText;
    lbMensagem: TLabel;
    MemoMsg: TMemo;
    btFechar: TBitBtn;
    lbData: TLabel;
    stData: TStaticText;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject); // added by fduenas
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MsgRecForm: TMsgRecForm;

implementation

uses
  UCMessages;

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

procedure TMsgRecForm.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TMsgRecForm.FormCreate(Sender: TObject);
begin
  // added by fduenas
  if not(Self.Owner is TUCApplicationMessage) then
    Exit;
  with TUCApplicationMessage(Self.Owner).UserControl.UserSettings.AppMessages do
  begin
    Self.Caption := MsgRec_WindowCaption;
    lbTitulo.Caption := MsgRec_Title;
    lbDE.Caption := MsgRec_LabelFrom;
    lbData.Caption := MsgRec_LabelDate;
    lbAssunto.Caption := MsgRec_LabelSubject;
    lbMensagem.Caption := MsgRec_LabelMessage;
    btFechar.Caption := MsgRec_BtClose;
  end;
end;

end.
