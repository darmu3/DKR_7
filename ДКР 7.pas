uses GraphABC;
Uses Build;
var i: integer;
var x1, y1, x2, y2, x3, y3, l, t: integer;

procedure text;
begin
  textout(10, 100, 'Left: влево');
  textout(10, 120, 'Right: вправо');
  textout(10, 140, 'Up: вверх');
  textout(10, 160, 'Down: вниз');
  textout(10, 180, 'W: увеличение');
  textout(10, 200, 'S: уменьшение');
  textout(10, 220, 'E: + 1 итерация(до 5)');
  textout(10, 240, 'Q: - 1 итерация(до 0)');
end;

procedure KeyDown(key: integer);
begin
  i := 0;
  case key of
    VK_Up: begin y1 := y1 - 15; y2 := y2 - 15; y3 := y3 - 15 end;
    VK_Down: begin y1 := y1 + 15; y2 := y2 + 15; y3 := y3 + 15 end;
    VK_Left: begin x1 := x1 - 15; x2 := x2 - 15; x3 := x3 - 15 end;
    VK_Right: begin x1 := x1 + 15; x2 := x2 + 15; x3 := x3 + 15 end;
    VK_E: begin t += 1; if t=6 then t:=5; end;
    VK_Q: begin t -= 1; if t=-1 then t:=0; end;
    VK_W:
      begin
        x1 := Round(x1 * 1.1);
        x2 := Round(x2 * 1.1);
        x3 := Round(x3 * 1.1);
        y1 := Round(y1 * 1.1);
        y2 := Round(y2 * 1.1);
        y3 := Round(y3 * 1.1);
        l:=round(l*1.1)
      end;
      VK_S:
      begin
        x1 := Round(x1 / 1.1);
        x2 := Round(x2 / 1.1);
        x3 := Round(x3 / 1.1);
        y1 := Round(y1 / 1.1); 
        y2 := Round(y2 / 1.1);
        y3 := Round(y3 / 1.1);
        l:=round(l/1.1)
      end;
    end;
    Window.Clear;
    text;
    Draw(x1, y1, l, pi / 3, t);
    Draw(x2, y2, l, pi, t);
    Draw(x3, y3, l, -pi / 3, t);
    redraw;
    end;
begin
  SetWindowSize(850, 500);
  SetWindowCaption('Фрактал: Снежинка Коха');
  Text;
  LockDrawing;
  x1:=410; x2:= 810; x3:=610;
  y1:=354; y2:=354; y3:=8;
  t:=0;
  l:=400;
  Draw(x1, y1, l, pi / 3, t);
  Draw(x2, y2, l, pi, t);
  Draw(x3, y3, l, -pi / 3, t);
  redraw;
  onKeyDown += KeyDown;
end.