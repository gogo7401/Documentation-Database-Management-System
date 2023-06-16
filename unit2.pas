unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dbf, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, EditBtn, ExtCtrls, ButtonPanel, Buttons, LConvEncoding;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ComboBox4: TComboBox;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    DateEdit5: TDateEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit8: TEdit;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    MyDbf1: TDbf;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;
  S : String;

implementation

{$R *.lfm}

{ TForm2 }

uses Unit1;

procedure TForm2.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  S := '';
  for i := 0 to Form1.ComboBox4.items.Count-1 do
      Form2.ComboBox4.items.Add(Form1.ComboBox4.items[i]);
  Form2.Edit8.Text:='';
  Form2.DateEdit3.Text:='';
  Form2.ComboBox4.Text:='';
  Form2.Edit1.Text:='';
  Form2.Edit2.Text:='';
  Form2.DateEdit4.Text:='';
  CheckBox1.Checked:=False;
  CheckBox2.Checked:=False;
end;

procedure TForm2.CheckBox1Change(Sender: TObject);
begin


end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
   broi : Integer;
   zav : String;
begin
  S := '';
  zav := '';
  broi:= 0;
  if (Form2.Edit8.Text = '') or (Form2.DateEdit3.Text = '') or (Form2.ComboBox4.Text = '') then
     begin
       S := 'none';
       ShowMessage('Въведете всички данни от изходящото писмо преди да продължите!');
     end;
  if ((CheckBox1.Checked) and ((Edit1.Text = '') or (DateEdit5.Text = ''))) or
     ((CheckBox2.Checked) and ((Edit2.Text = '') or (DateEdit4.Text = ''))) then
     begin
     ShowMessage('Липсват данни!');
     S := 'none';
     end;
  if S = '' then
     begin
      if CheckBox1.Checked then
         begin
         zav := '';
        // Запис в БД
            MyDbf1.FilePath := dir + '/DB/';
            MyDbf1.TableName := 'application_blank.dbf';
            MyDbf1.Open;
            MyDbf1.First;
            while not MyDbf1.EOF do
               begin
                 if (CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString) = Edit1.Text) and
                 (MyDbf1.FieldByName('ZayavlenieData').AsString = DateEdit5.Text) then
                     begin
                       zav := zav + '[' + CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString) + ' / ' + MyDbf1.FieldByName('ZayavlenieData').AsString + ']';
                       MyDbf1.Edit;
                       MyDbf1.FieldByName('OutPismoNomer').AsString:= UTF8ToCP1251(Form2.Edit8.Text);
                       MyDbf1.FieldByName('OutPismoData').AsString:= Form2.DateEdit3.Text;
                       MyDbf1.FieldByName('OutPismoIzgotvil').AsString:= UTF8ToCP1251(Form2.ComboBox4.Text);
                       MyDbf1.Post;
                       MyDbf1.Next;
                     end
                     else  MyDbf1.Next;
               end;
               MyDbf1.Close;
               if zav = '' then ShowMessage('Допуснали сте неточност, моля проверете данните!')
                  else ShowMessage('Данните са записани успешно в заявление с номер: ' + zav + '.');
         end;
      if CheckBox2.Checked then
         begin
          zav := '';
         // Запис в БД
            MyDbf1.FilePath := dir + '/DB/';
            MyDbf1.TableName := 'application_blank.dbf';
            MyDbf1.Open;
            MyDbf1.First;
            while not MyDbf1.EOF do
               begin
                 if (CP1251ToUTF8(MyDbf1.FieldByName('InPismoNomer').AsString) = Edit2.Text) and (MyDbf1.FieldByName('InPismoData').AsString = DateEdit4.Text) then
                     begin
                       zav := zav + '[' + CP1251ToUTF8(MyDbf1.FieldByName('ZayavlenieNomer').AsString) + ']';
                       MyDbf1.Edit;
                       MyDbf1.FieldByName('OutPismoNomer').AsString:= UTF8ToCP1251(Form2.Edit8.Text);
                       MyDbf1.FieldByName('OutPismoData').AsString:= Form2.DateEdit3.Text;
                       MyDbf1.FieldByName('OutPismoIzgotvil').AsString:= UTF8ToCP1251(Form2.ComboBox4.Text);
                       MyDbf1.Post;
                       broi := broi + 1;
                       MyDbf1.Next;
                     end
                     else  MyDbf1.Next;
               end;
               MyDbf1.Close;
               if broi = 0 then ShowMessage('Допуснали сте неточност, моля проверете данните!')
                  else
                    begin
                       ShowMessage('Данните са записани успешно в ' + IntToStr(broi) + ' заявления със следните номера: ' + zav + '.');
                        Form2.Edit8.Text:='';
                        Form2.DateEdit3.Text:='';
                        Form2.ComboBox4.Text:='';
                        Form2.Edit1.Text:='';
                        Form2.Edit2.Text:='';
                        Form2.DateEdit4.Text:='';
                    end;
         end;

     end;

end;

procedure TForm2.Button1Click(Sender: TObject);
begin
    Form2.Edit8.Text:='';
  Form2.DateEdit3.Text:='';
  Form2.ComboBox4.Text:='';
  Form2.Edit1.Text:='';
  Form2.Edit2.Text:='';
  Form2.DateEdit4.Text:=''
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin

end;

procedure TForm2.CheckBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CheckBox2.Checked:=False;
end;

procedure TForm2.CheckBox2Change(Sender: TObject);
begin


end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin

end;

procedure TForm2.CheckBox2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CheckBox1.Checked:=False;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
  CheckBox1.Checked:=True;
  CheckBox2.Checked:=False;
end;

procedure TForm2.Edit2Change(Sender: TObject);
begin
  CheckBox2.Checked:=True;
  CheckBox1.Checked:=False;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin

end;

end.

