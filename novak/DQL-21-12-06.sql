-- vyberie všetky hodnoty z tabuľky "filmy", ktoré obsahujú hodnotu pre cudzí kľúč "ZanerID" = 3 
SELECT * FROM filmy WHERE ZanerID = 3
-- vyberie hodnoty ako "Rok" a "Nazov" z tabuľky "filmy", pre ktoré platí, že hodnota cudzieho kľúča "ReziserID" = 1
SELECT Nazov, Rok FROM filmy WHERE ReziserID = 1  
-- vyberie meno a priezvisko + vek z tabuľky "reziser", pričom režisér má id = 1
SELECT Meno, Priezvisko, Vek FROM reziser WHERE Reziserid = 1 
-- vyberie názov žánru z tabuľky "zaner", kde id žánra je 1
SELECT ZanerNazov FROM zaner WHERE Zanerid = 1
-- vyberie názov, Rok, ReziserID z tabuľky "filmy", pričom cudzí kľúč "ReziserID" = 10
SELECT Nazov, Rok, ReziserID FROM filmy WHERE ReziserID = 10



-- vyberie z tabuľky "filmy" "Filmid" a tabuľky "reziser" "Reziserid" prepojí tabuľky reziser pomocou kľúčov nižšie:
SELECT filmy.Filmid, reziser.Reziserid
FROM filmy
INNER JOIN reziser ON filmy.ReziserID=reziser.Reziserid
-- vyberie z tabuľky "filmy" "Nazov" a tabuľky "reziser" "Reziserid" prepojí tabuľky reziser pomocou kľúčov nižšie:
SELECT filmy.Nazov, reziser.Reziserid
FROM filmy
INNER JOIN reziser ON filmy.ReziserID=reziser.Reziserid
-- vyberie z tabuľky "filmy" "ZanerID" a tabuľky "filmy" "Filmid" prepojí tabuľky reziser pomocou kľúčov nižšie:
SELECT filmy.ZanerID, filmy.Filmid
FROM filmy
INNER JOIN zaner ON filmy.ZanerID=zaner.Zanerid
-- vyberie z tabuľky "filmy" "ZanerID" a tabuľky "reziser" "ReziserID" + tabuľky "filmy" "Nazov" a prepojí tabuľky reziser pomocou kľúčov nižšie:
SELECT filmy.ZanerID, reziser.ReziserID, filmy.Nazov
FROM filmy
INNER JOIN reziser ON filmy.ReziserID=reziser.Reziserid
-- vyberie z tabuľky "filmy" "ZanerID" a tabuľky "reziser" "Reziserid" "Meno" "Priezvisko" + tabuľky "filmy" "Nazov" a prepojí tabuľky reziser pomocou kľúčov nižšie:
SELECT filmy.ZanerID, reziser.Reziserid, reziser.Meno, reziser.Priezvisko, filmy.Nazov
FROM filmy
INNER JOIN reziser ON filmy.ReziserID=reziser.Reziserid
INNER JOIN zaner ON filmy.ZanerID=zaner.Zanerid
-- vyberie z tabuľky "filmy" "ReziserID" a tabuľky "reziser" "Meno" "FilmID" (pričom je hodnota FilmID ako cudzí kľúč reprezentujúca len jeden z filmov) + tabuľky "reziser" "Priezvisko" a prepojí tabuľky reziser pomocou kľúčov nižšie:
SELECT reziser.Meno, filmy.ReziserID, reziser.Priezvisko, reziser.FilmID
FROM filmy 
INNER JOIN reziser ON reziser.FilmID=filmy.Filmid
