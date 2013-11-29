Game Store Codelab
==================

Learn how to build a webapp with Dart and Polymer.  
<!--
TODO:
- Add wiki common references for images
- Tests all links
- Publish on gh-pages branches and add a link to the template
-->
# Introduction
The goal of this codelab is to develop a game store application. Users will be able to manage games in the store.  
Don't worry, HTML templates are provided ;)

### Prerequisites
Before you begin this codelab, you should have the last [Dart Editor][1] Setup ready.

### Useful links
- [A Tour of the Dart Language][2]
- [Dart API Reference][3]
- [Polymer.dart][4]
- [Polymer.dart examples][5]

# Templates
The [Template HTML page][6] is composed of three main template blocks

- `GAME_TEMPLATE` displays the content of a game
- `GAMES_TEMPLATE` displays a toolbar and the games list:
  - The toolbar allows to search, filter, sort games and switch between the templates below
  - `GAMES_TEMPLATE_DETAILED` displays the games list reusing the `GAME_TEMPLATE`
  - `GAMES_TEMPLATE_COMPACT` displays the games list with a compact template
- `GAME_EDIT_TEMPLATE` displays a form to edit a game

See the [Live preview][6] and the [HTML source](../../blob/master/template/index.html)

# User stories
This codelab is divided into the following sections:

1. [Show the content of a game](user-story-1.md)
2. [Show the list of all games (detailed template)](user-story-2.md)
3. [Filter and sort the games list](user-story-3.md)
4. [Show the list of all games (compact template)](user-story-4.md)
5. [Edit the content of an existing game](user-story-5.md)
6. [Add a new game](user-story-6.md)
7. [Delete a game](user-story-7.md)
8. [Single-page application](user-story-8.md)

# Feedback
At the end, if you've got a few minutes, would you mind filling out an [anonymous feedback form][feedback] on the course so we can improve it in future?

# Credits

- [+Guillaume Girou](https://plus.google.com/+GuillaumeGirou), Dart Evangelist [@Sfeir](http://www.sfeir.com/)
- [+Nicolas François](https://plus.google.com/+NicolasFrancois), Dart Evangelist [@Sfeir](http://www.sfeir.com/)

_Thanks to [+DartlangFr](http://gplus.to/dartlangfr) team._  
_Thanks to [+Thierry Lau](https://plus.google.com/+ThierryLAU). We took as example his AngularJS project [AngularMovie](https://github.com/lauterry/angularmovie)._

  [1]: https://www.dartlang.org/
  [2]: https://www.dartlang.org/docs/dart-up-and-running/contents/ch02.html
  [3]: http://api.dartlang.org/docs/channels/stable/latest/
  [4]: https://www.dartlang.org/polymer-dart/
  [5]: https://github.com/sethladd/dart-polymer-dart-examples/tree/master/web
  [6]: http://dartlangfr.github.io/game-store-codelab/template/
  [feedback]: https://docs.google.com/forms/d/1gTHgo6LhNhhBMOkwaUEFZuvHQMdtnaklZbW8_4MCAcY/viewform?entry.1890092742=At%C2%A0dotJS+Workshop,+Nov.+28th+2013&entry.1014593415=France&entry.475282761
