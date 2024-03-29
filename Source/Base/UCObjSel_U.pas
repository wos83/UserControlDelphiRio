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
unit UCObjSel_U;

interface

uses

  Variants,
  Vcl.ActnList,
  Vcl.Buttons,
  Classes,
  Vcl.ComCtrls,
  Vcl.Controls,
  DB,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Menus,
  Messages,
  Vcl.StdCtrls,
  SysUtils,
  
  {$IFDEF FPC}
  {$IFDEF WINDOWS}Windows,{$ELSE}LCLType,{$ENDIF}
  {$ELSE}
  Windows,
  {$ENDIF}
  
  UCBase,
  UcConsts_Language;

type
  TQControl = class(TControl)
  published
    property Caption;
  end;

  TUCObjSel = class(TForm)
    Panel1: TPanel;
    lbForm: TLabel;
    Image1: TImage;
    lbTitle: TLabel;
    lbGrupo: TLabel;
    lbGroup: TLabel;
    Panel2: TPanel;
    ListaCompsDisponiveis: TListView;
    btCancel: TBitBtn;
    BtOK: TBitBtn;
    cbFilter: TComboBox;
    lbCompDisp: TLabel;
    Panel3: TPanel;
    lbCompSel: TLabel;
    ListaCompsSelecionados: TListView;
    btsellall: TSpeedButton;
    btsel: TSpeedButton;
    btunsel: TSpeedButton;
    btunselall: TSpeedButton;
    Splitter1: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btsellallClick(Sender: TObject);
    procedure btunselallClick(Sender: TObject);
    procedure btselClick(Sender: TObject);
    procedure btunselClick(Sender: TObject);
    procedure ListaCompsDisponiveisDblClick(Sender: TObject);
    procedure ListaCompsSelecionadosDblClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure BtOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbFilterClick(Sender: TObject);
    procedure cbFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FListaBotoes: TStringList;
    FListaLabelsEdits: TStringList;
    procedure MakeDispItems;
  public
    FForm: TCustomForm;
    FUserControl: TUserControl;
    FInitialObjs: TStringList;
  end;

implementation

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

procedure TUCObjSel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self.Release; { By Cleilson Sousa }
end;

procedure TUCObjSel.FormShow(Sender: TObject);
var
  Contador: Integer;
begin
  lbForm.Left := lbTitle.Left + lbTitle.Width + 10;
  // added by fduenas to adjust window name
  lbGroup.Left := lbGrupo.Left + lbGrupo.Width + 10;
  // added by fduenas to adjust window name
  lbForm.Caption := FForm.Name;
  FInitialObjs.Text := UpperCase(FInitialObjs.Text);
  ListaCompsSelecionados.Items.Clear;
  MakeDispItems;
  /// /Tirei do onActivate, By Cleilson Sousa.
  for Contador := 0 to Pred(FUserControl.ExtraRights.Count) do
    if UpperCase(FUserControl.ExtraRights[Contador].FormName)
      = UpperCase(FForm.Name) then
      if FForm.FindComponent(FUserControl.ExtraRights[Contador].CompName) <> nil
      then
        with ListaCompsSelecionados.Items.Add do
        begin
          Caption := FUserControl.ExtraRights[Contador].Caption;
          SubItems.Add(FUserControl.ExtraRights[Contador].CompName);
          if FForm.FindComponent(FUserControl.ExtraRights[Contador].CompName) <> nil
          then
            SubItems.Add(FForm.FindComponent(FUserControl.ExtraRights[Contador]
              .CompName).ClassName);
        end;

  lbTitle.Caption := RetornaLingua(FUserControl.Language,
    'Const_Contr_TitleLabel');
  lbGrupo.Caption := RetornaLingua(FUserControl.Language,
    'Const_Contr_GroupLabel');
  lbCompDisp.Caption := RetornaLingua(FUserControl.Language,
    'Const_Contr_CompDispLabel');
  lbCompSel.Caption := RetornaLingua(FUserControl.Language,
    'Const_Contr_CompSelLabel');
  ListaCompsSelecionados.Columns[0].Caption :=
    RetornaLingua(FUserControl.Language, 'Const_Contr_DescCol');
  btCancel.Caption := RetornaLingua(FUserControl.Language,
    'Const_Contr_BTCancel');
  BtOK.Caption := RetornaLingua(FUserControl.Language, 'Const_Inc_BtGravar');

  // Lines Bellow added by fduenas
  btsellall.Hint := RetornaLingua(FUserControl.Language,
    'Const_Contr_BtSellAllHint');
  btsel.Hint := RetornaLingua(FUserControl.Language, 'Const_Contr_BtSelHint');
  btunsel.Hint := RetornaLingua(FUserControl.Language,
    'Const_Contr_BtUnSelHint');
  btunselall.Hint := RetornaLingua(FUserControl.Language,
    'Const_Contr_BtUnSelAllHint');

  lbForm.Left := lbTitle.Width + 66;
