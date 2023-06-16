unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dbf, db, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, EditBtn, Buttons, DBGrids, DbCtrls, LConvEncoding;

type

  { TForm3 }

  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    DataSource1: TDataSource;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    DateEdit5: TDateEdit;
    DateEdit6: TDateEdit;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit15: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MyDbf1: TDbf;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure CheckBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ComboBox2Click(Sender: TObject);
    procedure Edit5Click(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
    procedure Edit7Click(Sender: TObject);
    procedure Edit8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private

  public

  end;

var
  Form3: TForm3;
  dir : String;
  RecPos : Array[1..1000] of Integer;
  tn : Integer;
  nom : Integer;

implementation

{$R *.lfm}

{ TForm3 }

uses Unit1;

procedure TForm3.FormCreate(Sender: TObject);
var
  j : Integer;
begin
  dir := GetCurrentDir;
  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
  Edit5.Text:='';
  Edit6.Text:='';
  Edit7.Text:='';
  Edit8.Text:='';
  Edit9.Text:='';
  Edit10.Text:='';
  Edit11.Text:='';
  Edit12.Text:='';
  Edit13.Text:='';
  ComboBox6.Text:='';
  Edit15.Text:='';
  CheckBox1.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox5.Checked:=False;
  CheckBox6.Checked:=False;
  DateEdit1.Text:='';
  DateEdit2.Text:='';
  DateEdit3.Text:='';
  DateEdit4.Text:='';
  DateEdit5.Text:='';
  DateEdit6.Text:='';
  ComboBox1.Text:='';
  ComboBox2.Text:='';
  ComboBox3.Text:='';
  ComboBox4.Text:='';
  ComboBox5.Text:='';
  Label15.Caption:='';
  Label18.Caption:='';
  for j := 0 to Form1.ComboBox1.items.Count-1 do
      Form3.ComboBox1.items.Add(Form1.ComboBox1.items[j]);
  for j := 0 to Form1.ComboBox4.items.Count-1 do
      Form3.ComboBox4.items.Add(Form1.ComboBox4.items[j]);
  for j := 0 to Form1.ComboBox3.items.Count-1 do
      Form3.ComboBox5.items.Add(Form1.ComboBox3.items[j]);
end;

procedure TForm3.FormActivate(Sender: TObject);
begin

end;

procedure TForm3.BitBtn1Click(Sender: TObject);

begin
// Изчистване на старите данни
  Edit2.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
//  Edit5.Text:='';
//  Edit6.Text:='';
//  Edit7.Text:='';
//  Edit8.Text:='';
  Edit9.Text:='';
  Edit10.Text:='';
  Edit11.Text:='';
  Edit12.Text:='';
  Edit13.Text:='';
  ComboBox6.Text:='';
  Edit15.Text:='';
//  CheckBox1.Checked:=False;
//  CheckBox3.Checked:=False;
//  CheckBox4.Checked:=False;
//  CheckBox5.Checked:=False;
//  CheckBox6.Checked:=False;
//  DateEdit1.Text:='';
 // DateEdit2.Text:='';
  DateEdit3.Text:='';
  DateEdit4.Text:='';
  DateEdit5.Text:='';
  DateEdit6.Text:='';
  ComboBox1.Text:='';
 // ComboBox2.Text:='';
  ComboBox3.Text:='';
  ComboBox4.Text:='';
  ComboBox5.Text:='';
  Label18.Caption:='0/0';
//
     nom := 0;
     MyDbf1.FilePath := dir + '/DB/';
     MyDbf1.TableName := 'application_blank.dbf';
     MyDbf1.Open;
     MyDbf1.First;
     while not MyDbf1.EOF do
       begin
         if (CheckBox6.Checked and (MyDbf1.FieldByName('NomerPoreden').AsString = Edit8.Text)) or   // CP1251ToUTF8
            (CheckBox1.Checked and (AnsiUpperCase(MyDbf1.FieldByName('ZayavlenieNomer').AsString) = UTF8ToCP1251(AnsiUpperCase(Edit5.Text))) and ((MyDbf1.FieldByName('ZayavlenieData').AsString) = UTF8ToCP1251(DateEdit2.Text))) or
            (CheckBox3.Checked and ((MyDbf1.FieldByName('ZayavlenieEGN').AsString) = UTF8ToCP1251(Edit6.Text))) or
            (CheckBox4.Checked and (AnsiUpperCase(MyDbf1.FieldByName('ZayavlenieImena').AsString) = UTF8ToCP1251(AnsiUpperCase(Edit7.Text)))) or
            (CheckBox5.Checked and ((MyDbf1.FieldByName('ZayavlenieVidDoc').AsString) = UTF8ToCP1251(ComboBox2.Text))) then
             begin
               nom := nom + 1;
               Edit1.Text :=  CP1251ToUTF8(MyDbf1.FieldByName('NomerPoreden').AsString);
               Edit2.Text :=  CP1251ToUTF8(MyDbf1.FieldByName('OsnovanieDelo').AsString);
               Edit3.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString);
               DateEdit1.Text:= MyDbf1.FieldByName('InPismoData').AsString;
               ComboBox1.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString);
               Edit4.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoKoi').AsString);
               Edit9.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString);
               DateEdit3.Text:= MyDbf1.FieldByName('ZayavlenieData').AsString;
               Edit10.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString);
               Edit11.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieImena').AsString);
               ComboBox3.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieVidDoc').AsString);
               Edit12.Text:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString);
               DateEdit4.Text:= MyDbf1.FieldByName('OutPismoData').AsString;
               ComboBox4.Text:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoIzgotvil').AsString);
               ComboBox6.Text:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString);
               Edit13.Text:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoNomer').AsString);
               DateEdit5.Text:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoData').AsString);
               DateEdit6.Text:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivData').AsString);
               ComboBox5.Text:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivSluzitel').AsString);
               Edit15.Text:= CP1251ToUTF8(MyDbf1.FieldByName('Zabelezka').AsString);
               RecPos[nom] := MyDbf1.RecNo;
               MyDbf1.Next;
             end
             else  MyDbf1.Next;
       end;
       MyDbf1.Close;
       Label15.Caption:= 'Намерени са ' + IntToStr(nom) + ' записа.';
       if nom > 0 then
          begin
            tn := 1;
            MyDbf1.Open;
            MyDbf1.First;
            MyDbf1.RecNo:=RecPos[tn];
            //MyDbf1.Edit;
            Edit1.Text :=  CP1251ToUTF8(MyDbf1.FieldByName('NomerPoreden').AsString);
            Edit2.Text :=  CP1251ToUTF8(MyDbf1.FieldByName('OsnovanieDelo').AsString);
            Edit3.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString);
            DateEdit1.Text:= MyDbf1.FieldByName('InPismoData').AsString;
            ComboBox1.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString);
            Edit4.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoKoi').AsString);
            Edit9.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString);
            DateEdit3.Text:= MyDbf1.FieldByName('ZayavlenieData').AsString;
            Edit10.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString);
            Edit11.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieImena').AsString);
            ComboBox3.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieVidDoc').AsString);
            Edit12.Text:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString);
            DateEdit4.Text:= MyDbf1.FieldByName('OutPismoData').AsString;
            ComboBox4.Text:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoIzgotvil').AsString);
            ComboBox6.Text:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString);
            Edit13.Text:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoNomer').AsString);
            DateEdit5.Text:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoData').AsString);
            DateEdit6.Text:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivData').AsString);
            ComboBox5.Text:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivSluzitel').AsString);
            Edit15.Text:= CP1251ToUTF8(MyDbf1.FieldByName('Zabelezka').AsString);
            MyDbf1.Close;
            Label18.Caption:= IntToStr(tn) + '/' + IntToStr(nom);
          end;
  if nom = 0 then ShowMessage('Няма данни по зададените критерии.');


