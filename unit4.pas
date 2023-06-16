unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dbf, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, EditBtn, StdCtrls, Grids, Buttons, LConvEncoding;

type

  { TForm4 }

  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    DateEdit4: TDateEdit;
    DateEdit5: TDateEdit;
    DateEdit6: TDateEdit;
    DateEdit7: TDateEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    MyDbf1: TDbf;
    RadioGroup1: TRadioGroup;
    StringGrid1: TStringGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form4: TForm4;
  dir : String;

implementation

{$R *.lfm}

uses Unit1;

{ TForm4 }


procedure TForm4.BitBtn1Click(Sender: TObject);
var
  i : Integer;
begin
  //
      MyDbf1.FilePath := dir + '/DB/';
      MyDbf1.TableName := 'application_blank.dbf';
      i := 0;
      StringGrid1.Clean;

// Справка за  "Заявления, които не са върнати в сектор БДС"
         IF RadioGroup1.ItemIndex = 0 THEN
         BEGIN
           MyDbf1.Open;
           MyDbf1.First;
           while not MyDbf1.EOF do
             begin
               if (CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString) = 'НЕ') then
                  begin
                    i := i + 1;
                    StringGrid1.RowCount:=i+1;
                    StringGrid1.Cells[0,i]:= IntToStr(i);
                    StringGrid1.Cells[1,i]:= CP1251ToUTF8(MyDbf1.FieldByName('NomerPoreden').AsString);
                    StringGrid1.Cells[2,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString);
                    StringGrid1.Cells[3,i]:=CP1251ToUTF8(MyDbf1.FieldByName('OsnovanieDelo').AsString);
                    StringGrid1.Cells[4,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString) + '/' + MyDbf1.FieldByName('InPismoData').AsString;
                    StringGrid1.Cells[5,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString);
                    StringGrid1.Cells[6,i]:=CP1251ToUTF8(MyDbf1.FieldByName('InPismoKoi').AsString);
                    StringGrid1.Cells[7,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString) + '/' + MyDbf1.FieldByName('ZayavlenieData').AsString;
                    StringGrid1.Cells[8,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString);
                    StringGrid1.Cells[9,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieImena').AsString);
                    StringGrid1.Cells[10,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieVidDoc').AsString);
                    StringGrid1.Cells[11,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString) + '/' + MyDbf1.FieldByName('OutPismoData').AsString;
                    StringGrid1.Cells[12,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoIzgotvil').AsString);
                    StringGrid1.Cells[13,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoNomer').AsString) + '/' + CP1251ToUTF8(MyDbf1.FieldByName('BackPismoData').AsString);
                    StringGrid1.Cells[14,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivData').AsString);
                    StringGrid1.Cells[15,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivSluzitel').AsString);
                    StringGrid1.Cells[16,i]:= CP1251ToUTF8(MyDbf1.FieldByName('Zabelezka').AsString);
                    MyDbf1.Next;
                  end
                  else  MyDbf1.Next;
             end;
           MyDbf1.Close;
           StringGrid1.AutoSizeColumns;
         END;

// Справка за  "Заявление с № и дата :"
         IF RadioGroup1.ItemIndex = 1 THEN
         BEGIN
           MyDbf1.Open;
           MyDbf1.First;
           while not MyDbf1.EOF do
             begin
               if (CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString) = Edit1.Text) and
                   (CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieData').AsString) = DateEdit4.Text)  then
                  begin
                    i := i + 1;
                    StringGrid1.RowCount:=i+1;
                    StringGrid1.Cells[0,i]:= IntToStr(i);
                    StringGrid1.Cells[1,i]:= CP1251ToUTF8(MyDbf1.FieldByName('NomerPoreden').AsString);
                    StringGrid1.Cells[2,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString);
                    StringGrid1.Cells[3,i]:=CP1251ToUTF8(MyDbf1.FieldByName('OsnovanieDelo').AsString);
                    StringGrid1.Cells[4,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString) + '/' + MyDbf1.FieldByName('InPismoData').AsString;
                    StringGrid1.Cells[5,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString);
                    StringGrid1.Cells[6,i]:=CP1251ToUTF8(MyDbf1.FieldByName('InPismoKoi').AsString);
                    StringGrid1.Cells[7,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString) + '/' + MyDbf1.FieldByName('ZayavlenieData').AsString;
                    StringGrid1.Cells[8,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString);
                    StringGrid1.Cells[9,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieImena').AsString);
                    StringGrid1.Cells[10,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieVidDoc').AsString);
                    StringGrid1.Cells[11,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString) + '/' + MyDbf1.FieldByName('OutPismoData').AsString;
                    StringGrid1.Cells[12,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoIzgotvil').AsString);
                    StringGrid1.Cells[13,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoNomer').AsString) + '/' + CP1251ToUTF8(MyDbf1.FieldByName('BackPismoData').AsString);
                    StringGrid1.Cells[14,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivData').AsString);
                    StringGrid1.Cells[15,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivSluzitel').AsString);
                    StringGrid1.Cells[16,i]:= CP1251ToUTF8(MyDbf1.FieldByName('Zabelezka').AsString);
                    MyDbf1.Next;
                  end
                  else  MyDbf1.Next;
             end;
           MyDbf1.Close;
           StringGrid1.AutoSizeColumns;
         END;

// Справка за "ЕГН"
      IF RadioGroup1.ItemIndex = 2 THEN
      BEGIN
        MyDbf1.Open;
        MyDbf1.First;
        while not MyDbf1.EOF do
          begin
            if (CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString) = Edit2.Text) then
               begin
                 i := i + 1;
                 StringGrid1.RowCount:=i+1;
                 StringGrid1.Cells[0,i]:= IntToStr(i);
                 StringGrid1.Cells[1,i]:= CP1251ToUTF8(MyDbf1.FieldByName('NomerPoreden').AsString);
                 StringGrid1.Cells[2,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString);
                 StringGrid1.Cells[3,i]:=CP1251ToUTF8(MyDbf1.FieldByName('OsnovanieDelo').AsString);
                 StringGrid1.Cells[4,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString) + '/' + MyDbf1.FieldByName('InPismoData').AsString;
                 StringGrid1.Cells[5,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString);
                 StringGrid1.Cells[6,i]:=CP1251ToUTF8(MyDbf1.FieldByName('InPismoKoi').AsString);
                 StringGrid1.Cells[7,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString) + '/' + MyDbf1.FieldByName('ZayavlenieData').AsString;
                 StringGrid1.Cells[8,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString);
                 StringGrid1.Cells[9,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieImena').AsString);
                 StringGrid1.Cells[10,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieVidDoc').AsString);
                 StringGrid1.Cells[11,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString) + '/' + MyDbf1.FieldByName('OutPismoData').AsString;
                 StringGrid1.Cells[12,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoIzgotvil').AsString);
                 StringGrid1.Cells[13,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoNomer').AsString) + '/' + CP1251ToUTF8(MyDbf1.FieldByName('BackPismoData').AsString);
                 StringGrid1.Cells[14,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivData').AsString);
                 StringGrid1.Cells[15,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivSluzitel').AsString);
                 StringGrid1.Cells[16,i]:= CP1251ToUTF8(MyDbf1.FieldByName('Zabelezka').AsString);
                 MyDbf1.Next;
               end
               else  MyDbf1.Next;
          end;
        MyDbf1.Close;
        StringGrid1.AutoSizeColumns;
      END;

// Справка за "Заявления поискани с писмо/искане №"
      IF RadioGroup1.ItemIndex = 3 THEN
      BEGIN
        MyDbf1.Open;
        MyDbf1.First;
        while not MyDbf1.EOF do
          begin
            if (CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString) = Edit3.Text) and
                (CP1251ToUTF8(MyDbf1.FieldByName('InPismoData').AsString) = DateEdit5.Text)  then
               begin
                 i := i + 1;
                 StringGrid1.RowCount:=i+1;
                 StringGrid1.Cells[0,i]:= IntToStr(i);
                 StringGrid1.Cells[1,i]:= CP1251ToUTF8(MyDbf1.FieldByName('NomerPoreden').AsString);
                 StringGrid1.Cells[2,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString);
                 StringGrid1.Cells[3,i]:=CP1251ToUTF8(MyDbf1.FieldByName('OsnovanieDelo').AsString);
                 StringGrid1.Cells[4,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString) + '/' + MyDbf1.FieldByName('InPismoData').AsString;
                 StringGrid1.Cells[5,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString);
                 StringGrid1.Cells[6,i]:=CP1251ToUTF8(MyDbf1.FieldByName('InPismoKoi').AsString);
                 StringGrid1.Cells[7,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString) + '/' + MyDbf1.FieldByName('ZayavlenieData').AsString;
                 StringGrid1.Cells[8,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString);
                 StringGrid1.Cells[9,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieImena').AsString);
                 StringGrid1.Cells[10,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieVidDoc').AsString);
                 StringGrid1.Cells[11,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString) + '/' + MyDbf1.FieldByName('OutPismoData').AsString;
                 StringGrid1.Cells[12,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoIzgotvil').AsString);
                 StringGrid1.Cells[13,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoNomer').AsString) + '/' + CP1251ToUTF8(MyDbf1.FieldByName('BackPismoData').AsString);
                 StringGrid1.Cells[14,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivData').AsString);
                 StringGrid1.Cells[15,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivSluzitel').AsString);
                 StringGrid1.Cells[16,i]:= CP1251ToUTF8(MyDbf1.FieldByName('Zabelezka').AsString);
                 MyDbf1.Next;
               end
               else  MyDbf1.Next;
          end;
        MyDbf1.Close;
        StringGrid1.AutoSizeColumns;
      END;
//
// Справка за "Заявления изпратени с изходящо писмо №"
      IF RadioGroup1.ItemIndex = 4 THEN
      BEGIN
        MyDbf1.Open;
        MyDbf1.First;
        while not MyDbf1.EOF do
          begin
            if (CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString) = Edit4.Text) and
                (CP1251ToUTF8(MyDbf1.FieldByName('OutPismoData').AsString) = DateEdit6.Text)  then
               begin
                 i := i + 1;
                 StringGrid1.RowCount:=i+1;
                 StringGrid1.Cells[0,i]:= IntToStr(i);
                 StringGrid1.Cells[1,i]:= CP1251ToUTF8(MyDbf1.FieldByName('NomerPoreden').AsString);
                 StringGrid1.Cells[2,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString);
                 StringGrid1.Cells[3,i]:=CP1251ToUTF8(MyDbf1.FieldByName('OsnovanieDelo').AsString);
                 StringGrid1.Cells[4,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString) + '/' + MyDbf1.FieldByName('InPismoData').AsString;
                 StringGrid1.Cells[5,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString);
                 StringGrid1.Cells[6,i]:=CP1251ToUTF8(MyDbf1.FieldByName('InPismoKoi').AsString);
                 StringGrid1.Cells[7,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString) + '/' + MyDbf1.FieldByName('ZayavlenieData').AsString;
                 StringGrid1.Cells[8,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString);
                 StringGrid1.Cells[9,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieImena').AsString);
                 StringGrid1.Cells[10,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieVidDoc').AsString);
                 StringGrid1.Cells[11,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString) + '/' + MyDbf1.FieldByName('OutPismoData').AsString;
                 StringGrid1.Cells[12,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoIzgotvil').AsString);
                 StringGrid1.Cells[13,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoNomer').AsString) + '/' + CP1251ToUTF8(MyDbf1.FieldByName('BackPismoData').AsString);
                 StringGrid1.Cells[14,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivData').AsString);
                 StringGrid1.Cells[15,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivSluzitel').AsString);
                 StringGrid1.Cells[16,i]:= CP1251ToUTF8(MyDbf1.FieldByName('Zabelezka').AsString);
                 MyDbf1.Next;
               end
               else  MyDbf1.Next;
          end;
        MyDbf1.Close;
        StringGrid1.AutoSizeColumns;
      END;
//
// Справка за "Заявления върнати с писмо №"
      IF RadioGroup1.ItemIndex = 5 THEN
      BEGIN
        MyDbf1.Open;
        MyDbf1.First;
        while not MyDbf1.EOF do
          begin
            if (CP1251ToUTF8(MyDbf1.FieldByName('BackPismoNomer').AsString) = Edit5.Text) and
                (CP1251ToUTF8(MyDbf1.FieldByName('BackPismoData').AsString) = DateEdit7.Text)  then
               begin
                 i := i + 1;
                 StringGrid1.RowCount:=i+1;
                 StringGrid1.Cells[0,i]:= IntToStr(i);
                 StringGrid1.Cells[1,i]:= CP1251ToUTF8(MyDbf1.FieldByName('NomerPoreden').AsString);
                 StringGrid1.Cells[2,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString);
                 StringGrid1.Cells[3,i]:=CP1251ToUTF8(MyDbf1.FieldByName('OsnovanieDelo').AsString);
                 StringGrid1.Cells[4,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString) + '/' + MyDbf1.FieldByName('InPismoData').AsString;
                 StringGrid1.Cells[5,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString);
                 StringGrid1.Cells[6,i]:=CP1251ToUTF8(MyDbf1.FieldByName('InPismoKoi').AsString);
                 StringGrid1.Cells[7,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString) + '/' + MyDbf1.FieldByName('ZayavlenieData').AsString;
                 StringGrid1.Cells[8,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString);
                 StringGrid1.Cells[9,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieImena').AsString);
                 StringGrid1.Cells[10,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieVidDoc').AsString);
                 StringGrid1.Cells[11,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString) + '/' + MyDbf1.FieldByName('OutPismoData').AsString;
                 StringGrid1.Cells[12,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoIzgotvil').AsString);
                 StringGrid1.Cells[13,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoNomer').AsString) + '/' + CP1251ToUTF8(MyDbf1.FieldByName('BackPismoData').AsString);
                 StringGrid1.Cells[14,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivData').AsString);
                 StringGrid1.Cells[15,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivSluzitel').AsString);
                 StringGrid1.Cells[16,i]:= CP1251ToUTF8(MyDbf1.FieldByName('Zabelezka').AsString);
                 MyDbf1.Next;
               end
               else  MyDbf1.Next;
          end;
        MyDbf1.Close;
        StringGrid1.AutoSizeColumns;
      END;
//
// Справка за "Заявления, които не са върнати от служба : "
      IF RadioGroup1.ItemIndex = 6 THEN
      BEGIN
        MyDbf1.Open;
        MyDbf1.First;
        while not MyDbf1.EOF do
          begin
            if (CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString) = ComboBox1.Text) and
                   (CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString) = 'НЕ') then
               begin
                 i := i + 1;
                 StringGrid1.RowCount:=i+1;
                 StringGrid1.Cells[0,i]:= IntToStr(i);
                 StringGrid1.Cells[1,i]:= CP1251ToUTF8(MyDbf1.FieldByName('NomerPoreden').AsString);
                 StringGrid1.Cells[2,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString);
                 StringGrid1.Cells[3,i]:=CP1251ToUTF8(MyDbf1.FieldByName('OsnovanieDelo').AsString);
                 StringGrid1.Cells[4,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString) + '/' + MyDbf1.FieldByName('InPismoData').AsString;
                 StringGrid1.Cells[5,i]:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString);
                 StringGrid1.Cells[6,i]:=CP1251ToUTF8(MyDbf1.FieldByName('InPismoKoi').AsString);
                 StringGrid1.Cells[7,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString) + '/' + MyDbf1.FieldByName('ZayavlenieData').AsString;
                 StringGrid1.Cells[8,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString);
                 StringGrid1.Cells[9,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieImena').AsString);
                 StringGrid1.Cells[10,i]:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieVidDoc').AsString);
                 StringGrid1.Cells[11,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString) + '/' + MyDbf1.FieldByName('OutPismoData').AsString;
                 StringGrid1.Cells[12,i]:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoIzgotvil').AsString);
                 StringGrid1.Cells[13,i]:= CP1251ToUTF8(MyDbf1.FieldByName('BackPismoNomer').AsString) + '/' + CP1251ToUTF8(MyDbf1.FieldByName('BackPismoData').AsString);
                 StringGrid1.Cells[14,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivData').AsString);
                 StringGrid1.Cells[15,i]:= CP1251ToUTF8(MyDbf1.FieldByName('PribralArhivSluzitel').AsString);
                 StringGrid1.Cells[16,i]:= CP1251ToUTF8(MyDbf1.FieldByName('Zabelezka').AsString);
                 MyDbf1.Next;
               end
               else  MyDbf1.Next;
          end;
        MyDbf1.Close;
        StringGrid1.AutoSizeColumns;
      END;
//
      IF i=0 THEN ShowMessage('НЯМА ДАННИ!');
// Нулиране на формата с попълнени данни
   RadioGroup1.ItemIndex:=0;


end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
     RadioGroup1.ItemIndex:=0;
   Edit1.Text:='';
   Edit2.Text:='';
   Edit3.Text:='';
   Edit4.Text:='';
   Edit5.Text:='';
   DateEdit4.Text:='';
   DateEdit5.Text:='';
   DateEdit6.Text:='';
   DateEdit7.Text:='';
   ComboBox1.Text:='';
   StringGrid1.Clean;
end;

procedure TForm4.ComboBox1Change(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=6;
end;

procedure TForm4.ComboBox1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=6;
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=1;
end;

procedure TForm4.Edit1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=1;
end;

procedure TForm4.Edit2Change(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=2;
end;

procedure TForm4.Edit2Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=2;
end;

procedure TForm4.Edit3Change(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=3;
end;

procedure TForm4.Edit3Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=3;
end;

procedure TForm4.Edit4Change(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=4;
end;

procedure TForm4.Edit4Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=4;
end;

procedure TForm4.Edit5Change(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=5;
end;

procedure TForm4.Edit5Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=5;
end;

procedure TForm4.FormCreate(Sender: TObject);
var
  j : Integer;
begin
  StringGrid1.Cells[0,0]:='№';
  StringGrid1.Columns.Items[0].Title.Caption:='№ от архива';
  StringGrid1.Columns.Items[1].Title.Caption:='Върнато в архива';
  StringGrid1.Columns.Items[2].Title.Caption:='Основание/Дело';
  StringGrid1.Columns.Items[3].Title.Caption:='Искане(писмо) с № /от дата';
  StringGrid1.Columns.Items[4].Title.Caption:='Поискано от служба:';
  StringGrid1.Columns.Items[5].Title.Caption:='Поискано от служител:';
  StringGrid1.Columns.Items[6].Title.Caption:='Заявление № от дата';
  StringGrid1.Columns.Items[7].Title.Caption:='ЕГН на лицето';
  StringGrid1.Columns.Items[8].Title.Caption:='Име, Презиме и Фамилия';
  StringGrid1.Columns.Items[9].Title.Caption:='Вид на документа';
  StringGrid1.Columns.Items[10].Title.Caption:='Изпратено с писмо № от дата';
  StringGrid1.Columns.Items[11].Title.Caption:='Изготвил изх. писмо:';
  StringGrid1.Columns.Items[12].Title.Caption:='Върнато с писмо № от дата';
  StringGrid1.Columns.Items[13].Title.Caption:='Дата на прибиране в архива';
  StringGrid1.Columns.Items[14].Title.Caption:='Служител, прибрал заявлението в архива';
  StringGrid1.Columns.Items[15].Title.Caption:='Забележка';
  StringGrid1.AutoSizeColumns;
    for j := 0 to Form1.ComboBox1.items.Count-1 do
      Form4.ComboBox1.items.Add(Form1.ComboBox1.items[j]);
    //RadioGroup1.ItemIndex:=0;
end;

end.