end;

procedure TUCObjSel.MakeDispItems;
var
  Componente: TComponent;
  Classe: String;
  Contador: Integer;
begin
  {
    All       0
    Buttons   1
    Fields    2
    Edits     3
    Labels    4
    MenuItems 5
    Actions   6
  }
  ListaCompsDisponiveis.Items.Clear;
  for Contador := 0 to Pred(FForm.ComponentCount) do
  begin
    Componente := FForm.Components[Contador];
    Classe := UpperCase(Componente.ClassName);
    if (Componente is TControl) or (Componente is TMenuItem) or
      (Componente is TField) or (Componente is TAction) then
      if (cbFilter.ItemIndex <= 0) or
        ((cbFilter.ItemIndex = 1) and (Componente is TButtonControl)
        { (FListaBotoes.IndexOf(Classe) > -1) } ) or
        ((cbFilter.ItemIndex = 2) and (Componente is TField)) or
        ((cbFilter.ItemIndex = 3) and (Componente is TCustomEdit)
        { (FListaLabelsEdits.IndexOf(Classe) > -1) } ) or
        ((cbFilter.ItemIndex = 4) and (Componente is TCustomLabel)) or
        ((cbFilter.ItemIndex = 5) and (Componente is TMenuItem)) or
        ((cbFilter.ItemIndex = 6) and (Componente is TCustomAction)) then
        if FInitialObjs.IndexOf(UpperCase(Componente.Name)) = -1 then
          with ListaCompsDisponiveis.Items.Add do
          begin
            Caption := Componente.ClassName;
            SubItems.Add(Componente.Name);
            if Componente is TMenuItem then
              SubItems.Add(StringReplace(TMenuItem(Componente).Caption, '&', '',
                [rfReplaceAll]))
            else if Componente is TAction then
              SubItems.Add(StringReplace(TAction(Componente).Caption, '&', '',
                [rfReplaceAll]))
            else if Componente is TField then
              SubItems.Add(TField(Componente).DisplayName)
            else
            Begin
              if length(trim(TQControl(FForm.Components[Contador]).Caption)) <> 0
              then
                SubItems.Add(StringReplace(TQControl(FForm.Components[Contador])
                  .Caption, '&', '', [rfReplaceAll]))
              else
                SubItems.Add(StringReplace(TQControl(FForm.Components[Contador])
                  .Hint, '&', '', [rfReplaceAll]));
            End;
          end;
  end;
end;

procedure TUCObjSel.btsellallClick(Sender: TObject);
var
  Contador: Integer;
begin
  for Contador := 0 to Pred(ListaCompsDisponiveis.Items.Count) do
  begin
    FInitialObjs.Add(ListaCompsDisponiveis.Items[Contador].SubItems[0]);
    with ListaCompsSelecionados.Items.Add do
    begin
      Caption := ListaCompsDisponiveis.Items[Contador].SubItems[1];
      SubItems.Add(ListaCompsDisponiveis.Items[Contador].SubItems[0]);
      SubItems.Add(ListaCompsDisponiveis.Items[Contador].Caption);
    end;
  end;
  ListaCompsDisponiveis.Items.Clear;
end;

procedure TUCObjSel.btunselallClick(Sender: TObject);
begin
  ListaCompsSelecionados.Items.Clear;
  FInitialObjs.Clear;
  MakeDispItems;
end;

procedure TUCObjSel.btselClick(Sender: TObject);
var
  Contador: Integer;
begin
  for Contador := 0 to ListaCompsDisponiveis.Items.Count - 1 do
    if ListaCompsDisponiveis.Items.Item[Contador].Selected then
    begin
      FInitialObjs.Add(ListaCompsDisponiveis.Items[Contador].SubItems[0]);
      with ListaCompsSelecionados.Items.Add do
      begin
        Caption := ListaCompsDisponiveis.Items[Contador].SubItems[1];
        SubItems.Add(ListaCompsDisponiveis.Items[Contador].SubItems[0]);
        SubItems.Add(ListaCompsDisponiveis.Items[Contador].Caption);
      end;
    end;

  Contador := 0;
  while Contador <= Pred(ListaCompsDisponiveis.Items.Count) do
    if ListaCompsDisponiveis.Items[Contador].Selected then
      ListaCompsDisponiveis.Items[Contador].Delete
    else
      Inc(Contador);
