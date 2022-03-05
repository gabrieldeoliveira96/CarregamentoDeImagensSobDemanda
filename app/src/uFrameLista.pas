unit uFrameLista;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, ALFmxObjects,
  FMX.Effects, FMX.Filter.Effects, System.json, System.NetEncoding;

type
  TFrameLista = class(TFrame)
    ALRectangle1: TALRectangle;
    Layou1: TLayout;
    Image1: TImage;
    FillRGBEffect1: TFillRGBEffect;
    ShadowEffect1: TShadowEffect;
    lblDescricao: TLabel;
    lblTitulo: TLabel;
    Layout1: TLayout;
    AniIndicator1: TAniIndicator;
    FillRGBEffect2: TFillRGBEffect;
    Line1: TLine;
    Layout2: TLayout;
    ALRectangle2: TALRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetFoto(ACodObjeto:string);
  end;

implementation

{$R *.fmx}

{ TFrameLista }

procedure TFrameLista.GetFoto(ACodObjeto: string);
var
 LResult:String;
 LStream: TBytesStream;
begin
   //adicione aqui o método que irá buscar a foto
   //pode ser em base64, stream, etc
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    try
      //ALRectangle2.Fill.Bitmap.Bitmap.LoadFromStream(LStream);
      AniIndicator1.Enabled:= false;
      AniIndicator1.Visible:= false;
    finally
      FreeAndNil(LStream);
    end;

  end);

end;

end.
