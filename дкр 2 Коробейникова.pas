type
  Node = record
    data: Integer;
    next: ^Node;
  end;

var
  head: ^Node;

// Процедура для добавления нового узла в конец списка
procedure InsertNode(data: Integer);
var
  newNode, current: ^Node;
begin
  new(newNode);
  newNode^.data := data;
  newNode^.next := nil;

  if head = nil then
    head := newNode
  else begin
    current := head;
    while current^.next <> nil do
      current := current^.next;
    current^.next := newNode;
  end;
end;

// Процедура для отображения содержимого списка
procedure DisplayList;
var
  current: ^Node;
begin
  current := head;
  if current = nil then
    WriteLn('Список пуст')
  else begin
    WriteLn('Содержимое списка:');
    while current <> nil do begin
      Write(current^.data, ' ');
      current := current^.next;
    end;
    WriteLn;
  end;
end;

var
  choice, data: Integer;

begin
  head := nil;

  repeat
    WriteLn;
    WriteLn('Меню:');
    WriteLn('1. Добавить элемент в список');
    WriteLn('2. Отобразить список');
    WriteLn('3. Завершить программу');
    Write('Выберите действие: ');
    ReadLn(choice);

    case choice of
      1: begin
           Write('Введите данные для нового элемента: ');
           ReadLn(data);
           InsertNode(data);
         end;
      2: DisplayList;
      3: WriteLn('Программа завершена');
    else
      WriteLn('Некорректный выбор');
    end;

  until choice = 3;
end.
