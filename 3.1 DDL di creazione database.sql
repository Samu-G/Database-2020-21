begin;


drop table if exists Utenti;
drop table if exists Redattori;
drop table if exists Valutazione;
drop table if exists Preferito;
drop table if exists Contenuto;
drop table if exists Film;
drop table if exists Proiezione;
drop table if exists SerieTV;
drop table if exists Trasmesso;
drop table if exists Stagioni;
drop table if exists Episodi;
drop table if exists Programmi;
drop table if exists Trasmesso;
drop table if exists Piattaforme;
drop table if exists Cinema;
drop table if exists Sala;
drop table if exists Contatti;
drop table if exists Artisti;
drop table if exists PAF;
drop table if exists PAS;
drop table if exists PSF;
drop table if exists PSS;


/*Utenti(Nome utente, Password, Indirizzo e-mail)*/

create table Utenti (
  Nome_utente varchar(30),
  Password varchar(50) not null,
  Indirizzo_email varchar(100) not null,
  primary key(Nome_utente)
);



/*Redattori(Nome utente, Password, Indirizzo e-mail, Data inizio collaborazione)*/

create table Redattori (
  Nome_utente varchar(30),
  Password varchar(50) not null,
  Indirizzo_email varchar(100) not null,
  Data_inizio_collaborazione date not null,
  primary key(Nome_utente)  
);



/*Contenuto(Nome del contenuto, Genere, Anno, Paese, Durata)*/

create table Contenuto (
  Nome_del_contenuto varchar(50),
  Genere varchar(20) not null,
  Anno numeric(4) not null,
  Paese varchar(20) not null,
  Durata numeric(3) not null check (Durata > 0),
  primary key(Nome_del_contenuto)
  foreign key(Nome_del_contenuto) references Film(Contenuto) on delete cascade on update cascade,
  foreign key(Nome_del_contenuto) references SerieTV(Contenuto) on delete cascade on update cascade,
  foreign key(Nome_del_contenuto) references Programmi(Contenuto) on delete cascade on update cascade
);



/*Artisti(Nome e cognome, Foto, EtÃ , Luogo di nascita, Data di nascita)*/

create table Artisti (
  Nome_e_cognome varchar(50) not null,
  Foto bytea,
  EtÃ  numeric(3) not null,
  Luogo_di_nascita varchar(20) not null,
  Data_di_nascita date not null,
  primary key(Nome_e_cognome)
);



/*Valutazione(Utenti, Contenuto, id valutazione, Voto)*/
/*Valutazione(Utenti) referenza Utenti(Nome utente)
Valutazione(Contenuto) referenzia Contenuto(Nome del contenuto)*/

create table Valutazione (
  Utenti varchar(20),
  Contenuto varchar(50),
  id_valutazione SERIAL,
  Voto numeric(1) not null check (Voto >= 0 and Voto <= 5),
  primary key(id_valutazione),
  foreign key(Utenti) references Utenti(Nome_utente) on delete set null,
  foreign key (Contenuto) references Contenuto(Nome_del_contenuto) on delete cascade on update cascade
);



/*Preferito(Utenti, Contenuto)*/
/*Preferiti(Utenti) referenza Utenti(Nome utente)
Preferiti(Contenuto) referenzia Contenuto(Nome del contenuto)*/

create table Preferito (
  Utenti varchar(20),
  Contenuto varchar(50),
  primary key(Utenti, Contenuto),
  foreign key(Utenti) references Utenti(Nome_utente) on delete cascade on update cascade,
  foreign key(Contenuto) references Contenuto(Nome_del_contenuto) on delete cascade on update cascade
);



/*Film(Contenuto, Data di uscita, Distribuzione, Fotografia, Musica, Produzione, Regista)*/
/*Film(Contenuto) referenzia Contenuto(Nome del contenuto)
Film(Regista) referenzia Artisti(Nome e cognome)*/

