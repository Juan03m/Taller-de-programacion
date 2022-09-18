{Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada 
venta se lee código de producto, fecha y cantidad de unidades vendidas. La lectura 
finaliza con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por 
código de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total vendida.
Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne 
la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne 
la cantidad total de unidades vendidas de ese producto.}
program ej2tp3;
type
fecha=record
    dia:1..31;
    mes:1..12;
    ano:integer;
end;

venta= record//de cada venta se lee código de producto, fecha y cantidad de unidades vendidas
    codigo:integer;
    fecha:fecha;
    vendidos:integer;
end;
    
arbol = ^nodo;
nodo = record
    dato:venta;
    HI:arbol;
    HD:arbol;
end;

//------------------------------------------------------------------------------
{a. Implemente un módulo que lea información de ventas de un comercio. De cada 
venta se lee código de producto, fecha y cantidad de unidades vendidas. La lectura 
finaliza con el código de producto 0. Un producto puede estar en más de una venta.}

//i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
procedure crearArbol(var a:arbol; var a2:arbol);
    procedure leerVenta(var v:venta);
    begin
        readln(v.codigo);
        //randomize;
        //v.codigo:=random(100);
        if(v.codigo<>0)then begin
            {readln(v.fecha.dia);
            readln(v.fecha.mes);
            readln(v.fecha.ano);
            readln(v.vendidas);}
            v.fecha.dia:=random(30)+1;
            v.fecha.mes:=random(11)+1;
            v.fecha.ano:=random(10)+2010;
            v.vendidos:=random(14)+1;
            writeln('Cod: ',v.codigo,'| Ventas: ',v.vendidos);
        end;
    end;
    
    procedure insertarVenta(var a:arbol;v:venta);
    var n:arbol;
    begin
        new(n); n^.dato:=v; n^.HI:=nil; n^.HD:=nil;
        if(a=nil)then
            a:=n
        else begin
            if(v.codigo<a^.dato.codigo)then insertarVenta(a^.HI,v)
            else insertarVenta(a^.HD,v);
        end;
    end;
    
    {ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por 
    código de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total vendida.
    Nota: El módulo debe retornar los dos árboles.}
    procedure insertarVenta2(var a:arbol;v:venta);
    var n:arbol;
    begin
        new(n); n^.dato:=v; n^.HI:=nil; n^.HD:=nil;
        if(a=nil)then
            a:=n
        else begin
            if(v.codigo<a^.dato.codigo)then insertarVenta(a^.HI,v)
            else if(v.codigo>a^.dato.codigo)then insertarVenta(a^.HD,v)
            else
                a^.dato.vendidos:=a^.dato.vendidos+v.vendidos;
        end;
    end;
var v:venta; i:integer;
begin
    {leerVenta(v):
    while(v.codigo<>0)do begin
        insertarVenta(a,v); // i.
        insertarVenta2(a2,v); //ii.
        leerVenta(v);
    end;}
    for i:=1 to 20 do begin
        leerVenta(v);
        insertarVenta(a,v); //i.
        insertarVenta2(a2,v); //ii.
    end;
end;
//------------------------------------------------------------------------------
{b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne 
la cantidad total de unidades vendidas de ese producto.}
{c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne 
la cantidad total de unidades vendidas de ese producto.}
function totalVendido(a:arbol;d:integer):integer;
begin
    if(a<>nil)then begin
        if(a^.dato.codigo>d)then totalVendido:=totalVendido(a^.HI,d)
        else if(d>a^.dato.codigo)then totalVendido:=totalVendido(a^.HD,d)
        else if(d=a^.dato.codigo)then totalVendido:=totalVendido(a^.HD,d)+a^.dato.vendidos
    end else
        totalVendido:=0;
end;
//------------------------------------------------------------------------------
//PP
var
    a,a2:arbol; total1,total2,d:integer;
begin
    crearArbol(a,a2);
    readln(d);
    total1:=totalVendido(a,d);
    writeln('Total ',d,' vendidos: ', total1);
    total2:=totalVendido(a,d);
    writeln('Total ',d,' vendidos: ', total2);
end.


