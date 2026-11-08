# Upravljanje postova

Ova aplikacija izrađena pomoću Fluttera koristi javni poslužitelj s poveznice https://jsonplaceholder.typicode.com/posts kako bi se postovi mogli pregledati, prikvačiti ili izbrisati, ovisno o volji korisnika. Ukupno je 100 postova, 10 po korisniku.

## Animacije i geste

post_widget.dart:
1. trailing: AnimatedScale();
2. final VoidCallback onTap;
3. final VoidCallback onLongPress;
4. final VoidCallback onDismissed;

ekran_detalja.dart:
late final AnimationController _pulse;

ekran_popisa.dart:
Navigator.push(context, PageRouteBuilder());

## Kako pokrenuti

Za pokretanje aplikacije potrebno je otvoriti projekt u Visual studio code-u, u lijevom izborniku odabrati "run and debug" te kliknuti na glavni "run and debug" gumb koji se pokaže.
