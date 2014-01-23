BRANCHE:
	- master
	- develop-database - rozwój bazy danych
	- develop-application - rozwój aplikacji app/application, poza app/application/views
	- develop-framework - rozwój struktury silnika app/framework
	- develop-UI - rozwój interfejsu użytkownika, app/application/views, public itp.

TODO I:
  - autentykacja i autoryzacja użytkownika: [===-------]
    - model + uzupełnienie struktury bazy danych [=---------]
    - kontroler + utrzymanie sesji [=====-----]
    - akcje dotyczące autentykacji i autoryzacji [=---------]
  - obsługa _GET ref oraz ret (do 2014-01-31) [=---------]
  - ~~przebudowanie Framework\Registry + zmiana zmiennych deklarowanych na rejestrowane (odłożone)~~ <= rejestracja działa, część ważnych zmiennych z bootstrapa jest już rejestrowana; przemyślę, czy to wszystkie
  - przebudowa Framework\Database [=---------]
  - przebudowa Framework\Exception [=---------]
  - ~~dodanie kolejnego kroku dla _GET url oraz jego obsługa w Framework\Controller~~

TODO II:
  - dodanie szablonów UI
    - dodanie pliku z podstawowym szablonem dla home/index
    - dodanie podstron
      - odział na podstrony