/*select datum, count(*)
from szerelo.sz_autofelertekeles*/

--Melyik azok a m�rk�k amikhez 3 n�l kevesebb tipus tartozik
select marka, count(azon)
from szerelo.sz_autotipus
group by marka
having count(azon)<3;

--Melyek azok az aut�k amik els� v�s�rl�si �ra kevesebb mint a k�k aut�k �tlagos els� v�s�rl�si �ra
select rendszam
from szerelo.sz_auto
where elso_vasarlasi_ar < (select avg(elso_vasarlasi_ar)
from szerelo.sz_auto
where szin like 'k�k');

--Azon debreeni tulajok akik az elm�lt 2 �vben piros, k�k, vagy fekete aut�t v�s�roltak
select tu.nev
from szerelo.sz_tulajdonos tu inner join szerelo.sz_auto_tulajdonosa autul
on tu.azon = autul.auto_azon inner join szerelo.sz_auto au
on autul.auto_azon = au.azon
where tu.cim like 'Debrecen%' and months_between(sysdate, au.elso_vasarlas_idopontja) < 24 and au.szin in ('k�k', 'piros', 'fekete');

select azon 
from szerelo.sz_auto
where elso_vasarlas_idopontja - (select add_months(sysdate,-24) from dual) > 2 and szin in ('k�k', 'piros', 'fekete');