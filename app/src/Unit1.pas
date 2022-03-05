unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, uFrameLista,
  System.Generics.Collections;

type
  TForm1 = class(TForm)
    VertScrollBox1: TVertScrollBox;
    Layout1: TLayout;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FListaFrame:TList<TFrameLista>;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
 LFrame:TFrameLista;

begin
  TThread.CreateAnonymousThread(
  procedure
  begin
    TThread.Synchronize(Tthread.CurrentThread,
    procedure
    begin
      VertScrollBox1.BeginUpdate;
    end);

    for var i := 0 to 10 do
    begin

      LFrame:= TFrameLista.create(self);
      LFrame.Align:= TAlignLayout.Top;
      LFrame.Name:= 'Frame'+FListaFrame.Count.ToString+formatdatetime('hh_mm_ss_zzz',now);
      LFrame.lblTitulo.Text:= 'Titulo'+i.ToString;
      LFrame.lblDescricao.Text:= 'Descrição'+i.ToString;

      LFrame.AniIndicator1.Enabled:= true;

//      LFrame.Tag :=    associe a tag ou tagstring a sua forma de identificar o registro que fará referencia ao frame
//      LFrame.TagString:=

      FListaFrame.Add(LFrame);

      VertScrollBox1.AddObject(LFrame);

    end;

    TThread.Synchronize(Tthread.CurrentThread,
    procedure
    begin
      VertScrollBox1.EndUpdate;
    end);

  end).start;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  FListaFrame:= TList<TFrameLista>.create;

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FListaFrame);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  TThread.CreateAnonymousThread(
  procedure
  begin
    for var i := 0 to Pred(FListaFrame.Count) do
      FListaFrame[i].GetFoto(FListaFrame[i].TagString);
  end).Start;

end;

end.
