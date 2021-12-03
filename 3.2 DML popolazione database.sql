/*POPOLAZIONE DATABASE*/


/*Utenti(Nome utente, Password, Indirizzo e-mail)*/
begin;
insert into Utenti values('pincopallino', 'password', 'pincopallino@gmail.com');
insert into Utenti values('barbagianni', 'qwerty', 'barbagianni@edu.unito.com');
insert into Utenti values('luchino99', '123', 'luchino_x_99@libero.com');
commit;

/*Redattori(Nome utente, Password, Indirizzo e-mail, Data inizio collaborazione)*/
begin;
insert into Redattori values('Redattore1', 'primo', 'redazione_1@gmail.com', DATE '2015-12-17');
insert into Redattori values('Redattore2', 'secondo', 'redazione_2@gmail.com', DATE '2016-06-05');
insert into Redattori values('Redattore3', 'terzo', 'redazione_3@gmail.com', DATE '2017-10-28');
commit;

/*Contenuto(Nome del contenuto, Genere, Anno, Paese, Durata)*/
begin;
insert into Contenuto values('Titanic', 'Drammatico', 1980, 'Inghilterra', 195);
insert into Contenuto values('Lost', 'Avventura', 2004, 'Inghilterra', 45);
insert into Contenuto values('SerieTv1', 'Avventura', 2015, 'Francia', 30);
insert into Contenuto values('L’eredità', 'Intrattenimento', 2010 , 'Italia', 33);
commit;

/*Artisti(Nome e cognome, Foto, Età, Luogo di nascita, Data di nascita)*/
begin;
insert into Artisti(Nome_e_cognome, Età, Luogo_di_nascita, Data_di_nascita) values('Leonardo DiCaprio', 45, 'Los Angeles', DATE '1974-11-11');
insert into Artisti(Nome_e_cognome, Età, Luogo_di_nascita, Data_di_nascita) values('Naveen Andrews', 51, 'Londra', DATE '1969-01-17');
insert into Artisti(Nome_e_cognome, Età, Luogo_di_nascita, Data_di_nascita) values('Enrico Papi', 54, 'Roma', DATE '1965-06-03');
insert into Artisti(Nome_e_cognome, Età, Luogo_di_nascita, Data_di_nascita) values('Artista1', 15, 'Torino', DATE '2000-07-11');
insert into Artisti(Nome_e_cognome, Età, Luogo_di_nascita, Data_di_nascita) values('Artista2', 24, 'New York', DATE '1996-07-22');
insert into Artisti(Nome_e_cognome, Età, Luogo_di_nascita, Data_di_nascita) values('Artista3', 33, 'Roma', DATE '1988-08-23');
insert into Artisti(Nome_e_cognome, Età, Luogo_di_nascita, Data_di_nascita) values('Artista4', 42, 'Milano', DATE '1978-09-07');
insert into Artisti(Nome_e_cognome, Età, Luogo_di_nascita, Data_di_nascita) values('Artista5', 51, 'Roma', DATE '1969-10-22');
commit;

/*Valutazione(Utenti, Contenuto, id valutazione, Voto)*/
begin;
insert into Valutazione(Utenti, Contenuto, Voto) values('pincopallino', 'Titanic', 5);
insert into Valutazione(Utenti, Contenuto, Voto) values('pincopallino', 'Lost', 3);
insert into Valutazione(Utenti, Contenuto, Voto) values('pincopallino', 'L’eredità', 2);
insert into Valutazione(Utenti, Contenuto, Voto) values('barbagianni', 'Titanic', 1);
insert into Valutazione(Utenti, Contenuto, Voto) values('barbagianni', 'Lost', 2);
insert into Valutazione(Utenti, Contenuto, Voto) values('barbagianni', 'L’eredità', 4);
insert into Valutazione(Utenti, Contenuto, Voto) values('luchino99', 'Titanic', 3);
insert into Valutazione(Utenti, Contenuto, Voto) values('luchino99', 'Lost', 2);
insert into Valutazione(Utenti, Contenuto, Voto) values('luchino99', 'L’eredità', 1);
commit;

/*Preferito(Utenti, Contenuto)*/
begin;
insert into Preferito values('pincopallino', 'Titanic');
insert into Preferito values('barbagianni', 'Lost');
insert into Preferito values('luchino99', 'L’eredità');
commit;

/*Film(Contenuto, Data di uscita, Distribuzione, Fotografia, Musica, Produzione, Artisti)*/
begin;
insert into Film values('Titanic', DATE '1998-01-16', '20th Century Fox', 'James Horner', 'Paramount Pictures', 'James Cameron', 'Naveen Andrews');
commit;

