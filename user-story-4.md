## 4. Show the list of all games (compact template)
> **Goal**: _As a user, I want to see the list of all games with an alternative compact template_

_**Keywords**: template conditional_

1. Display compact template in games list
  - In `games.html`, add `GAMES_TEMPLATE_COMPACT` HTML blocks
  - Recreate a template loop for it and bind game fields

2. Switch between templates
  - In `games.dart`, add an observable field `isCompact`

    ```Dart
    @observable bool isCompact = false;
    ```
  - Add a click handler on the toggle button to reverse the value of `isCompact`

    ```Dart
    compact(Event e, var detail, Element target) => isCompact = !isCompact;
    ```
  - In `games.html`, use a conditional templates to display the right template ([Hints](#hints))
    - `GAMES_TEMPLATE_COMPACT` when `isCompact` is `true`
    - `GAMES_TEMPLATE_DETAILED` when `isCompact` is `false`
3. Great! Needless to scroll down to see all your games  
  ![x-games compact](docs/img/x-games-compact.png)
 
> **Bonus:** 
> 
> Change the button class to depends on `isCompact` value :
>  
>  ```HTML
>  class="icon-white {{ {'icon-th-list' : !isCompact , 'icon-th' : isCompact } }}
>  ``` 
 
<a name="hints"></a>
> **Hints:**
> 
> - See [Template conditionals](https://www.dartlang.org/polymer-dart/#template-conditionals)
> - The condition template does not support else, so do not hesitate to use two if conditions.

## [Next >](user-story-5.md)
