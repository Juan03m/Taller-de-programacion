{v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar a un módulo recursivo que retorne dicho promedio.
ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.
x. Informe los números de socio en orden creciente. 
xi. Informe los números de socio pares en orden decreciente}



program punto1;
type
    socio=record
      numero:integer;
		nombre:string;
		edad:integer;
  end;

arbol=^nodo;
    nodo=record
      dato:socio;
    h1:arbol;
    h2:arbol;
  end;
  
procedure leerSocio(var s:socio);
begin
	writeln('ingrese numero de socio');
    read(s.numero);
  if(s.numero<>0)then begin
		read(s.nombre);
		read(s.edad)
  end;
end;

procedure Insertar(var arb:arbol;s:socio);
begin
    if(arb=nil)then begin
      new(arb);
    arb^.dato:=s;
    arb^.h1:=nil;
    arb^.h2:=nil;
  end
  else if (arb^.dato.numero<s.numero)then 
      Insertar(arb^.h1,s)
  else
      Insertar(arb^.h2,s);
end;

procedure cargar(var arb:arbol);
var 
    s:socio;
begin
    leerSocio(s);
  while(s.numero<>0)do begin
      insertar(arb,s);
    leerSocio(s);
    end;
  
end;
function MaxSocio(arb:arbol):arbol;
begin
    if(arb^.h2=nil)then
      maxSocio:=nil
  else
      maxSocio:=maxSocio(arb^.h2)
 end;     
    
procedure Maximo(arb:arbol;var max:integer);
begin
        if(arb<>nil)then begin
			max:=arb^.dato.numero;
			maximo(arb^.h2,max);
		end;
end;
procedure maxEdad(a:arbol;var max:integer); 
begin
if (a<>nil)then begin
	maxEdad(a^.H1,max);
	maxEdad(a^.H2,max);
	if(a^.dato.edad>max)then 
       max:=a^.dato.edad
end;
end;

Procedure Aumentar(a:arbol);
begin 
if(a<>nil)then begin
	Aumentar(a^.H1);
	Aumentar(a^.H2);
	A^.dato.edad:=A^.dato.edad+1;
	end;
end;
Function Existe(a:arbol;num:integer):arbol;
begin 
if(a=nil)then
	existe:=nil
else if(a^.dato.numero=num)then
	existe:=a
else if (a^.dato.numero<num)then
	existe:=existe(a^.h1,num)
else 
	existe:=existe(a^.h2,num)
end;

function esta(a:arbol):boolean;
var
	ok:boolean;
begin
	if(a<>nil)then
		ok:=true
	else 
		ok:=false;

	esta:=ok;
end;

var
	a:arbol;
	max,num:integer;
begin
	max:=0;
	cargar(a)
end.