/*Cinema(Nome, Regione, Provincia, Indirizzo)*/
begin;
insert into Cinema values('Cinema1', 'Piemonte', 'TO', 'Corso Vittorio Emanuele, 55'); 
insert into Cinema values('Cinema2', 'Piemonte', 'CN', 'Via Torino, 55'); 
commit;

/*Sala(Cinema, Numero della sala, Disponibilità)*/
begin;
insert into Sala values('Cinema1', 1, 'Disponibile');
insert into Sala values('Cinema1', 2, 'Non disponibile');
insert into Sala values('Cinema1', 3, 'Non disponibile');
insert into Sala values('Cinema1', 4, 'Non disponibile');
insert into Sala values('Cinema2', 1, 'Disponibile');
insert into Sala values('Cinema2', 2, 'Non disponibile');
insert into Sala values('Cinema2', 3, 'Non disponibile');
insert into Sala values('Cinema2', 4, 'Non disponibile');
commit;

/*Proiezione(Film, Cinema, Numero della sala, Data, Ora, Prezzo del biglietto)*/
begin;
insert into Proiezione values('Titanic', 'Cinema1', 1, DATE '2020-06-03', TIME '19:00', 10.50);
insert into Proiezione values('Titanic', 'Cinema2', 2, DATE '2020-10-15', TIME '23:00', 9.00);
commit;

/*SerieTV(Contenuto, Data di uscita, Distribuzione, Fotografia, Musica, Produzione)*/
begin;
insert into SerieTV values('Lost', DATE '2004-09-22', 'Fox', 'Damon Lindelof', 'Damon Lindelof', 'Carlton Cuse');
insert into SerieTV values('SerieTv1', DATE '2015-10-05', 'Distr', 'Damon Lindelof', 'Damon Lindelof', 'Carlton Cuse');
commit;

/*Piattaforme(Nome, Tipo)*/
begin;
insert into Piattaforme values('TantiFilm', 'sito streaming');
insert into Piattaforme values('CinemaGratis', 'sito streaming');
insert into Piattaforme values('CinemaHD', 'sito streaming');
insert into Piattaforme values('FilmStreamingIta', 'sito streaming');
insert into Piattaforme values('AltaDefinizione', 'sito streaming');
insert into Piattaforme values('Rai1', 'canale TV');
insert into Piattaforme values('Rai2', 'canale TV');
insert into Piattaforme values('Rai3', 'canale TV');
insert into Piattaforme values('Rete4', 'canale TV');
insert into Piattaforme values('Canale5', 'canale TV');
insert into Piattaforme values('ItaliaUno', 'canale TV');
commit;

/*Trasmesso(Serie TV)(Serie TV, Piattaforme)*/
begin;
insert into Trasmesso_SerieTV values('Lost', 'Rai1');
insert into Trasmesso_SerieTV values('Lost', 'TantiFilm');
insert into Trasmesso_SerieTV values('Lost', 'ItaliaUno');
commit;

/*Stagioni(Numero stagione, Serie TV)*/
begin;
insert into Stagioni values(1, 'Lost');
insert into Stagioni values(2, 'Lost');
insert into Stagioni values(1, 'SerieTv1');
insert into Stagioni values(2, 'SerieTv1');
commit;

/*Episodi(Titolo, Numero stagione, Serie TV, Durata, Regista)*/
begin;
insert into Episodi values('Episodio1', 1, 'Lost', 30, 'Naveen Andrews');
insert into Episodi values('Episodio2', 1, 'Lost', 44, 'Naveen Andrews');
insert into Episodi values('Episodio3', 2, 'Lost', 25, 'Enrico Papi');
insert into Episodi values('Episodio4', 2, 'Lost', 48, 'Naveen Andrews');
insert into Episodi values('Episodio1', 1, 'SerieTv1', 20, 'Naveen Andrews');
insert into Episodi values('Episodio2', 1, 'SerieTv1', 54, 'Naveen Andrews');
insert into Episodi values('Episodio3', 2, 'SerieTv1', 75, 'Enrico Papi');
insert into Episodi values('Episodio4', 2, 'SerieTv1', 68, 'Leonardo DiCaprio');
commit;

/*Programmi(Contenuto, Descrizione Testuale)*/
begin;
insert into Programmi values('L’eredità', 'Sei concorrenti si sfidano in questo classico gioco a premi ad eliminazione che prevede sette diverse sfide.');
commit;

