Banu Ionut-Sebastian 
331AA

-----------baggage_drop-------------

	In modulul de top, nu am intalnit nici o problema, am reusit sa unesc toate modulele intre ele si sa aplic formula din cerinta pentru aflarea 't_act' destul de lejer.


-----------sensors_input-------------

	In acest modul am calculat inaltimea conform cerintei pentru fiecare caz precizat, singura parte mai "tricky" a fost aproximarea la numarul mai mare a valorilor cu 0.5, 0.25, 0.75 care in mod normal se rotunjesc la numarul mai mic conform algoritmului Verilog (ex: 3.5->3; 3.25->3; 3.75->3). 
	Pentru rezolvarea acestei probleme m-am gandit sa adaug +1 in cazul sumelor din cadrul calcularii mediilor a doar 2 sensori, doar daca suma era impara (am verificat uitandu-ma la ultimul bit) . Astfel, in mod normal media: 3+4 = 7 / 2 = 3.5 se rotunjeste la 3, dar noi avem nevoie de 4. Asadar, adaugand 1, obtinem: 3+4+1 = 7+1 = 8/2 = 4, iar problema este rezolvata.
	Pentru calculul mediilor a tuturor celor 4 senzori a trebuit sa acopar si problema cazurilor de 0.25 si 0.75, iar acest lucru se face foarte usor, in loc de +1 la suma adaugam +2. Pentru sumele 11, 12, 13, 14 obtinem: 11/4 = 2.75, nu este bun, dar (11+2)/4 = 3.25, de unde reiese 3, valoarea care e buna . Similar pentru (12+2)/4 = 3.5->3 obtinem numarul corect conform algortimului de aproximare, pentru (13+2)/4 = 3.75 care ramane la 3, iar 14/4 = 3.5 nu e bun,  deci (14+2)/4 = 4, e valoarea ceruta.


----------square_root---------------
	
	Acest modul a fost cel mai dificil din punct de vedere al aplicarii pentru problema noastra deoarece metoda cea mai usoara a fost cu siguranta cea CORDIC, datorita codului ajutator din Resurse care a necesitat cateva schimbari pentru problema noastra.
	Codul se foloseste de puterile lui 2 pentru a calcula radicalul unui numar.  
	In cazul meu, am notat radicalul cu 'y'. Acesta este pe 16 biti, primii 8 constituie partea intreaga, iar ultimii 8 partea zecimala.
	Baza notata cu 'b' de la care pleaca calculul am decis sa o setez la 2^12 = 4096, numarul de iteratii notat cu 'i' l-am pus la 14, iar pentru a schimba nr de biti ai intrarii 'in' l-am inmultit cu 2^16 = 65536 (am shiftat la stanga cu 16 biti)  si am salvat rezultatul in variabila noua 'in_reg' de 32 biti.
	In bucla for, timp de 14 iteratii am adaugat baza la radical , iar in cazul in care patratul bazei depasea valoarea intrarii scadeam baza la loc. Daca patratul bazei nu depasea intrarea, numarul era salvat in y, iar la finalul celor 14 iteratii obtineam radicalul necesar. Dupa structura 'if' shiftam de fiecare data baza la dreapta cu 1 bit.
	

---------display_and_drop-------------

	Modulul de display a fost, de asemenea, lejer, am aprins led-urile celor 4 display-uri conform celor 3 cazuri din exemplul din Anexa folosindu-ma doar de constructii 'if'. Nu am intampinat nici o problema la acest modul.