end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
    Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
  Edit5.Text:='';
  Edit6.Text:='';
  Edit7.Text:='';
  Edit8.Text:='';
  Edit9.Text:='';
  Edit10.Text:='';
  Edit11.Text:='';
  Edit12.Text:='';
  Edit13.Text:='';
  ComboBox6.Text:='';
  Edit15.Text:='';
  CheckBox1.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox5.Checked:=False;
  CheckBox6.Checked:=False;
  DateEdit1.Text:='';
  DateEdit2.Text:='';
  DateEdit3.Text:='';
  DateEdit4.Text:='';
  DateEdit5.Text:='';
  DateEdit6.Text:='';
  ComboBox1.Text:='';
  ComboBox2.Text:='';
  ComboBox3.Text:='';
  ComboBox4.Text:='';
  ComboBox5.Text:='';
    Label15.Caption:='';
  Label18.Caption:='';
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
       MyDbf1.FilePath := dir + '/DB/';
       MyDbf1.TableName := 'application_blank.dbf';
       if tn > 1 then
          begin
            tn := tn - 1;
            MyDbf1.Open;
            MyDbf1.First;
            MyDbf1.RecNo:=RecPos[tn];
            //MyDbf1.Edit;
            Edit1.Text :=  CP1251ToUTF8(MyDbf1.FieldByName('NomerPoreden').AsString);
            Edit2.Text :=  CP1251ToUTF8(MyDbf1.FieldByName('OsnovanieDelo').AsString);
            Edit3.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString);
            DateEdit1.Text:= MyDbf1.FieldByName('InPismoData').AsString;
            ComboBox1.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString);
            Edit4.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoKoi').AsString);
            Edit9.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString);
            DateEdit3.Text:= MyDbf1.FieldByName('ZayavlenieData').AsString;
            Edit10.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString);
            Edit11.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieImena').AsString);
            ComboBox3.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieVidDoc').AsString);
            Edit12.Text:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString);
            DateEdit4.Text:= MyDbf1.FieldByName('OutPismoData').AsString;
            ComboBox4.Text:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoIzgotvil').AsString);
            ComboBox6.Text:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString);
            Edit13.Text:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoNomer').AsString);
            DateEdit5.Text:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoData').AsString);
            DateEdit6.Text:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivData').AsString);
            ComboBox5.Text:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivSluzitel').AsString);
            Edit15.Text:= CP1251ToUTF8(MyDbf1.FieldByName('Zabelezka').AsString);
            MyDbf1.Close;
            Label18.Caption:= IntToStr(tn) + '/' + IntToStr(nom);
          end;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
       MyDbf1.FilePath := dir + '/DB/';
       MyDbf1.TableName := 'application_blank.dbf';
       if tn < nom then
          begin
            tn := tn + 1;
            MyDbf1.Open;
            MyDbf1.First;
            MyDbf1.RecNo:=RecPos[tn];
            //MyDbf1.Edit;
            Edit1.Text :=  CP1251ToUTF8(MyDbf1.FieldByName('NomerPoreden').AsString);
            Edit2.Text :=  CP1251ToUTF8(MyDbf1.FieldByName('OsnovanieDelo').AsString);
            Edit3.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString);
            DateEdit1.Text:= MyDbf1.FieldByName('InPismoData').AsString;
            ComboBox1.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString);
            Edit4.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoKoi').AsString);
            Edit9.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString);
            DateEdit3.Text:= MyDbf1.FieldByName('ZayavlenieData').AsString;
            Edit10.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString);
            Edit11.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieImena').AsString);
            ComboBox3.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieVidDoc').AsString);
            Edit12.Text:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString);
            DateEdit4.Text:= MyDbf1.FieldByName('OutPismoData').AsString;
            ComboBox4.Text:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoIzgotvil').AsString);
            ComboBox6.Text:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString);
            Edit13.Text:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoNomer').AsString);
            DateEdit5.Text:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoData').AsString);
            DateEdit6.Text:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivData').AsString);
            ComboBox5.Text:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivSluzitel').AsString);
            Edit15.Text:= CP1251ToUTF8(MyDbf1.FieldByName('Zabelezka').AsString);
            MyDbf1.Close;
            Label18.Caption:= IntToStr(tn) + '/' + IntToStr(nom);
          end;
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
       MyDbf1.FilePath := dir + '/DB/';
       MyDbf1.TableName := 'application_blank.dbf';
            MyDbf1.Open;
            MyDbf1.First;
            MyDbf1.RecNo:=RecPos[tn];
            MyDbf1.Edit;
            MyDbf1.FieldByName('NomerPoreden').AsString:=        UTF8ToCP1251(Edit1.Text);
            MyDbf1.FieldByName('OsnovanieDelo').AsString:=       UTF8ToCP1251(Edit2.Text);
            MyDbf1.FieldByName('InPismoNomer').AsString:=        UTF8ToCP1251(Edit3.Text);
            MyDbf1.FieldByName('InPismoData').AsString:=         UTF8ToCP1251(DateEdit1.Text);
            MyDbf1.FieldByName('InPismoOtkade').AsString:=       UTF8ToCP1251(ComboBox1.Text);
            MyDbf1.FieldByName('InPismoKoi').AsString:=          UTF8ToCP1251(Edit4.Text);
            MyDbf1.FieldByName('ZayavlenieNomer').AsString:=     UTF8ToCP1251(Edit9.Text);
            MyDbf1.FieldByName('ZayavlenieData').AsString:=      UTF8ToCP1251(DateEdit3.Text);
            MyDbf1.FieldByName('ZayavlenieEGN').AsString:=       UTF8ToCP1251(Edit10.Text);
            MyDbf1.FieldByName('ZayavlenieImena').AsString:=     UTF8ToCP1251(Edit11.Text);
            MyDbf1.FieldByName('ZayavlenieVidDoc').AsString:=    UTF8ToCP1251(ComboBox3.Text);
            MyDbf1.FieldByName('OutPismoNomer').AsString:=       UTF8ToCP1251(Edit12.Text);
            MyDbf1.FieldByName('OutPismoData').AsString:=        UTF8ToCP1251(DateEdit4.Text);
            MyDbf1.FieldByName('OutPismoIzgotvil').AsString:=    UTF8ToCP1251(ComboBox4.Text);
            MyDbf1.FieldByName('BackPismoDaNe').AsString:=       UTF8ToCP1251(ComboBox6.Text);
            MyDbf1.FieldByName('BackPismoNomer').AsString:=      UTF8ToCP1251(Edit13.Text);
            MyDbf1.FieldByName('BackPismoData').AsString:=       UTF8ToCP1251(DateEdit1.Text);
            MyDbf1.FieldByName('PribralArhivData').AsString:=    UTF8ToCP1251(DateEdit6.Text);
            MyDbf1.FieldByName('PribralArhivSluzitel').AsString:=UTF8ToCP1251(ComboBox5.Text);
            MyDbf1.FieldByName('Zabelezka').AsString:=           UTF8ToCP1251(Edit15.Text);
            MyDbf1.Post;
            MyDbf1.Close;
            ShowMessage('Направените промени са записани успешно.');

