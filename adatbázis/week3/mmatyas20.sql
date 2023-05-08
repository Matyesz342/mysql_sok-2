/*select datum, count(*)
from szerelo.sz_autofelertekeles*/

--Melyik azok a márkák amikhez 3 nál kevesebb tipus tartozik
select marka, count(azon)
from szerelo.sz_autotipus
group by marka
having count(azon)<3;

--Melyek azok az autók amik elsõ vásárlási ára kevesebb mint a kék autók átlagos elsõ vásárlási ára
select rendszam
from szerelo.sz_auto
where elso_vasarlasi_ar < (select avg(elso_vasarlasi_ar)
from szerelo.sz_auto
where szin like 'kék');

--Azon debreeni tulajok akik az elmúlt 2 évben piros, kék, vagy fekete autót vásároltak
select tu.nev
from szerelo.sz_tulajdonos tu inner join szerelo.sz_auto_tulajdonosa autul
on tu.azon = autul.auto_azon inner join szerelo.sz_auto au
on autul.auto_azon = au.azon
where tu.cim like 'Debrecen%' and months_between(sysdate, au.elso_vasarlas_idopontja) < 24 and au.szin in ('kék', 'piros', 'fekete');

select azon 
from szerelo.sz_auto
where elso_vasarlas_idopontja - (select add_months(sysdate,-24) from dual) > 2 and szin in ('kék', 'piros', 'fekete');