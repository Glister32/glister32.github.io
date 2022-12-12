
DROP TABLE IF EXISTS import;
DROP TABLE IF EXISTS bourses;
DROP TABLE IF EXISTS candidat;
DROP table IF EXISTS formation;
drop table IF EXISTS etablissement;
drop table if EXISTS departement1;

CREATE TABLE import(
    n1 text, n2 text , n3 text, n4 text, n5 text, n6 text, n7 text, n8 text, n9 text, n10 text, n11 text,
    n12 text, n13 text, n14 text, n15 text, n16 text, n17 int, n18 int, n19 int, n20 int, n21 text , 
    n22 int, n23 int, n24 int, n25 int, n26 int, n27 int, n28 int, n29 int, n30 int,n31 int,
    n32 int,n33 int,n34 int,n35 int,n36 int ,n37 int, n38 int ,n39 int, n40 int, n41 int,n42 int,
     n43 int, n44 int,n45 int,n46 int,n47 int,n48 int,n49 float,n50 float,n51 float,n52 float,
     n53 int,n54 int,n55 int, n56 int,n57 int,n58 int,n59 int,n60 int,n61 int,n62 int,n63 int,n64 float,
     n65 float,n66 int,n67 int,n68 int,n69 int,n70 int, n71 int,n72 int,n73 float,n74 float,n75 float,
     n76 float,n77 float,n78 float,n79 float,n80 float,n81 float,n82 float,n83 float, n84 float,n85 float,n86 float,
     n87 float,n88 float,n89 float,n90 float,n91 float,n92 float,n93 float,n94 float,n95 float,n96 float,n97 float,
     n98 float,n99 float,n100 float,n101 text,n102 float,n103 text,n104 int,n105 text,n106 int,n107 text,
     n108 float,n109 text,n110 int,n111 text,n112 text,n113 text,n114 float,n115 float,n116 float,n117 text,n118 text);

\copy import from fr-esr-parcoursup.csv csv delimiter ';'

ALTER TABLE import
ALTER COLUMN n49 TYPE int;
ALTER TABLE import
ALTER COLUMN N50 TYPE int;
ALTER TABLE import
ALTER COLUMN N51 TYPE int;
ALTER TABLE import
ALTER COLUMN N64 TYPE int;
ALTER TABLE import
ALTER COLUMN N115 TYPE int;
ALTER TABLE import
ALTER COLUMN N114 TYPE int;
ALTER TABLE import
ALTER COLUMN N99 TYPE int;
ALTER TABLE import
ALTER COLUMN N98 TYPE int;
ALTER TABLE import
ALTER COLUMN N97 TYPE int;
ALTER TABLE import
ALTER COLUMN N96 TYPE int;
ALTER TABLE import
ALTER COLUMN N95 TYPE int;
ALTER TABLE import
ALTER COLUMN N94 TYPE int;
ALTER TABLE import
ALTER COLUMN N93 TYPE int;

CREATE TABLE departement1(
    dno char(3),
    nom text,
    region text,
    constraint pk_departement1 primary key(dno)
);

CREATE TABLE etablissement (
    codeUAI char(8),
    dno char(3),
    nom text,
    constraint pk_etablissement primary key(codeUAI),
    constraint fk_etablissement foreign key(dno) references departement1(dno)
);

create table formation (
    code_form char(5),
    info_form text,
    selective char(24),
    capacite int,
    codeUAI char(8),
    fille_admis int,
    admis_generaux int,
    admis_tech int,
    admis_pro int,
    admis_autres int,
    generaux_proposition int,
    tech_proposition int,
    pro_proposition int,
    autres_proposition int,
    constraint pk_formation primary key(code_form),
    constraint fk_formation1 foreign key(codeUAI) references etablissement(codeUAI)
);

create table candidat (
    code_form char(5),
    candidates int,
    generaux_phase_prin int,
    tech_phase_prin int,
    pro_phase_prin int,
    autres_cand_phase_prin int,
    generaux_phase_comp int,
    tech_phase_comp int,
    pro_phase_comp int,
    autres_cand_phase_comp int,
    constraint fk_candidat foreign key(code_form) references formation(code_form)
);

create table bourses (
    code_form char(5),
    bourse_generaux_phase_prin int,
    bourse_tech_phase_prin int,
    bourse_pro_phase_prin int,
    admis_boursiers int,
    constraint fk_candidat foreign key(code_form) references formation(code_form)
);

insert into departement1(dno, nom, region) select DISTINCT(n5), n6, n7 from import;

insert into etablissement(codeUAI, dno, nom) select DISTINCT(n3), n5, n4 from import;

insert into formation(code_form, info_form, selective, capacite, codeUAI, fille_admis, 
admis_generaux, admis_tech, admis_pro, admis_autres, generaux_proposition, tech_proposition, pro_proposition, autres_proposition) 
select n110, n111, n9, n17, n3, n47, n56, n57, n58, n59, n94, n96, n98, n100 from import;

insert into candidat(code_form,candidates,generaux_phase_prin,tech_phase_prin,pro_phase_prin,autres_cand_phase_prin,generaux_phase_comp,
tech_phase_comp,pro_phase_comp,autres_cand_phase_comp) select n110,n19,n22,n24,n26,n28,n30,n31,n32,n33 from import;

insert into bourses(code_form, bourse_generaux_phase_prin, bourse_tech_phase_prin, bourse_pro_phase_prin, admis_boursiers) select n110, n23, n25, n27, n53 from import;



