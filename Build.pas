Unit Build;
Interface
Uses GraphABC;
procedure Draw(x, y, l, u: Real; t: Integer);
implementation
var i: integer;
var x1, y1, x2, y2, x3, y3, dx1, dy1, dx2, dy2, dx3, dy3, l, t: integer;
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
    VK_Up: begin y1 := y1 - 15; y2 := y2 - 15; y3 := y3 - 15 end;
    VK_Down: begin y1 := y1 + 15; y2 := y2 + 15; y3 := y3 + 15 end;
    VK_Left: begin x1 := x1 - 15; x2 := x2 - 15; x3 := x3 - 15 end;
    VK_Right: begin x1 := x1 + 15; x2 := x2 + 15; x3 := x3 + 15 end;
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
    end;
Begin
  SetWindowSize(850, 500);
  SetWindowCaption('Фрактал: Снежинка Коха');
  LockDrawing;
  KeyDown(0);
  OnkeyDown += KeyDown;
end.