program Matrix(output);

var matrice: array[0..255, 0..255] of Longint;
var dimensiune, determinant: Longint;


procedure calculatorTermen(semn: Longint; listaPermutari: array of Longint);
var termenDeterminant, i: Longint;
begin
    termenDeterminant := 1;

    for i := 0 to dimensiune - 1 do
        termenDeterminant := termenDeterminant * matrice[i, listaPermutari[i]];

    termenDeterminant := termenDeterminant * semn;
    determinant := determinant + termenDeterminant;
end; 


function tablourileSuntEgale(tablou1, tablou2: array of Longint): boolean;
var OK: boolean;
var i: Longint;
begin
    OK := true;
    for i := 0 to dimensiune - 1 do
        if (tablou1[i] <> tablou2[i]) then
            OK := false;
        
    tablourileSuntEgale := OK;
end;


procedure permutare(semn: Longint; listaPermutari: array of Longint; alpha: Longint);
var listaPermutariCopie: array[0..255] of Longint;
var aux, i: Longint;
begin 
    if alpha = dimensiune - 1 then
        begin 
            calculatorTermen(semn, listaPermutari);
        end
    else
        begin

            for i := 0 to dimensiune - 1 do
                listaPermutariCopie[i] := listaPermutari[i];
            
            for i := alpha to dimensiune - 1 do
                begin
                    aux := listaPermutariCopie[alpha];
                    listaPermutariCopie[alpha] := listaPermutariCopie[i];
                    listaPermutariCopie[i] := aux;

                    if not(tablourileSuntEgale(listaPermutari, listaPermutariCopie)) then
                        semn := semn * -1;
                    permutare(semn, listaPermutariCopie, alpha + 1);

                end;
        end;
end; 


//Functia principala
var listaPermutari: array[0..255] of Longint;
var i, j: Longint;

begin
    writeln ('Introduceti numarul de linii / coloane: ');
    readln (dimensiune);

    writeln ('Introduceti matricea: ');
    for i := 0 to dimensiune - 1 do 
            begin
                for j := 0 to dimensiune - 1 do
                    read(matrice[i, j]);
            end;


    determinant := 0;
    for i := 0 to dimensiune - 1 do 
        listaPermutari[i] := i;
    

    permutare(1, listaPermutari, 0);

    writeln('Determinantul este: ', determinant);
end.