end;

procedure TForm3.CheckBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CheckBox6.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox5.Checked:=False;
end;

procedure TForm3.CheckBox2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    CheckBox1.Checked:=False;
  CheckBox6.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox5.Checked:=False;
end;

procedure TForm3.CheckBox3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    CheckBox1.Checked:=False;
  CheckBox6.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox5.Checked:=False;
end;

procedure TForm3.CheckBox4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    CheckBox1.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox6.Checked:=False;
  CheckBox5.Checked:=False;
end;

procedure TForm3.CheckBox5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    CheckBox1.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox6.Checked:=False;
end;

procedure TForm3.CheckBox6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CheckBox1.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox5.Checked:=False;
end;

procedure TForm3.ComboBox2Click(Sender: TObject);
begin
  CheckBox5.Checked:=True;
  CheckBox6.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox1.Checked:=False;
end;

procedure TForm3.Edit5Click(Sender: TObject);
begin
  CheckBox1.Checked:=True;
  CheckBox6.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox5.Checked:=False;
end;

procedure TForm3.Edit6Click(Sender: TObject);
begin
  CheckBox3.Checked:=True;
  CheckBox6.Checked:=False;
  CheckBox1.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox5.Checked:=False;
end;

procedure TForm3.Edit7Click(Sender: TObject);
begin
  CheckBox4.Checked:=True;
  CheckBox6.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox1.Checked:=False;
  CheckBox5.Checked:=False;
end;

procedure TForm3.Edit8Click(Sender: TObject);
begin
  CheckBox6.Checked:=True;
  CheckBox1.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox5.Checked:=False;

end;

end.

