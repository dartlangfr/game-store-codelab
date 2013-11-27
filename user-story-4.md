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