create table Film (
  Contenuto varchar(50),
  Data_di_uscita date not null,
  Distribuzione varchar(30) not null,
  Fotografia varchar(50) not null,
  Musica varchar(50) not null,
  Produzione varchar(50) not null,
  Regista varchar(50),
  primary key(Contenuto),
  foreign key(Contenuto) references Contenuto(Nome_del_contenuto) on delete cascade on update cascade,
  foreign key(Regista) references Artisti(Nome_e_cognome) on delete set null on update cascade
);



/*Cinema(Nome, Regione, Provincia, Indirizzo)*/

create table Cinema (
  Nome varchar(50),
  Regione varchar(20) not null,
  Provincia char(2) not null,
  Indirizzo varchar(100) not null,
  primary key(Nome)
);



/*Sala(Cinema, Numero della sala, DisponibilitÃ )*/
/*Sala(Cinema) referenzia Cinema(Nome)*/

create table Sala (
  Cinema varchar(50),
  Numero_della_sala numeric(2),
  DisponibilitÃ  varchar(15) not null,
  primary key(Cinema, Numero_della_sala),
  foreign key(Cinema) references Cinema(Nome) on update cascade on delete cascade
);



/*Proiezione(Film, Cinema, Numero della sala, Data, Ora, Prezzo del biglietto)*/
/*Proiezione(Film) referenzia Film(Contenuto)
Proiezione(Numero della sala, Cinema) referenzia Sala(Numero della sala, Cinema)*/

create table Proiezione (
  Film varchar(50),
  Cinema varchar(50),
  Numero_della_sala numeric(2),
  Data date not null,
  Ora time not null,
  Prezzo_del_biglietto decimal(4,2) not null,
  primary key(Film, Cinema, Numero_della_sala, Data, Ora),
  foreign key(Film) references Film(Contenuto) on delete cascade on update cascade,
  foreign key(Numero_della_sala, Cinema) references Sala(Numero_della_sala, Cinema) on delete cascade on update cascade
);



/*Serie_TV(Contenuto, Data di uscita, Distribuzione, Fotografia, Musica, Produzione)*/
/*Serie_TV(Contenuto) referenzia Contenuto(Nome del contenuto)*/

create table SerieTV (
  Contenuto varchar(50),
  Data_di_uscita date not null,
  Distribuzione varchar(30) not null,
  Fotografia varchar(50) not null,
  Musica varchar(50) not null,
  Produzione varchar(50) not null,
  primary key(Contenuto),
  foreign key(Contenuto) references Contenuto(Nome_del_contenuto) on delete cascade on update cascade
);



/*Piattaforme(Nome, Tipo)*/

create table Piattaforme (
  Nome varchar(50),
  Tipo varchar(20) not null,
  primary key(Nome)
);



/*Trasmesso(Serie TV)(Serie TV, Piattaforme)*/
/*Trasmesso(Serie TV)(Serie TV) referenzia Serie TV(Contenuto)
Trasmesso(Serie TV)(Piattaforme) referenzia Piattaforme(Nome)*/

create table Trasmesso_SerieTV (
  SerieTV varchar(50),
  Piattaforme varchar(50),
  primary key(SerieTV, Piattaforme),
  foreign key(SerieTV) references SerieTV(Contenuto) on delete cascade on update cascade,
  foreign key(Piattaforme) references Piattaforme(Nome) on delete cascade on update cascade
);



/*Stagioni(Numero stagione, Serie TV)*/
/*Stagione(Serie TV) referenzia SerieTV(Contenuto)*/

create table Stagioni (
  Numero_stagione numeric(2) check (Numero_stagione > 0),
  SerieTV varchar(50),
  primary key(Numero_stagione, SerieTV),
  foreign key(SerieTV) references SerieTV(Contenuto) on delete cascade on update cascade
);



/*Episodi(Titolo, Numero stagione, Serie TV, Durata, Regista)*/
/*Episodi(Numero stagione, Serie TV) referenzia Stagioni(Numero stagione, Serie TV)
Episodi(Regista)  referenzia Artisti(Nome e cognome)*/

