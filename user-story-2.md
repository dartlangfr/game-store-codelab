## 2. Show the list of all games (detailed template)
> **Goal**: _As a user, I want to see the list of all games with a detailed template_

_**Keywords**: template loop, custom attribute, nested component_

1. Create a new custom element `x-games` 
  - Create `games.html` and `games.dart` file and copy the `GAMES_TEMPLATE`  html blocks from the templates into its body  
  _We are going to work with the `GAMES_TEMPLATE_DETAILED` in this user story so comment or remove the `GAMES_TEMPLATE_COMPACT`_
  - Import and use it in your `index.html` instead of `x-game` and check the result
2. One game is not enough for a Game Store, create a service to retrieve games
  - Create a file `services.dart` with the class `InMemoryGameStoreService`:
  
    ```Dart
    library game_store.service;
    import 'models.dart';
  
    final gameStoreService = new InMemoryGameStoreService();
  
    class InMemoryGameStoreService {
      final List<Game> games = [
         new Game(1, "Darts", "Pub game", 'Darts is ...', "darts.jpg", 5),                    
         new Game(2, "Chess", "Board game", 'Chess is ...', "chess.jpg", 4),                    
         new Game(3, "Dices", "Random game", 'Dice are ...', "dice.jpg", 3),                    
         new Game(4, "Go", "Board game", 'Go is ...', "go.jpg", 2),
         new Game(5, "Poker", "Card game", 'Poker is ..', "poker.jpg", 4),
         new Game(6, "Pool", "Pub game", 'Pool is ..', "pool.jpg", 3),
         new Game(7, "Bingo", "Boring game", 'Bingo is ..', "bingo.jpg", 1)
      ];
    }
    ```
  - Add a `games` attributes in `x-games` class and instantiate it with games retrieved from the service:

    ```Dart
    List<Game> games = gameStoreService.games;
    ```    
3. Iterate over the game list
  - Import `x-game` component in your `games.html` file to be able to reused it.
  - Loop over games with a template loop and reuse the `x-game` component like this ([Hints](#user-story-2-hints)):

    ```HTML
    <x-game game="{{game}}"></x-game>
    ```
4. Congrats! You have more games!

    ![x-games list](docs/img/x-games-list.png)
  

<a name="user-story-2-hints"></a>
> **Hints:**
>
> - Try first to display only the names.
> - The `game` attribute in `x-game` should be a public attribute. (See [Custom Attributes](https://www.dartlang.org/polymer-dart/#custom-attributes))

## [Next >](user-story-3.md)
