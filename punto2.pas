
program punto2;
const dimf=300;
type
	oficina=record
		codigo:integer;
		dni:integer;
		valor:real;
	end;
	oficinas=array[1..300] of oficina;


procedure leerOfi(var ofi:oficina);
begin
	writeln('ingrese el codigo');
	readln (ofi.codigo);
	if(ofi.codigo<>-1)then begin
		writeln('ingrese el dni');
		readln (ofi.dni);
		writeln('ingrese el valor de la vivienda');
		readln (ofi.valor);
	end;
end;
procedure cargarVector(var o:oficinas;ofi:oficina;var dimL:integer);
begin
	dimL:=1;
	leerOfi(ofi);
	while(dimL<dimF)and (ofi.codigo<>-1) do begin
	leerOfi(ofi);
	o[dimL]:=ofi;
	dimL:=dimL+1;
	end;
end;
procedure Ordenar (var o: oficinas; dimL: integer);

var i, j, pos: integer; item: oficina;	
		
begin
 for i:= 1 to dimL - 1 do 
 begin {busca el mínimo y guarda en pos la posición}
   pos := i;
   for j := i+1 to dimL do 
        if (o[j].codigo < o[pos].codigo) then pos:=j;

   {intercambia v[i] y v[pos]}
   item := o[pos];   
   o[pos] := o[i];   
   o[i] := item;
 end;
end;

procedure Mostrar(o:oficinas;dimL:integer);
var
	i:integer;
begin
	for i:= 1 to dimL do
		write('el codigo es',o[i].codigo);
		write('el dni es', o[i].dni);
		write('el valor es',o[i].valor);
end;











var
	ofi:oficina;
	o:oficinas;
	dimL:integer;
begin
	leerOfi(ofi);
	cargarVector(o,ofi,dimL);
	ordenar(o,dimL);
	Mostrar(o,dimL)
end.
