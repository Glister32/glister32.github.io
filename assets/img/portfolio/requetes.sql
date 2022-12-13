--1) 
SELECT n55, n56 + n57 + n58 FROM import;
--2)
SELECT COUNT(*) FROM import WHERE n55 = n56+n57+n58;
--3)
SELECT n73, ROUND(CAST(n50 as numeric)/n46*100.0,2) FROM import WHERE n46 <> 0;
--4)
SELECT COUNT(*) 
FROM import 
WHERE CAST(n73 as numeric) = ROUND(CAST(n50 as numeric)/n46*100.0,2) AND n46<>0;
--5)
SELECT n76, (100.0*n47)/n46 FROM import WHERE n46 <> 0; 
--6)
SELECT (100.0*fille_admis)/(admis_generaux+admis_tech+admis_pro+admis_autres) 
FROM formation 
WHERE (admis_generaux+admis_tech+admis_pro+admis_autres) <>0;
--7)
SELECT n81, n55*100.0/n46 FROM import WHERE n46 <> 0;
--8)
SELECT (admis_generaux+admis_tech+admis_pro)*100.0/(admis_generaux+admis_tech+admis_pro+admis_autres) 
FROM formation 
WHERE (admis_generaux+admis_tech+admis_pro+admis_autres) <> 0;
