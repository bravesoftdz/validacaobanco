unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    EdtCaminhoArquivo: TEdit;
    RGTipo: TRadioGroup;
    Label1: TLabel;
    SBLocArquivo: TSpeedButton;
    OpenDialog: TOpenDialog;
    BtnValidarArquivo: TButton;
    CDSBoleto: TClientDataSet;
    DSBoleto: TDataSource;
    DBGrid1: TDBGrid;
    CBBanco: TComboBox;
    Label2: TLabel;
    GBCabecalho: TGroupBox;
    ImgOKCabecalho: TImage;
    ImgOKTitulos: TImage;
    EdtIDRegHeader: TEdit;
    EdtTipoOp: TEdit;
    EdtIDExtTipoOp: TEdit;
    EdtIDTpServ: TEdit;
    ImgOK: TImage;
    ImgNaoOK: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdtIDExtTpServ: TEdit;
    EdtComplReg1: TEdit;
    EdtAgencia: TEdit;
    EdtDVAgencia: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EdtContaCorrente: TEdit;
    Edit10: TEdit;
    EdtComplReg2: TEdit;
    EdtNomeCedente: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EdtBanco: TEdit;
    Edit14: TEdit;
    EdtDataGravacao: TEdit;
    EdtComplReg3: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    EdtConvenio: TEdit;
    EdtComplReg4: TEdit;
    EdtSeqRegistro: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    ImgIDRegHeader: TImage;
    ImgTipoOp: TImage;
    ImgIDTpServ: TImage;
    ImgIDExtTipoOp: TImage;
    ImgDVAgencia: TImage;
    ImgAgencia: TImage;
    ImgComplReg1: TImage;
    ImgIDExtTpServ: TImage;
    ImgNomeCedente: TImage;
    ImgComplReg2: TImage;
    Image11: TImage;
    ImgContaCorrente: TImage;
    ImgComplReg3: TImage;
    Image14: TImage;
    ImgDataGravacao: TImage;
    ImgBanco: TImage;
    ImgSeqRegistro: TImage;
    ImgComplReg4: TImage;
    ImgConvenio: TImage;
    procedure SBLocArquivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnValidarArquivoClick(Sender: TObject);
  private
    procedure LerCabecalhoRemessaBB7Posicao;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ArquivoTXT: TextFile;

implementation

{$R *.dfm}

procedure TForm1.BtnValidarArquivoClick(Sender: TObject);
begin
  if (CBBanco.ItemIndex = 0) then
  begin
    ShowMessage('É necessário selecionar um banco');
    if (CBBanco.CanFocus) then
      CBBanco.SetFocus;

    Exit;
  end;

  if not (FileExists(EdtCaminhoArquivo.Text)) then
  Begin
    ShowMessage('Informe um arquivo válido.');
    Exit;
  End;


  AssignFile(ArquivoTXT, EdtCaminhoArquivo.Text);

  {$I-}         // desativa a diretiva de Input
  Reset(ArquivoTXT);
  {$I+}         // ativa a diretiva de Input

  if (IOResult <> 0) then
  begin
    ShowMessage('Erro na abertura do arquivo !!!');
    Exit;
  end;

  //***************************Validações*************************//
  case RGTipo.ItemIndex of
    0: Begin //Retorno 400

       End;
    1: Begin //Retorno 240

       End;
    2: Begin //Remessa 400
         case CBBanco.ItemIndex of
           1: Begin //BB 6 Posições

              End;
           2: Begin //BB 7 Posições
                LerCabecalhoRemessaBB7Posicao;
              End;
         end;
       End;
    3: Begin //Remessa 240

       End;
  end;

  CloseFile(ArquivoTXT);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ImgOKCabecalho.Visible:=False;
  ImgOKTitulos.Visible:=False;
end;

procedure TForm1.LerCabecalhoRemessaBB7Posicao;
Var
  Linha : String;
begin
  Readln(ArquivoTXT, Linha);
  sdsdfsdfsdfsdfsdfsdfsdsdfsdf

end;

procedure TForm1.SBLocArquivoClick(Sender: TObject);
begin
  OpenDialog.Title := 'Abrir Arquivo';
  if OpenDialog.Execute then
  Begin
    EdtCaminhoArquivo.Text := OpenDialog.FileName;
  end;

end;

end.
