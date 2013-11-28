## 5. Edit the content of an existing game
> **Goal**: _As a user, I want to edit the content of an existing game_

_**Keywords**: two-way databinding, two-way transformer_

1. Create a new custom element `x-game-edit`
  - Create `game-edit.html` and `game-edit.dart` files and copy the `GAME_EDIT_TEMPLATE` html blocks from the templates into its body  
  - Import and use it in your `index.html`:

    ```HTML
    <x-game-edit gameId="1"></x-game-edit>
    <x-games></x-games>
    ```
2. Retrieve the game to edit
  - In `service.dart`, implement the `getById` method that returns the game for the given id:

    ```Dart
    Game getById(int id) => ???;
    ```
  - In `game-edit.dart`, add a public attribute `gameId` and an observable `game` attribute:

    ```Dart
    @published int gameId = null;
    @observable Game game = new Game.sample();
    ```
  - Retrieve the game to edit when the `gameId` attribute change ([Hints](#hints))
    - if `gameId` is null, set `game` with `new Game.sample()`
    - else set `game` with the retrieved game

<a name="hints"></a>
> **Hints:**
>
> - 

## [Next >](user-story-6.md)
