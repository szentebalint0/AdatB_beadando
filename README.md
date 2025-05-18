# AdatB_beadando
Beadandó feladat az Adatbázisok tantárgyhoz, választott feladat: 1. 

Csoporttagok: Szente Bálint, Borsos Benedek, Palatin Simon

Az adatbázist SQLite-ban terveztük meg, és az adatok forrása a Kaggle volt. Összesen 6 darab CSV-fájlból importáltuk a Premier League bajnokság kiválasztott mérkőzéseinek adatait. Az eredeti adatok méretét csökkentettük, illetve generatív mesterséges intelligencia segítségével életszerű statisztikákkal egészítettük ki az elemzések megkönnyítése érdekében.

Az adatbázis `beadando.db` néven található a repository gyökerében.

A 6 tábla, valamint az adatmodellek (logikai és fizikai) az **"Adatok"** mappában találhatók.

## Táblák:

- **`matches`** – Tartalmazza a mérkőzések alapadatait, `match_id` kulccsal. Főként összekötő táblaként szolgál a többi táblával való gyors kapcsolathoz.
- **`stats`** – A mérkőzésekhez tartozó sárga/piros lapok és büntetők száma. A `matches` tábla idegen kulcsa kapcsolódik ide.
- **`teams`** – Csapatneveket tartalmazó tábla. A `matches` tábla `home_team_id` és `away_team_id` mezői innen hivatkoznak.
- **`seasons`** – Az idények listája. A `matches` tábla `season_id` mezője kapcsolódik ide. (Az adatrövidítés miatt nem minden szezon tartalmaz meccset.)
- **`goals`** – Meccsenként a hazai és vendég gólok száma. A `matches` tábla idegen kulcsa kapcsolódik ide. Emellett tartalmaz egy `result_id` mezőt, amely a `results` táblára mutat.
- **`results`** – Az egyes eredménykategóriák (hazai győzelem, döntetlen, vendég győzelem). A `goals` tábla `result_id` mezője kapcsolódik ide.

---

A lekérdezések értelemszerűen vannak elnevezve, minden `.sql` fájl első sora kommentként tartalmazza a lekérdezés célját.

- A lekérdezések külön **"Lekérdezések"** mappában találhatók.
- A táblák létrehozásáért felelős `CREATE TABLE` parancsokat tartalmazó fájlok a **"Táblák létrehozása"** mappában vannak, a megfelelő `CONSTRAINT` beállításokkal.

