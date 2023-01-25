uses GraphABC;
var i: integer;
var x1, y1, x2, y2, x3, y3, dx1, dy1, dx2, dy2, dx3, dy3, l, t: integer;

procedure text;
begin
  textout(10, 100, 'Left: влево');
  textout(10, 120, 'Right: вправо');
  textout(10, 140, 'Up: вверх');
  textout(10, 160, 'Down: вниз');
  textout(10, 180, 'W: увеличение');
  textout(10, 200, 'S: уменьшение');
  textout(10, 220, 'E: + 1 итерация');
  textout(10, 240, 'Q: - 1 итерация');
end;


procedure Draw(x, y, l, u: Real; t: Integer);

  procedure Draw2(var x, y: Real; l, u: Real; t: Integer);
  
  begin
    Draw(x, y, l, u, t);
    x := x + l * cos(u);
    y := y - l * sin(u);
  end;

begin
  if t > 0 then
  begin
    l := l / 3;
    Draw2(x, y, l, u, t - 1);
    Draw2(x, y, l, u + pi / 3, t - 1);
    Draw2(x, y, l, u - pi / 3, t - 1);
    Draw2(x, y, l, u, t - 1);
  end
  else
    Line(Round(x), Round(y), Round(x + cos(u) * l), Round(y - sin(u) * l))
end;
procedure KeyDown(key: integer);
begin
  l := 400;
  case key of
    VK_Up: begin y1 := y1 - 5; y2 := y2 - 5; y3 := y3 - 5 end;
    VK_Down: begin y1 := y1 + 5; y2 := y2 + 5; y3 := y3 + 5 end;
    VK_Left: begin x1 := x1 - 5; x2 := x2 - 5; x3 := x3 - 5 end;
    VK_Right: begin x1 := x1 + 5; x2 := x2 + 5; x3 := x3 + 5 end;
    VK_E: begin t += 1; if t=6 then t:=5; end;
    VK_Q: begin t -= 1; if t=-1 then t:=0; end;
    VK_W:
      begin
        l := l + 40;
        x1 := x1 + l;
        x2 := x2 + l;
        x3 := x3 + l;
        y1 := y1 + l;
        y2 := y2 + l;
        y3 := y3 + l;
      end;
      VK_S:
      begin
        l := l - 40;
        x1 := x1 - l;
        x2 := x2 - l;
        x3 := x3 - l;
        y1 := y1 - l; 
        y2 := y2 - l;
        y3 := y3 - l;
      end;
    end;
    Window.Clear;
    text;
    Draw(x1, y1, 400, pi / 3, t);
    Draw(x2, y2, 400, pi, t);
    Draw(x3, y3, 400, -pi / 3, t);
    redraw;
    end;
begin
  SetWindowSize(850, 500);
  SetWindowCaption('Фрактал: Снежинка Коха');
  Text;
  LockDrawing;
  x1:=410; x2:= 810; x3:=610;
  y1:=354; y2:=354; y3:=8;
  dx1:=0; dy1:=-4; dx2:=0; dy2:=-4; dx3:=0; dy3:=-4;
  t:=0;
  l:=400;
  Draw(x1, y1, 400, pi / 3, t);
  Draw(x2, y2, 400, pi, t);
  Draw(x3, y3, 400, -pi / 3, t);
  redraw;
  onKeyDown += KeyDown;
end.
