{ 18) Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente
registra: dni, cód. de paciente, obra social (1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y
costo abonado por sesión. Implemente un programa que:
a) Genere un ABB ordenado por dni. Para ello, genere información hasta el paciente con
dni 0.
A partir del ABB, realice módulos (uno por inciso) para:
b) Generar una estructura con dni y cód de paciente de los pacientes de ioma, ordenados
por dni descendente.
c) Dado un dni, modificar la obra social de dicho paciente a una recibida. Considere que el
paciente puede no existir.
* 
* 
* 
d) Generar una estructura con los códigos de los pacientes de osde cuyo dni está
comprendido entre dos valores.
* 
e) Aumentar el costo abonado por sesión de todos los pacientes en un monto recibido.
NOTA: Realice el programa principal que invoque a los módulos desarrollados

NOTA: Realice el programa principal que invoque a los módulos desarrollados.}

program parcial2;
type
	rango=1..5;
	paciente=record
		dni:integer;
		codigo:integer;
		obra_social:rango;
		costo:real
	end;
	arbol=^nodo;
		nodo=record
			dato:paciente;
			HI:arbol;
			H2:arbol
		end;
	pac=record
		dni2:integer;
		cod:integer;
		obra:rango
		end;
	arb2=^node;
		node=record
		data:pac;
		HI:arb2;
		HD:arb2
	end;
			
	
procedure leerPaciente(var p:paceinte);
begin
	writeln('ingrese ... del paciente');
	p.dni:=random(100);
	writeln('ingrese codigo del paciente');
	p.codigo:=random(100);
	writeln('ingrese numero de obra social del paciente');
	p.obra_social:=random(5);
	writeln('ingrese el abono por consulta  del paciente');
	p.abono:=random(300);
end;

procedure insertar(var a:arbol;p:paciente);
nuevo:arbol;
begin
	if(a=nil)then begin
		new(nuevo);
		nuevo^.dato:=p;
		nuevo ^.HI:=nil;
		nuevo^.Hd:=nil;
		a:=nuevo;
	end;
	else if(a^.dato.dni<=p.dni)then
			insertar(a^.HD,p)
	else 
		insertar(a^.HI,p);
	end;
	
procedure cargar(var a:arbol);
var
	p:paciente;
begin
	leerPaciente(p);
	while(p.dni<>0)do begin
	insertar(a,p);
	leerPaciente(p);
	end;
end;

procedure Insertar2 (var a2:arb2;p:paciente);
var
 nuevo:arb2
begin
	if(a2=nil)then begin
		new(nuevo);
		nuevo^.dato:=p
		nuevo^.HI:=nil;
		nuevo^.HD:=nil;
		a2:=nuevo;
	end;
	else if(p.dni>=a2^.dato.dni)then
		insertar2(a2^.HD,p)
	else 
		insertar2(a2^.HI,p);
	end;
	
procedure Otro_arbol(var a2:arb2;a:arbol);
begin
	Otro_arbol(a2,a^.HI)
	if (a<>nil) and (a^.dato.obra_social=1)then
		insertar2(a2,arb^.dato);
	Otro_arbol(a2,a^.HD);
end;



procedure Buscar(a2:arb2,num:integer,var ok:boolean,o:rango);
begin
	if(a2<>nil) and (ok=false)then begin
		if(a2^.dato.dni=num)then begin
			ok:=true
			a2^.dato.obra_social:=o;
		end
		else if (num>a2^.dato.dni)then
			buscar(a2^.HD,num,ok,o)
		else
			buscar(a2^.HI,num,ok,o);
		end;
end;


















var
a:arbol;
a2:arb2;
num:integer
ok:boolean;
o:rango;
begin
	cargar(a);
	Otro_arbol(a2,a);
	writeln('ingrese el dni de busqueda')
	readln(num);
	ok:=false 
	buscar(a2,num,ok,o);
	writeln(ok);
end.
	
	
