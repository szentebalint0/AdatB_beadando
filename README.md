# AdatB_beadando
Beadandó feladat Adatbázisok tantárgyhoz
Csoporttagok: Szente Bálint, Borsos Benedek, Palatin Simon

Az adatbázist SQLite-ban terveztük meg, melyhez az adatokat a Kaggle-ről szereztük. Összesen 6 darab csv fájlból importáltuk a Premier League bajnokság bizonyos meccseinek adatait: A kisebb méret elérése képpen az eredeti adatokat csökkentettük, továbbá Generative AI-al néhány életszerű statisztikát adtunk az adatokhoz, a könnyebb lekérdezhetőség/elemezhetőség miatt. 

Az adatbázis 'beadando.db' fájlként külön található a repositoryban.

A 6 tábla az adatmodellekkel (fizikai, logikai) együtt az "Adatok" mappában foglalnak helyet. 

Táblák:
matches tábla -> tartalmazza a meccsek adatait egy generált primary key-el. Főként összekötő táblaként szolgál, a gyorsabb lekérdezésekért.

stats tábla -> primary key-ére mutat a matches tábla egyik foreign key-e, itt adatok találhatóak a sárga/piros lapokról és a büntetőkről meccsenként.

teams tábla -> primary key-ére mutat a matches tábla egyik foreign key-e, itt találhatóak a csapatnevek.

season tábla -> primary key-ére mutat a matches tábla egyik foreign key-e, itt vannak az adott vizsgált szezonok (az adatrövidétés miatt nem szerepel az összes szezonból mérkőzés a matches táblában)

goals tábla -> primary key-ére mutat a matches tábla egyik foreign key-e, itt meccsenként szerepelnek a haza is vendég gólok, továbbá egy foreign key mutat a results tábla PK-ére.

results tábla -> primary key-ére mutat a goals tábla foreign key-e, itt bizonyos kimenetelek találhatóak a mérkőzésekhez hazai-vendég és döntetlen. 

A lekérdezések értelemszerűen vannak elnevezve, az sql kiterjesztésű fájlok első sorában kommentelve vannak a funkciók. A lekérdezések külön mappában helyezkednek el: "Lekérdezések" mappa

A tábla létrehozásáért felelős CRUD lekérdezések a megfelelő contrainekkel külön mappában vannak elhelyezve: "Táblák létrehozása" mappa