create table Episodi (
  Titolo varchar(50),
  Numero_stagione numeric(2) check(Numero_stagione > 0),
  SerieTV varchar(50),
  Durata numeric(3) not null check(Durata > 0),
  Regista varchar(50),
  primary key(Titolo, Numero_stagione, SerieTV),
  foreign key(Numero_stagione, SerieTV) references Stagioni(Numero_stagione, SerieTV) on delete cascade on update cascade,
  foreign key(Regista) references Artisti(Nome_e_cognome) on delete set null on update cascade
);



/*Programmi(Contenuto, Descrizione Testuale)*/
/*Programmi(Contenuto) referenzia Contenuto(Nome del contenuto)*/

create table Programmi (
  Contenuto varchar(50),
  Descrizione_testuale varchar(1000),
  primary key(Contenuto),
  foreign key(contenuto) references Contenuto(Nome_del_contenuto) on delete cascade on update cascade
);



/*Trasmesso(Programmi)(Programmi, Piattaforme)*/
/*Trasmesso(Programmi)(Programmi) referenzia Programmi(Contenuto)
Trasmesso(Programmi)(Piattaforme) referenzia Piattaforme(Nome)*/

create table Trasmesso_Programmi (
  Programmi varchar(50),
  Piattaforme varchar(50),
  primary key(Programmi, Piattaforme),
  foreign key(Programmi) references Programmi(Contenuto) on update cascade on delete cascade,
  foreign key(Piattaforme) references Piattaforme(Nome) on update cascade on delete cascade
);



/*Contatti(Telefono, Cinema)*/
/*Contatti(Cinema) referenzia Cinema(Nome)*/

create table Contatti (
  Telefono numeric(10),
  Cinema varchar(50),
  primary key(Telefono),
  foreign key(Cinema) references Cinema(Nome) on update cascade on delete cascade
);



/*PAF(Artisti, Film, Personaggio interpretato)*/
/*PAF(Artisti) referenzia Artisti(Nome e cognome)
PAF(Film) referenzia Film(Contenuto)*/

create table PAF (
  Artisti varchar(50),
  Film varchar(50),
  Personaggio_interpretato varchar(50) not null,
  primary key(Artisti, Film),
  foreign key(Artisti) references Artisti(Nome_e_cognome) on update cascade on delete cascade,
  foreign key(Film) references Film(Contenuto) on update cascade on delete cascade
);



/*PAS(Artisti, Serie TV, Personaggio interpretato)*/
/*PAS(Artisti)  referenzia Artisti(Nome e cognome)
PAS(Serie TV) referenzia SerieTV(Contenuto)*/

create table PAS (
  Artisti varchar(50),
  SerieTV varchar(50),
  Personaggio_interpretato varchar(50) not null,
  primary key(Artisti, SerieTV),
  foreign key(Artisti) references Artisti(Nome_e_cognome) on update cascade on delete cascade,
  foreign key(SerieTV) references SerieTV(Contenuto) on update cascade on delete cascade
);



/*PSF(Artisti, Film)*/
/*PSF(Artisti)  referenzia Artisti(Nome e cognome)
PSF(Film) referenzia Film(Contenuto)*/

create table PSF (
  Artisti varchar(50),
  Film varchar(20),
  primary key(Artisti, Film),
  foreign key(Artisti) references Artisti(Nome_e_cognome) on update cascade on delete cascade,
  foreign key(Film) references Film(Contenuto) on update cascade on delete cascade
);



/*PSS(Artisti, Titolo, Numero stagione, Serie TV)*/
/*PSS(Artisti)  referenzia Artisti(Nome e cognome)
PSS(Titolo, Numero stagione, Serie TV) referenzia Episodi(Titolo, Numero stagione, Serie TV)*/

create table PSS (
  Artisti varchar(50),
  Titolo varchar(50),
  Numero_stagione numeric(2),
  SerieTV varchar(50),
  primary key(Artisti, Titolo, Numero_stagione, SerieTV),
  foreign key(Artisti) references Artisti(Nome_e_cognome) on update cascade on delete cascade,
  foreign key(Titolo, Numero_stagione, SerieTV) references Episodi(Titolo, Numero_stagione, SerieTV) on update cascade on
  delete cascade
);


commit;