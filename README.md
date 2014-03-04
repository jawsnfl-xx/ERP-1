Proszę uważnie, świadomie i rozsądnie podchodzić do uzupełnienia treści w Git.

Zarządzanie branchami:

1. Branch powstaje dla rozwiązania problemy, dodania elementu aplikacji lub plików.
2. Branch jest scalany gdy element osiąga swoją funkcjonalność.
3. Podstawowa linia kodu to linia master.
4. Robocza linia kodu to linia develop.
5. Do linii develop trafiają najpierw wszystkie request pulle.
6. Z linni develop trafią do mastera zgodnie z wersjonowaniem programu (0.1, 0.2 itd).

TODO I:
  - autentykacja i autoryzacja użytkownika: [========--]
    - model + uzupełnienie struktury bazy danych [====------]
    - ~~kontroler + utrzymanie sesji~~ [==========]
    - akcje dotyczące autentykacji i autoryzacji [=======---]
  - obsługa _GET ref oraz ret [==--------] ??
  - ~~przebudowanie Framework\Registry + zmiana zmiennych deklarowanych na rejestrowane (odłożone)~~ <= rejestracja działa, część ważnych zmiennych z bootstrapa jest już rejestrowana; przemyślę, czy to wszystkie
  - przebudowa Framework\Database [==--------]
  - przebudowa Framework\Exception [=---------]
  - ~~dodanie kolejnego kroku dla _GET url oraz jego obsługa w Framework\Controller~~
  - arkusz pomiaru - moduł:
    - generowanie czystego arkusza
    - generowanie uzupełnionego arkusza
    - dodawanie linii już uzupełnionych
    - możliwość zapisu rozpoczątego arkusza
    - możliwość powrotu do rozpoczętego arkusza

TODO II:
  - dodanie szablonów UI
    - dodanie pliku z podstawowym szablonem dla home/index
    - dodanie podstron
      - odział na podstrony

TODO III:
1. Tu proszę nie ingerować, a jeśli już to po wcześniejszym znalezieniu sensownego powodu.
  - Zrobienie (ogółem, bo świeci pustką teraz) product_technology
  - Zrobienie (do końca) product_technology/technology &product_technology/product
  - Eestetyka jest ważna. Tak samo jak funkcjonalność.
2. A tutaj wszelkie pomysły i dobre nowiny jak najbardziej się przydadzą.
  - szlify i dopracowywanie elementów wcześniej wykonanych. 
  - dodatki typowo techniczne (typu: da się szybciej, bardziej uniwersalnie)
  - czas, czas... i więcej trafnych pomysłów. oby przychodziły one szybciej. :)
  
TODO IV:
4.1- Settings

	4.1.1. Przenieść (byle nie usuwać) do jakiegokolwiek schowka wszystkie zbędne panele w settings.
		-Schowki niech będą prywatne. Totalnie offline. Potem tylko ctrl+c/ctrl+v jeśli coś będzie wypadało reaktywować.	
	4.1.2. Zapewnić settings podstawową funkcjonalność Settings:
		-Uprawnienia użytkoników.
		-Ustawienia systemowe. Podstawowe.
	
4.2- Quality Management

	4.2.1. Ogólny przegląd arkuszy kontroli jakości.
		-Możliwość downloadu lub wydrukowania arkusza / kilku (według zaznaczenia).
		-Przejście z widoku ogólnego do podglądu.
	4.2.2. Szczegółowy przegląd arkuszy kontroli jakości.
		-Przejście z poziomu widoku arkusza do ogólnego.
		-Druk i download tu musi być.
		-Przełączanie do poprzedniego lub następnego arkusza, coby nie usztywnić widoku :)
	4.2.3. Jakieś sugestie?
4.3- Product
	4.3.1. 
4.4- Technology
	4.4.1. 
	
	
