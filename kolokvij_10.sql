drop database if exists kolokvij_vjezba_10;
create database kolokvij_vjezba_10;
use kolokvij_vjezba_10;

create table zarucnica(
	sifra int not null primary key auto_increment,
	treciputa datetime,
	prviputa datetime,
	suknja varchar(32) not null,
	eura decimal(16,10)
);

create table sestra(
	sifra int not null primary key auto_increment,
	suknja varchar(46) not null,
	bojaociju varchar(49),
	indiferentno bit,
	dukserica varchar(32) not null,
	drugiputa datetime,
	prviputa datetime not null,
	zarucnica int
);

create table mladic(
	sifra int not null primary key auto_increment,
	hlace varchar(48) not null,
	lipa decimal(18,6),
	stilfrizura varchar(35) not null,
	prstena int,
	maraka decimal(12,6) not null,
	svekrva int
);

create table zena(
	sifra int not null primary key auto_increment,
	bojaociju varchar(49) not null,
	maraka decimal(13,9) not null,
	majica varchar(45),
	indiferentno bit,
	prvputa datetime,
	mladic int
);

create table svekrva(
	sifra int not null primary key auto_increment,
	eura decimal(17,9),
	carape varchar(49),
	kuna decimal(13,9),
	majica varchar(30),
	introvertno bit not null,
	punac int
);

create table punac(
	sifra int not null primary key auto_increment,
	lipa decimal(15,9),
	eura decimal(15,10) not null,
	stilfrizura varchar(37)
);

create table neprijatelj(
	sifra int not null primary key auto_increment,
	gustoca decimal(15,10) not null,
	dukserica varchar(32) not null,
	maraka decimal(15,7),
	stilfrizura varchar(49) not null
);

create table punac_neprijatelj(
	sifra int not null primary key auto_increment,
	punac int not null,
	neprijatelj int not null
);

alter table sestra add foreign key (zarucnica) references zarucnica(sifra);

alter table zena add foreign key (mladic) references mladic(sifra);

alter table mladic add foreign key (svekrva) references svekrva(sifra);

alter table svekrva add foreign key (punac) references punac(sifra);

alter table punac_neprijatelj add foreign key (punac) references punac(sifra);
alter table punac_neprijatelj add foreign key (neprijatelj) references neprijatelj(sifra);

#U tablice mladic, svekrva i punac_neprijatelj unesite po 3 retka.
insert into punac(eura)
values(20.00),(21.76),(31.75);

insert into neprijatelj(gustoca,dukserica,stilfrizura)
values(11.22,'adidas','gel'),(22.54,'nike','ćelav'),(55.33,'s kapuljačom','rokeza');

insert into punac_neprijatelj(punac,neprijatelj)
values(1,1),(2,2),(3,3);

insert into svekrva(introvertno)
values(0),(1),(0);

insert into mladic(hlace,stilfrizura,maraka)
values('svečane','kratko ošišan',54.76),
('sportske hlače','duga kosa',76.87),
('iz zare','ćelav',75.12);

#U tablici sestra postavite svim zapisima kolonu bojaociju na vrijednost Osijek.
update sestra set bojaociju = 'Osijek';

#U tablici zena obrišite sve zapise čija je vrijednost kolone maraka različito od 14,81.
delete from zena where maraka != '14,81';

#Izlistajte kuna iz tablice svekrva uz uvjet da vrijednost kolone carape sadrže slova ana.
select kuna 
from svekrva where carape like '%ana%';











