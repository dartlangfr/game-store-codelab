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
The goal of this codelab is to develop a game store application from a html template. Users will be able to manage the games in the store.

## Prerequisites
Before you begin this codelab, you should have the last [Dart Editor][1] Setup ready.

## Templates
**TODO**

## User stories
This codelab is divided into the following sections:

1. [Show the content of a game](user-story-1.md)
2. [Show the list of all games (detailed template)](#user-story-2)
3. [Filter and sort the games list](#user-story-3)
4. [Show the list of all games (compact template)](#user-story-4)
5. [Edit the content of an existing game](#user-story-5)
6. [Add a new game](#user-story-6)
7. [Delete a game](#user-story-7)
8. [Single-page application](#user-story-8)

## Useful links
- [A Tour of the Dart Language][2]
- [Dart API Reference][3]
- [Polymer.dart][4]
- [Polymer.dart examples][6]

# User stories

<a name="user-story-1"></a>

<a name="user-story-2"></a>
## 2. Show the list of all games (detailed template)
> **Goal**: _As a user, I want to see the list of all games with a detailed template_

_**Keywords**: template loop, custom attribute, nested template_

1. Create a new custom element `x-games` 
  - Create `games.html` and `games.dart` files and copy the `GAMES_TEMPLATE`  html blocks from the templates into its body  
  _We are going to work with the `GAMES_TEMPLATE_DETAILED` in this user story so comment or remove the `GAMES_TEMPLATE_COMPACT`_
  - Import and use it in your `index.html` instead of `x-game` and check the result
2. One game is not enough for a Game Store, create a service to retrieve games
  - Create a file `services.dart` with the class `InMemoryGameStoreService`:
  
    ```Dart
    library game_store.service;
    import 'models.dart';
  
    final gameStoreService = new InMemoryGameStoreService();
  
    class InMemoryGameStoreService {
      final List<Game> _games = [
         new Game(1, "Darts", "Pub game", 'Darts is ...', "darts.jpg", 5),                    
         new Game(2, "Chess", "Board game", 'Chess is ...', "chess.jpg", 4),                    
         new Game(3, "Dices", "Random game", 'Dice are ...', "dice.jpg", 3),                    
         new Game(4, "Go", "Board game", 'Go is ...', "go.jpg", 2),
         new Game(5, "Poker", "Card game", 'Poker is ..', "poker.jpg", 4),
         new Game(6, "Pool", "Pub game", 'Pool is ..', "pool.jpg", 3),
         new Game(7, "Bingo", "Boring game", 'Bingo is ..', "bingo.jpg", 1)
      ];
      
      List<Game> getAll() => _games;
    }
    ```
  - Add a `games` attributes in `x-games` class and instantiate it with games retrieved from the service:

    ```Dart
    List<Game> games = gameStoreService.getAll();
    ```    
3. Iterate over the games list
  - Import `x-game` component in your `games.html` file and to be able to reused it.
  - Loop over games using a template loop and reusing the `x-game` component like this ([Hints](#user-story-2-hints)):

    ```HTML
    <x-game game="{{game}}"></x-game>
    ```
4. Congrats! You have more games!

    ![x-games list](docs/img/x-games-list.png)
  

<a name="user-story-2-hints"></a>
> **Hints:**
>
> - Try first to display the names of the games.
> - The `game` attribute in `x-game` should be a public attribute. (See [Custom Attributes](https://www.dartlang.org/polymer-dart/#custom-attributes))

<a name="user-story-3"></a>
## 3. Filter and sort the games list
> **Goal**: _As a user, I want to filter and sort the games list_

_**Keywords**: two-way databinding, observable, event handler_

1. In `models.dart` add those methods to the `Game` class. They will help you for filtering and sorting.

    ```Dart
    // Used for FILTERING
    bool contains(String search) {
      var pattern = new RegExp(search, caseSensitive: false);
      return name.contains(pattern) || genre.contains(pattern) || description.contains(pattern);
    }
    
    // Used for SORTING
    static getComparator(String field) => _comparators.containsKey(field) ? _comparators[field] : (a, b) => 0;
    static final Map _comparators = {
      "name": (Game a, Game b) => a.name.compareTo(b.name),
      "rating": (Game a, Game b) => a.rating.compareTo(b.rating)
    };
    ```
2. Filter the game list when typing text in search input
    - Add a `search` attribute in `games.dart` and bind it to the search input value ([Hints](#user-story-3-hints))
    - Implement a dynamic filter function that allow to filter a games sequence when the given parameter change

    ```Dart
    filterSearch(String search) {
      return (Iterable games) => ???;
    }
    ```
    - Use this filter in template loop binding
    
    ```HTML
    {{game in games | ???}}}
    ```
3. Sort games list when clicking on _Sort by name_ or _Sort by rating_ buttons
  - In `games.html`, bind click events to `sort` handler

    ```HTML
    <button class="btn btn-info" on-click="{{sort}}" data-field="name">Sort by name</button>
    <button class="btn btn-info" on-click="{{sort}}" data-field="rating">Sort by rating</button>
    ```
  - In `games.dart`, add a click handler `sort` that set two new fields `sortField` and `sortAscending`
    - `sortField` is set from the `data-field` attribute in the target element ([Hints](#user-story-3-hints))
    - `sortAscending` is reverted each time a button is clicked
  - Use this `sortBy` filter function in template loop binding

    ```Dart
    sortBy(String field, bool ascending) => (Iterable games) {
      var list = games.toList()..sort(Game.getComparator(field));
      return ascending ? list : list.reversed;
    };
    ```
4. Try to sort and filter the games  
    ![x-games list](docs/img/x-games-list-filter.png)

<a name="user-story-3-hints"></a>
> **Hints:**
>
> - In this user story, attributes should be **Observable**, when the value changed, bindings should be notified (See [Data binding](https://www.dartlang.org/polymer-dart/#data-binding))
> - An event handler is a three parameter methods defined in the custom element class (See  [Event Handlers](https://www.dartlang.org/docs/tutorials/polymer-intro/#event-handlers))  
>   `myClickHandler(Event e, var detail, Element target)`
>   - An `Event` that contains information about the event, such as its type and when it occurred.
>   - The detail object can provide additional, event-specific information.
>   - The `Node` that fired the event—the Start button in this case.
> - [Element.dataset](https://api.dartlang.org/docs/channels/stable/latest/dart_html/Element.html#dataset) allows access to all custom data attributes (data-*) set on this element.

<a name="user-story-4"></a>
## 4. Show the list of all games (compact template)
> **Goal**: _As a user, I want to see the list of all games with an alternative compact template_

_**Keywords**: Template conditionals_

1. Modify `x-games` to deal with compact view 
  - Add a observable boolean field `isCompact` in `game.dart`
  - Use a template condition to display full view when `isCompact` is false. ([Hints](https://www.dartlang.org/polymer-dart/#template-conditionals)).
  - Copy `GAMES_TEMPLATE_COMPACT` template and display it when `isCompact` is true. ([Hints](#user-story-4-hints))
  
2. Manage the change of view.  
  - In `games.dart`, add a toggle method `compact` to change `isCompact` value.
  - In `games.html`, call the `compact` method when the user click on switch view button.
  
3. Great! Needless to scroll down to see all your games
 
![x-games compact](docs/img/x-games-compact.png)
 
> **Bonus:** 
> 
> Change the button class to depends on `isCompact` value :
>  
>  ```HTML
>  class="icon-white {{ {'icon-th-list' : !isCompact , 'icon-th' : isCompact } }}
>  ``` 
 
<a name="user-story-4-hints"></a>
> **Hints:**
>  
> The condition template does not support else, so do not hesitate to use two if conditions.

<a name="user-story-5"></a>
## 5. Edit the content of an existing game
> **Goal**: _As a user, I want to edit the content of an existing game_

<a name="user-story-6"></a>
## 6. Add a new game
> **Goal**: _As a user, I want to add a new game_

_**Keywords**: Custom element_


1. Modify `services.dart` :
  - Change `games` list to transform it as a observable list.
  - Create a `Game save(Game game)` method : Add new element when it's a new game and replace occurence otherwise ([Hint](#user-story-6-hints)).
  
2. Modify `x-game-edit` web component :
  - Add a `save` method which call `save` method from `GameStoreService`.
  - Call this method when the user click on save button.
  
3. Modify `index.html` :
  - Add the custom element `gameId`   
  
4. Yeah ! So many games to add !

![x-game-edit newgame](docs/img/x-game-edit-newgame.png)
 
 
<a name="user-story-6-hints"></a>
> **Hints:** 
> You can use `map` and `fold` methods on `games` list to find next id .
  

<a name="user-story-7"></a>
## 7. Delete a game
> **Goal**: _As a user, I want to delete a game_

<a name="user-story-8"></a>
## 8. Single-page application
> **Goal**: _As a user, I want to navigate through pages without reloading the application._

# Summary
Congratulations, you've completed this codelab and have created a single page application with Dart and Polymer.

_Thanks to Thierry Lau for his AngularJS project [AngularMovie](https://github.com/lauterry/angularmovie) on which we take as example._

  [1]: https://www.dartlang.org/
  [2]: https://www.dartlang.org/docs/dart-up-and-running/contents/ch02.html
  [3]: http://api.dartlang.org/docs/channels/stable/latest/
  [4]: https://www.dartlang.org/polymer-dart/
  [5]: http://pub.dartlang.org/packages/polymer_expressions
  [6]: https://github.com/sethladd/dart-polymer-dart-examples/tree/master/web
