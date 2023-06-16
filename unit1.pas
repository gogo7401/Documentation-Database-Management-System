unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dbf, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Menus, ExtCtrls, EditBtn, Buttons, LConvEncoding;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    DateEdit5: TDateEdit;
    Edit10: TEdit;
    Edit8: TEdit;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem9: TMenuItem;
    MyDbf1: TDbf;
    Edit1: TEdit;
    Edit11: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit9: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem5: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  dir : String;

implementation

{$R *.lfm}

uses Unit2, Unit3, Unit4;

{ TForm1 }

function CheckTrue (a: String):Boolean;
  begin
   if a = '' then result := True
      else result := False;
  end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Text:= IntToStr(StrToInt(Edit1.Text) + 1);
  Button1.Enabled:=False;
  DateEdit1.Clear;
  DateEdit2.Clear;
  DateEdit3.Clear;
  ComboBox1.ItemIndex:= -1;
  ComboBox2.ItemIndex:= -1;
  ComboBox4.ItemIndex:= -1;
  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
  Edit5.Text:='';
  Edit6.Text:='';
  Edit7.Text:='';
  Edit8.Text:='';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 // инициализация на елементите във формата
    Edit1.Text:='';
    Button1.Visible:=False;
    Label18.Caption:='';
    Edit2.Text:='';
    Edit3.Text:='';
    Edit4.Text:='';
    Edit5.Text:='';
    Edit6.Text:='';
    Edit7.Text:='';
    Edit8.Text:='';
    ComboBox1.ItemIndex:= -1;
    ComboBox2.ItemIndex:= -1;
    ComboBox4.ItemIndex:= -1;
    DateEdit1.Clear;
    DateEdit2.Clear;
    DateEdit3.Clear;
    Button3.Visible:=False;
 // Край на инициализацията
//
      MyDbf1.FilePath := dir + '/DB/';
      MyDbf1.TableName := 'application_blank.dbf';
      MyDbf1.Open;
      MyDbf1.First;
     // MyDbf1.Edit;
      while not MyDbf1.EOF do
         begin
           if (MyDbf1.FieldByName('ZayavlenieNomer').AsString = Edit11.Text) and (CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString) = 'НЕ') then
               begin
                 Edit1.Text:= CP1251ToUTF8(MyDbf1.FieldByName('NomerPoreden').AsString);
                 Edit2.Text:= CP1251ToUTF8(MyDbf1.FieldByName('OsnovanieDelo').AsString);
                 Edit3.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString);
                 DateEdit1.Text:= MyDbf1.FieldByName('InPismoData').AsString;
                 ComboBox1.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoOtkade').AsString);
                 Edit4.Text:= CP1251ToUTF8(MyDbf1.FieldByName('InPismoKoi').AsString);
                 Edit5.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString);
                 DateEdit2.Text:= MyDbf1.FieldByName('ZayavlenieData').AsString;
                 Edit6.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieEGN').AsString);
                 Edit7.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieImena').AsString);
                 ComboBox2.Text:= CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieVidDoc').AsString);
                 Edit8.Text:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoNomer').AsString);
                 DateEdit3.Text:= MyDbf1.FieldByName('OutPismoData').AsString;
                 ComboBox4.Text:= CP1251ToUTF8(MyDbf1.FieldByName('OutPismoIzgotvil').AsString);
                 MyDbf1.Next;
                 Button3.Visible:= True;
               end
               else  MyDbf1.Next;
         end;
         MyDbf1.Close;
         IF not Button3.Visible THEN ShowMessage('Търсеното заявление не е открито или е вече в архива!');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
      if CheckTrue(Edit9.Text) or CheckTrue(Edit11.Text) or CheckTrue(DateEdit4.Text) or CheckTrue(DateEdit5.Text) or CheckTrue(ComboBox3.Text) then ShowMessage('Всички полета трябва да са попълнени!')
         else
          begin
            MyDbf1.FilePath := dir + '/DB/';
            MyDbf1.TableName := 'application_blank.dbf';
            MyDbf1.Open;
            MyDbf1.First;

            while not MyDbf1.EOF do
               begin
                 if (MyDbf1.FieldByName('ZayavlenieNomer').AsString = Edit11.Text) and (Edit11.Text = Edit5.Text) and (CP1251ToUTF8(MyDbf1.FieldByName('BackPismoDaNe').AsString) = 'НЕ') then
                     begin
                       MyDbf1.Edit;
                       MyDbf1.FieldByName('BackPismoNomer').AsString:= UTF8ToCP1251(Edit9.Text);
                       MyDbf1.FieldByName('BackPismoData').AsString:= DateEdit4.Text;
                       MyDbf1.FieldByName('PribralArhivData').AsString:= DateEdit5.Text;
                       MyDbf1.FieldByName('PribralArhivSluzitel').AsString:= UTF8ToCP1251(ComboBox3.Text);
                       MyDbf1.FieldByName('BackPismoDaNe').AsString:= UTF8ToCP1251('ДА');
                       MyDbf1.FieldByName('Zabelezka').AsString:= UTF8ToCP1251(Edit10.Text);
                       MyDbf1.Post;
                       MyDbf1.Next;
                     end
                     else  MyDbf1.Next;
               end;
               MyDbf1.Close;
               ShowMessage('Данните са записани успешно!');
               Edit9.Text:='';
               Edit10.Text:='';
               Edit11.Text:='';
               ComboBox3.ItemIndex:= -1;
               DateEdit4.Clear;
               DateEdit5.Clear;
               // инициализация на елементите във формата
                  Edit1.Text:='';
                  Button1.Visible:=False;
                  Label18.Caption:='';
                  Edit2.Text:='';
                  Edit3.Text:='';
                  Edit4.Text:='';
                  Edit5.Text:='';
                  Edit6.Text:='';
                  Edit7.Text:='';
                  Edit8.Text:='';
                  ComboBox1.ItemIndex:= -1;
                  ComboBox2.ItemIndex:= -1;
                  ComboBox4.ItemIndex:= -1;
                  DateEdit1.Clear;
                  DateEdit2.Clear;
                  DateEdit3.Clear;
                  Button3.Visible:=False;
               // Край на инициализацията
          end;

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var A, B, C : String;
    i : Integer;
    F3 : TextFile;
