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