/*Trasmesso(Programmi)(Programmi, Piattaforme)*/
begin;
insert into Trasmesso_Programmi values('L’eredità', 'Rai1');
insert into Trasmesso_Programmi values('L’eredità', 'TantiFilm');
insert into Trasmesso_Programmi values('L’eredità', 'ItaliaUno');
commit;

/*Contatti(Telefono, Cinema)*/
begin;
insert into Contatti values('1234567890', 'Cinema1');
insert into Contatti values('0987654321', 'Cinema1');
insert into Contatti values('1203120122', 'Cinema2');
insert into Contatti values('1345545322', 'Cinema2');
commit;

/*PAF(Artisti, Film, Personaggio interpretato)*/
begin;
insert into PAF values('Leonardo DiCaprio', 'Titanic', 'Personaggio interpretato 1');
insert into PAF values('Artista2', 'Titanic', 'Personaggio interpretato 2');
insert into PAF values('Artista3', 'Titanic', 'Personaggio interpretato 3');
insert into PAF values('Artista4', 'Titanic', 'Personaggio interpretato 4');
commit;

/*PAS(Artisti, Serie TV, Personaggio interpretato)*/
begin;
insert into PAS values('Leonardo DiCaprio', 'Lost', 'Personaggio interpretato 1');
insert into PAS values('Artista1', 'Lost', 'Personaggio interpretato 2');
insert into PAS values('Artista2', 'SerieTv1', 'Personaggio interpretato 1');
insert into PAS values('Artista3', 'SerieTv1', 'Personaggio interpretato 2');
commit;

/*PSF(Artisti, Film)*/
begin;
insert into PSF values('Leonardo DiCaprio', 'Titanic');
insert into PSF values('Artista2', 'Titanic');
insert into PSF values('Artista3', 'Titanic');
insert into PSF values('Artista4', 'Titanic');
commit;

/*PSS(Artisti, Titolo, Numero stagione, Serie TV)*/
begin;
insert into PSS values('Artista1', 'Episodio1', 1, 'Lost');
insert into PSS values('Artista2', 'Episodio1', 1, 'Lost');
insert into PSS values('Artista3', 'Episodio1', 1, 'Lost');
insert into PSS values('Artista4', 'Episodio1', 1, 'Lost');
insert into PSS values('Artista1', 'Episodio2', 1, 'Lost');
insert into PSS values('Artista2', 'Episodio2', 1, 'Lost');
insert into PSS values('Artista3', 'Episodio2', 1, 'Lost');
insert into PSS values('Artista4', 'Episodio2', 1, 'Lost');
insert into PSS values('Artista1', 'Episodio3', 2, 'Lost');
insert into PSS values('Artista2', 'Episodio3', 2, 'Lost');
insert into PSS values('Artista3', 'Episodio3', 2, 'Lost');
insert into PSS values('Artista4', 'Episodio3', 2, 'Lost');
insert into PSS values('Artista1', 'Episodio4', 2, 'Lost');
insert into PSS values('Artista2', 'Episodio4', 2, 'Lost');
insert into PSS values('Artista3', 'Episodio4', 2, 'Lost');
insert into PSS values('Artista4', 'Episodio4', 2, 'Lost');
insert into PSS values('Artista1', 'Episodio1', 1, 'SerieTv1');
insert into PSS values('Artista2', 'Episodio1', 1, 'SerieTv1');
insert into PSS values('Artista3', 'Episodio1', 1, 'SerieTv1');
insert into PSS values('Artista4', 'Episodio1', 1, 'SerieTv1');
insert into PSS values('Artista1', 'Episodio2', 1, 'SerieTv1');
insert into PSS values('Artista2', 'Episodio2', 1, 'SerieTv1');
insert into PSS values('Artista3', 'Episodio2', 1, 'SerieTv1');
insert into PSS values('Artista4', 'Episodio2', 1, 'SerieTv1');
insert into PSS values('Artista1', 'Episodio3', 2, 'SerieTv1');
insert into PSS values('Artista2', 'Episodio3', 2, 'SerieTv1');
insert into PSS values('Artista3', 'Episodio3', 2, 'SerieTv1');
insert into PSS values('Artista4', 'Episodio3', 2, 'SerieTv1');
insert into PSS values('Artista1', 'Episodio4', 2, 'SerieTv1');
insert into PSS values('Artista2', 'Episodio4', 2, 'SerieTv1');
insert into PSS values('Artista3', 'Episodio4', 2, 'SerieTv1');
insert into PSS values('Artista4', 'Episodio4', 2, 'SerieTv1');
commit;