begin
if CheckTrue(Edit2.Text) or CheckTrue(Edit3.Text) or
   CheckTrue(Edit4.Text) or CheckTrue(Edit5.Text) or
   CheckTrue(Edit6.Text) or CheckTrue(Edit7.Text) or
   CheckTrue(DateEdit1.Text) or CheckTrue(DateEdit2.Text) or
   CheckTrue(ComboBox1.Text) or CheckTrue(ComboBox2.Text) then ShowMessage('Всички полета трябва да са попълнени!')
 else
 begin
  A := '';
  B := '';
  C := '';
  A := ComboBox1.Text;
  A := AnsiUpperCase(A);
  for i := 0 to ComboBox1.Items.Count -1 do
     begin
       B := ComboBox1.Items[i];
       B := AnsiUpperCase(B);
       if  A = B then C := 'TRUE';
     end;
  if C <> 'TRUE' then
     begin
       if ComboBox1.Text <> '' then
          begin
            ComboBox1.Items.Add(ComboBox1.Text);
            AssignFile(F3, dir + '\sluzba.ini');
            Append(F3);
            WriteLn(F3,'');
            Write(F3, UTF8ToCP1251(ComboBox1.Text));
            CloseFile(F3);
          end;
     end;
// Запис в БД
    MyDbf1.FilePath := dir + '/DB/';
    MyDbf1.TableName := 'application_blank.dbf';
    MyDbf1.Open;
    MyDbf1.Last;
    MyDbf1.Append;
    MyDbf1.FieldByName('NomerPoreden').AsString:= UTF8ToCP1251(Edit1.Text);
    MyDbf1.FieldByName('OsnovanieDelo').AsString:= UTF8ToCP1251(Edit2.Text);
    MyDbf1.FieldByName('InPismoNomer').AsString:= UTF8ToCP1251(Edit3.Text);
    MyDbf1.FieldByName('InPismoData').AsString:= DateEdit1.Text;
    MyDbf1.FieldByName('InPismoOtkade').AsString:= UTF8ToCP1251(ComboBox1.Text);
    MyDbf1.FieldByName('InPismoKoi').AsString:= UTF8ToCP1251(Edit4.Text);
    MyDbf1.FieldByName('ZayavlenieNomer').AsString:= UTF8ToCP1251(Edit5.Text);
    MyDbf1.FieldByName('ZayavlenieData').AsString:= DateEdit2.Text;
    MyDbf1.FieldByName('ZayavlenieEGN').AsString:= UTF8ToCP1251(Edit6.Text);
    MyDbf1.FieldByName('ZayavlenieImena').AsString:= UTF8ToCP1251(Edit7.Text);
    MyDbf1.FieldByName('ZayavlenieVidDoc').AsString:= UTF8ToCP1251(ComboBox2.Text);

    MyDbf1.FieldByName('BackPismoDaNe').AsString:= UTF8ToCP1251('НЕ');
    MyDbf1.Post;
    MyDbf1.Close;
    Edit5.Text := '';
    DateEdit2.Clear;
//    Edit6.Text := '';
//    Edit7.Text := '';
//    ComboBox2.Text:='';
    Button1.Enabled:=True;
    ShowMessage('Данните са записани успешно!') ;
    BitBtn1.Enabled:=True;
 end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
    Panel1.Visible:= False;
  Panel2.Visible:= False;
  Panel3.Visible:= False;
  Panel4.Visible:= False;
  Image2.Visible:= False;
  Image1.Visible:= True;
  BitBtn1.Visible:= False;
  BitBtn2.Visible:= False;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
    Edit5.Text := '';
    DateEdit2.Clear;
    Edit6.Text := '';
    Edit7.Text := '';
    ComboBox2.Text:='';
