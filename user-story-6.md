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
  
4. Yeah! So many games to add!

![x-game-edit newgame](docs/img/x-game-edit-newgame.png)
 
 
<a name="user-story-6-hints"></a>
> **Hints:** 
> You can use `map` and `fold` methods on `games` list to find next id.

## [Next >](user-story-7.md)
