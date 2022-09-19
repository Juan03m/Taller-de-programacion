{1) Una obra social dispone de un árbol binario de búsqueda con la información de sus 
afiliados. De cada afiliado se conoce: Número de afiliado, Nro de DNI, Plan (1..5) y año de
anio af la obra social. El árbol se encuentra ordenado por número de afiliado. Se 
solicita:
Implementar un módulo que reciba el árbol de afiliados, Nro de DNI Num1, Nro de DNI 
Num2 y un número de Plan, y retorne un vector ordenado por Nro de DNI del afiliado. El 
vector debe contener el número de afiliado y DNI de aquellos afiliados cuyo Nro de DNI se
encuentra comprendido entre Num1 y Num2 (siendo Num1 menor que Num2) y el Plan se
corresponda con el recibido por parámetro. Por norma de la obra social, cada Plan puede 
contar con af lo sumo 500 afiliados. }



program parcial;
const
	dimF=500;
type
	
	rango=1..5;
	afiliado=record
		Nafi:integer;
		dni:integer;
		Nplan:rango;
		ano:integer
		end;
	
	arbol=^nodo;
		nodo=record
			dato:afiliado;
			HI:arbol;
			HD:arbol
		end;
	afi=record
		num1:integer;
		num2:integer;
		plan:rango
	end;
	afiliado2=record
		n_afi:integer;
		n_dni:integer;
		n_plan:rango
	end;
	vector=array[1..dimF]of afiliado2;
	
		
	
procedure LeerAfiliado(var a:afiliado);
begin
	writeln('ingrese el numero de afiliado');
	read(a.Nafi);
	if(a.Nafi<>-1)then begin
	writeln('ingrese numero de dni');
	read(a.dni);
	writeln('ingrese numero de plan');
	read(a.Nplan);
	writeln('ingrese ano de afiliacion');
	read(a.ano);
	end;
end;

procedure Insertar(var arb:arbol;a:afiliado);
var
nuevo:arbol;
begin
	if(arb=nil)then begin
		new(nuevo);
		nuevo^.dato:=a;
		nuevo^.HI:=nil;
		nuevo^.HD:=nil;
		arb:=nuevo
	end
	else if(arb^.dato.Nafi<=a.Nafi)then 
		insertar(arb^.HD,a)
	else
		insertar(arb^.HI,a);
end;

procedure cargar(var arb:arbol);
var
	a:afiliado;
begin
	leerAfiliado(a);
	while(a.Nafi<>-1)do begin
		insertar(arb,a);
		leerAfiliado(a);
	end;
end;

function ESTA(datos:afi;a:afiliado):boolean;
begin
	if(datos.num1<=a.dni) and (datos.num2>=a.dni) and (a.Nplan=datos.plan)then
		esta:=true
	else 
		esta:=false;
end;


Procedure Seleccion ( var v: vector; dimL: Integer );
var 
    i, j, p: Integer;
    item:afiliado2;
begin
    for i:=1 to dimL-1 do 
    begin 
        p := i;
        for j := i+1 to dimL do
            if v[ j ].n_dni < v[ p ].n_dni then p:=j;

        item := v[ p ];   
        v[ p ] := v[ i ];   
        v[ i ] := item;
    end;
end;
	
procedure leerDatos(var datos:afi);
begin
	writeln('ingrese uno de los valores de busqueda');
	readln(datos.num1);
	writeln('ingrese uno de los valores de busqueda');
	readln(datos.num2);
	writeln('ingrese el plan de busqueda');
	readln(datos.plan);
end;
	
	
		
procedure cargarVector(arb:arbol;datos:afi;var v:vector;var dimL:integer;afi2:afiliado2);
begin
	if(arb<>nil)and(dimL<dimF) then begin
		cargarVector(arb^.HI,datos,v,dimL,afi2);
		if(ESTA(datos,arb^.dato)=true)then begin
			afi2.n_afi:=arb^.dato.Nafi;
			afi2.n_dni:=arb^.dato.dni;
			afi2.n_plan:=arb^.dato.Nplan;
			v[dimL]:=afi2;
			dimL:=dimL+1;
		end;
		cargarVector(arb^.HD,datos,v,dimL,afi2);
		end
		else
		seleccion(v,dimL);
end;
		
	

var
arb:arbol;
datos:afi;
afi2:afiliado2;
v:vector;
dimL:integer;
begin
	dimL:=1;
	cargar(arb);
	leerDatos(datos);
	cargarVector(arb,datos,v,dimL,afi2);
end.