end;

procedure TUCObjSel.btunselClick(Sender: TObject);
var
  Contador: Integer;
  Obj: TComponent;
begin
  if ListaCompsSelecionados.SelCount = 0 then
    Exit;
  for Contador := 0 to Pred(ListaCompsSelecionados.Items.Count) do
    if ListaCompsSelecionados.Items.Item[Contador].Selected then
    begin
      if FInitialObjs.IndexOf(ListaCompsSelecionados.Items[Contador].SubItems[0]
        ) > -1 then
        FInitialObjs.Delete(FInitialObjs.IndexOf(ListaCompsSelecionados.Items
          [Contador].SubItems[0]));

      if ListaCompsSelecionados.Items[Contador].SubItems.Count > 1 then
        with ListaCompsDisponiveis.Items.Add do
        begin
          if ListaCompsSelecionados.Items[Contador].SubItems.Count > 1 then
            Caption := ListaCompsSelecionados.Items[Contador].SubItems[1];
          SubItems.Add(ListaCompsSelecionados.Items[Contador].SubItems[0]);

          Obj := FForm.FindComponent(ListaCompsSelecionados.Items[Contador]
            .SubItems[0]);
          if Obj is TMenuItem then
            SubItems.Add(TMenuItem(Obj).Caption)
          else if Obj is TAction then
            SubItems.Add(TMenuItem(Obj).Caption)
          else if Obj is TField then
            SubItems.Add(TField(Obj).DisplayName)
          else
            SubItems.Add(TQControl(Obj).Caption);
        end;
    end;

  Contador := 0;
  while Contador <= Pred(ListaCompsSelecionados.Items.Count) do
    if ListaCompsSelecionados.Items[Contador].Selected then
      ListaCompsSelecionados.Items[Contador].Delete
    else
      Inc(Contador);
end;

procedure TUCObjSel.ListaCompsDisponiveisDblClick(Sender: TObject);
begin
  btsel.Click;
end;

procedure TUCObjSel.ListaCompsSelecionadosDblClick(Sender: TObject);
begin
  if ListaCompsSelecionados.Items.Count = 0 then
    Exit;
  if ListaCompsSelecionados.SelCount = 1 then
    ListaCompsSelecionados.Selected.EditCaption;
end;

procedure TUCObjSel.btCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TUCObjSel.BtOKClick(Sender: TObject);
var
  Contador: Integer;
begin
  if FUserControl.ExtraRights.Count > 0 then
  begin
    Contador := 0;
    while Contador <= Pred(FUserControl.ExtraRights.Count) do
      if UpperCase(FUserControl.ExtraRights[Contador].FormName)
        = UpperCase(FForm.Name) then
        FUserControl.ExtraRights.Delete(Contador)
      else
        Inc(Contador);
  end;

  for Contador := 0 to Pred(ListaCompsSelecionados.Items.Count) do
    with FUserControl.ExtraRights.Add do
    begin
      Caption := ListaCompsSelecionados.Items[Contador].Caption;
      CompName := ListaCompsSelecionados.Items[Contador].SubItems[0];
      FormName := FForm.Name;
      GroupName := lbGroup.Caption;
    end;
  Close;
end;

procedure TUCObjSel.FormCreate(Sender: TObject);
begin
  cbFilter.ItemIndex := 0;
  FListaBotoes := TStringList.Create;
  FListaBotoes.CommaText := 'TButton,TSpeedButton,TBitBtn,TRxSpeedButton,' +
    'TRxSpinButton,TRxSwitch,TLMDButton,TLMDMMButton,TLMDShapeButton,' +
    'TLMD3DEffectButton,TLMDWndButtonShape,TJvHTButton,TJvBitBtn,TJvImgBtn,' +
    'TJvArrowButton,TJvTransparenftButton,TJvTransparentButton2,TJvSpeedButton';
  FListaBotoes.Text := UpperCase(FListaBotoes.Text);
  FListaLabelsEdits := TStringList.Create;
  FListaLabelsEdits.CommaText := 'TEdit,TLabel,TStaticText,TLabeledEdit,' +
    'TRxLabel,TComboEdit,TFileNamefEdit,TDirectoryEdit,TDateEdit,' +
    'TDateTimePicker,TRxCalcEdit,TCurrencyEdit,TRxSpinEdit';
  FListaLabelsEdits.Text := UpperCase(FListaLabelsEdits.Text);
end;

procedure TUCObjSel.cbFilterClick(Sender: TObject);
begin
  MakeDispItems;
end;

procedure TUCObjSel.cbFilterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  MakeDispItems;
end;

end.