end;

procedure TForm1.FormCreate(Sender: TObject);
var F1, F2 : TextFile;
    SluzitelName, SluzbaName : String;
begin
// Инициализация
   dir := GetCurrentDir;
// Пореден номер
   MyDbf1.FilePath := dir + '/DB/';
   MyDbf1.TableName := 'application_blank.dbf';
   MyDbf1.Open;
   MyDbf1.Last;
   Edit1.Text:= MyDbf1.FieldByName('NOMERPOREDEN').AsString;
   MyDbf1.Close;
   if Edit1.Text = '' then Edit1.Text := '0';
// Служители
   AssignFile(F1, dir + '\sluzitel.ini');
   Reset(F1);
   while not Eof(F1) do
     begin
       ReadLn(F1, SluzitelName);
       ComboBox3.Items.Add(CP1251ToUTF8(SluzitelName));
       ComboBox4.Items.Add(CP1251ToUTF8(SluzitelName));
     end;
   CloseFile(F1);
// Служби
AssignFile(F2, dir + '\sluzba.ini');
Reset(F2);
while not Eof(F2) do
  begin
    ReadLn(F2, SluzbaName);
    ComboBox1.Items.Add(CP1251ToUTF8(SluzbaName));
  end;
CloseFile(F2);
// инициализация на елементите във формата
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
   ComboBox1.ItemIndex:= -1;
   ComboBox2.ItemIndex:= -1;
   ComboBox3.ItemIndex:= -1;
   ComboBox4.ItemIndex:= -1;
   DateEdit1.Clear;
   DateEdit2.Clear;
   DateEdit3.Clear;
   DateEdit4.Clear;
   DateEdit5.Clear;
// Край на инициализацията
  Panel1.Visible:= False;
  Panel2.Visible:= False;
  Panel3.Visible:= False;
  Panel4.Visible:= False;
  Image2.Visible:= False;
  Image1.Visible:= True;
  BitBtn1.Visible:= False;
  BitBtn2.Visible:= False;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  Panel1.Visible := True;
  Panel1.Enabled := True;
  Panel3.Visible := True;
  Panel3.Enabled := True;
  Panel2.Visible:= False;
  Panel4.Visible:= False;
  Image1.Visible:= False;
  Image2.Visible:= True;
  BitBtn1.Visible:= True;
  BitBtn2.Visible:= True;
  DateEdit1.Clear;
  DateEdit2.Clear;
  DateEdit3.Clear;
  ComboBox1.ItemIndex:= -1;
  ComboBox2.ItemIndex:= -1;
  ComboBox4.ItemIndex:= -1;
  Button1.Visible:=True;
  Panel3.Visible:=True;
  Label18.Caption:='* Последно въведен номер';
  // Инициализация
   dir := GetCurrentDir;
// Пореден номер
   MyDbf1.FilePath := dir + '/DB/';
   MyDbf1.TableName := 'application_blank.dbf';
   MyDbf1.Open;
   MyDbf1.Last;
   Edit1.Text:= MyDbf1.FieldByName('NOMERPOREDEN').AsString;
   MyDbf1.Close;
   if Edit1.Text = '' then Edit1.Text := '0';
   Edit2.SetFocus;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Panel1.Enabled := False;
  Panel1.Visible := True;
  Panel4.Enabled := False;
  Panel4.Visible := True;
  Panel2.Visible := True;
  Panel3.Visible := False;
  Image1.Visible:= False;
  Image2.Visible:= False;
  BitBtn1.Visible:= False;
  BitBtn2.Visible:= True;
  DateEdit4.Clear;
  DateEdit5.Clear;
  ComboBox3.ItemIndex:= -1;
  // инициализация на елементите във формата
     Edit1.Text:='';
     Button1.Visible:=False;
     Label18.Caption:='';
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
     ComboBox1.ItemIndex:= -1;
     ComboBox2.ItemIndex:= -1;
     ComboBox3.ItemIndex:= -1;
     ComboBox4.ItemIndex:= -1;
     DateEdit1.Clear;
     DateEdit2.Clear;
     DateEdit3.Clear;
     DateEdit4.Clear;
     DateEdit5.Clear;
     Button3.Visible:=False;
     Edit11.SetFocus;
  // Край на инициализацията
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  Panel1.Visible:= False;
  Panel2.Visible:= False;
  Panel3.Visible := False;
  Panel4.Visible := False;
  Image1.visible:=True;
  Image2.Visible:=False;
  BitBtn2.Visible:= False;
  Form2.ShowModal;

end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  Form4.ShowModal;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin

  Form3.ShowModal;
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin

end;

end.

