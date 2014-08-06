## 6. Add a new game
> **Goal**: _As a user, I want to add a new game_

1. Replace the content of `services.dart` with:
  
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

  - We simply added the `toObservable` call to notify listeners when we add or remove an element.

2. Implement `save` in `services.dart` ([Hints](#hints))

  ```Dart
  save(Game game) {
    // Add to the list when it's a new game
    // Replace the existing one when it already exists
  }
  ```
3. Update `x-game-edit` element
  - Add a `save` event handler which call `gameStoreService.save(game)` method.
  - Bind this handler on the save button click.
4. Update `index.html`, remove the `gameId` attribute and try to save a game

  ```HTML
  <x-game-edit></x-game-edit>
  ```
5. Yeah! So many games to add!  
  ![x-game-edit newgame](docs/img/x-game-edit-newgame.png)
 
 
<a name="hints"></a>
> **Hints:** 
> - You must set the id for a new game. Use [List.map](https://api.dartlang.org/docs/channels/stable/latest/dart_core/List.html#map), [List.fold](https://api.dartlang.org/docs/channels/stable/latest/dart_core/List.html#fold) and [max](https://api.dartlang.org/docs/channels/stable/latest/dart_math.html#max) to find the highest game id.

## [Next >](user-story-7.md)
