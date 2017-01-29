program mmc;
{Programa que permite la resolución del Metodo del Minimo Cuadrado}
{Autor Christiam Hurtado C.I.: 20.100.768}
{Octubre de 2011}
{$mode objfpc}{$H+}

uses
  crt;

{$R *.res}
var num,i,valor:integer;
    resp:char;
    x:array[1..100] of real;
    y:array[1..100] of real;
    xy:array[1..100] of real;
    x2:array[1..100] of real;
    ycalc:array[1..100] of real;
    sx,sy,sxy,sx2,m,b,xcalc,yaprox:real;

begin
  Writeln('Este programa resuelve el Metodo del Minimo Cuadrado');
  Writeln();
  Write('indique la cantidad de datos a utilizar: ');
  readln(num);
  writeln();

  {este for se usa para leer todos los valores de x e y}
  for i:=1 to num do
      begin
        Write('  X (',i,'): ');
        read(x[i]);
        Write('  Y (',i,'): ');
        read(y[i]);
      end;
  {primer for para resultados}
  for i:=1 to num do
      begin
        xy[i]:=x[i]*y[i];
        x2[i]:=x[i]*x[i];
        ycalc[i]:=(m*x[i])+b;
      end;
  {for para las sumatorias}
  for i:=1 to num do
      begin
        sx:=sx+x[i];
        sy:=sy+y[i];
        sxy:=sxy+xy[i];
        sx2:=sx2+x2[i];
      end;
    {calculo de la pendiente y el punto de corte}
  m:=((sx*sy)-(num*sxy))/((sx*sx)-(num*sx2));
  b:=((sxy*sx)-(sy*sx2))/((sx*sx)-(num*sx2));

    {segundo for para resultados}
  for i:=1 to num do
      begin
        ycalc[i]:=(m*x[i])+b;
      end;
  clrscr;
  {comienzo del encabezado de la tabla}
  Writeln();
  Writeln(' ____________________________________________');
  Writeln('|    X   |   Y   |    XY   |   X2   |  Ycalc |');
  Writeln('|--------|-------|---------|--------|--------|');
  {fin del encabezado de la tabla}

  {este for imprime por pantalla los resultados}
  for i:=1 to num do
      begin
        Writeln('|  ',x[i]:2:2,'  | ',y[i]:2:2,
        ' |  ',xy[i]:2:2,' |  ',x2[i]:2:2,'  |  ',ycalc[i]:2:2,'  |');
      end;
  Writeln(' --------------------------------------------');
  writeln();
  Writeln('   Sumatorias   ');
  Writeln('S.X: ',sx:2:2,' | ','S.Y: ',sy:2:2,' | ','S.XY: ',sxy:2:2,' | ',
           'S.X2: ',sx2:2:2,' | ');
  Writeln();
  Writeln('Pendiente de la recta y punto de corte con el eje de las ordenadas');
  Writeln('m: ',m:2:2,',   b: ',b:2:2);
  Writeln();
  Writeln('  Ecuación de la recta  ');
  Writeln(m:2:2,' X +',b:2:2);
  Writeln();

  {Ultima parte, calcular cualquier valor de X}
  Writeln('Desea conocer el valor aproximado de Y para algun valor de X?');
  Write('Use 1 para SI y 0 para NO: ');
  Readln(valor);
  while valor = 1 do
      begin
        Write('Indique el valor de X: ');
        readln(xcalc);
        yaprox:=((m*xcalc)+b);
        Writeln('para X: ',xcalc:2:2,'  el valor aproximado de Y es: ',yaprox:2:2);
        Write('Desea conocer otro valor?(1 o 0): ');
        readln(resp)
     end;
  Writeln('Presione cualquier tecla para Salir');
  readkey;
end.

