{a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior al 2010
*  De cada alumno se lee legajo, DNI y año de ingreso.
*  La estructura generada debe ser eficiente para la búsqueda por número de legajo. 
b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro. 
c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo esté comprendido entre dos valores que se reciben como parámetro. 
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.}


program punto3;
type
	alumno=record
		ano:integer;
		legajo:integer;
		dni:integer;
	end;
	
	arbol=^nodo;
		nodo=record
			dato:alumno;
			HI:arbol;
			HD:arbol;
		end;
	
	
procedure LeerAlumno(var a:alumno);
begin
	writeln('ingrese el ano de ingreso');
	read(a.ano);
	if(a.ano>=2010)then begin
	writeln('ingrese el legajo');
	read(a.legajo);
	writeln('ingrese el dni');
	read(a.dni);
	end;
end;

procedure Insertar(var arb:arbol;a:alumno);
var
	nuevo:arbol;
begin
	if(arb=nil)then begin
	 new(nuevo);
		nuevo^.dato:=a;
		nuevo^.HI:=nil;
		nuevo^.HD:=nil; 
	end 
	else if(arb^.dato.legajo<a.legajo)then 
		Insertar(arb^.HI,a)
	else
		Insertar(arb^.HD,a)	
	end;
			

procedure cargar(var arb:arbol);
var
	a:alumno;
begin
	leerAlumno(a);
	while(a.ano>=2010)do begin
		Insertar(arb,a);
		leerAlumno(a)
	end;
end;


{b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.} 

procedure menor(arb:arbol;valor:integer);
begin
	if(arb<>nil)then begin
		menor(arb^.HI,valor);
		if(arb^.dato.legajo<valor)then
			writeln(arb^.dato.ano,arb^.dato.dni);
		menor(arb^.HD,valor)
	end;

end;

{c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo esté comprendido entre dos valores que se reciben como parámetro.}
procedure EntreValores(arb:arbol;valorA,valorB:integer);
begin
	if(arb<>nil)then begin
		EntreValores(arb^.HI,valorA,valorB);
		if(arb^.dato.legajo>=valorA) and (arb^.dato.legajo<=valorB)then
			writeln(arb^.dato.ano,arb^.dato.dni);
		EntreValores(arb^.HD,valorA,valorB);
	end;
end;	
	
	

{d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.}

procedure Maxi(arb:arbol;var max:integer);
begin
	if(arb<>nil)then begin
		Maxi(arb^.HI,max);
		if(arb^.dato.dni>max)then
			max:=arb^.dato.dni;
		maxi(arb^.HD,max);
	end;
end;

{e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.}
function esImpar(num:integer):boolean;
begin
		if(num MOD 2=1)then
			esImpar:=true
		else
			esImpar:=false;
			
end;
procedure Impares(arb:arbol;var cant:integer);
begin
		if(arb<>nil)then begin
			Impares(arb^.HI,cant);
			if(esImpar(arb^.dato.dni)=true)then
				cant:=cant+1;
			Impares(arb^.HD,cant)
		end;
end;


procedure Mostrar(arb:arbol);
begin
	if(arb<>nil)then begin
		mostrar(arb^.HI);
		writeln(arb^.dato.legajo);
		mostrar(arb^.HD)
		end;
	end;
var
	arb:arbol;
	max,cant,valorA,valorB,valor:integer;
	
	
begin
	max:=0;
	cant:=0;
	valorA:=0;
	valorB:=0;
	valor:=0;
	cargar(arb);
	writeln(arb^.dato.legajo);
end.
			
			
	{writeln('ingrese un valor');
	readln(valor);
	menor(arb,valor);}03
	1


