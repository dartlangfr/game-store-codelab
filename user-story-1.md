## 1. Show the content of a game
> **Goal**: _As a user, I want to see the content of a game_

_**Keywords**: custom element, template, binding, filter function_

1. Create a new Polymer application named `game_store_codelab` and explore it
  - Fill the _Application name_ and select _Web application (using the polymer library)_  
    ![Project creation](/docs/img/project-creation.png)
  - Open `pubspec.yaml`. It includes a new dependency:
  
    ```YAML
    dependencies:
      polymer: any
    ```
  - `build.dart` is launched after a file is saved, and displays Polymer warnings from the linter
  - `clickcounter.html` and `clickcounter.dart` is a custom element named `click-counter`  
    _We're not going to work with them, you can remove them or keep them as examples_
  
    ```HTML
    <polymer-element name="click-counter" attributes="count">
      <template>
        <!-- Custom element body -->
      </template>
      <script type="application/dart" src="clickcounter.dart"></script>
    </polymer-element>
    ```
    
    ```Dart
    import 'package:polymer/polymer.dart';

    @CustomTag('click-counter')
    class ClickCounter extends PolymerElement {
      ClickCounter.created() : super.created();
      // ...
    }
    ```
  - `game_store_codelab.html` imports `click-counter` element to use it and initializes Dart and Polymer  
    _We're not going to work with it, you can remove it or keep it as example_
  
    ```HTML
    <head>
      <!-- import the click-counter -->
      <link rel="import" href="clickcounter.html">
      <script type="application/dart">export 'package:polymer/init.dart';</script>
      <script src="packages/browser/dart.js"></script>
    </head>
    
    <body>   
      <click-counter count="5"></click-counter>
    </body>
    ```
  - Run `game_store_codelab.html` in Dartium and test it
2. Copy all files from the _[template](./template)_ folder into the _web_ directory of your project
3. Create a new custom element `x-game`
  - Create `game.html` and `game.dart` file taking `click-counter` element as an example
  - Copy the [`GAME_TEMPLATE`][GAME_TEMPLATE] HTML blocks from the templates into the body of your custom element
  - Import and use it in your `index.html` file

    ```HTML
    <section class="container">
      <x-game></x-game>
    </section>
    ```
  - Open `pubspec.yaml`. Change the entry point to :
  
    ```YAML
transformers:
- polymer:
    entry_points: web/index.html
    ```
  - Run `index.html` in Dartium and you should see something like this ([Hints](#user-story-1-hints)):  
    ![x-game first import](docs/img/x-game-first-import-style.png)
4. Congrats! You created your first custom element! But it's all static, let's do some data bindings :)
  - Create a file `models.dart` with the class `Game`:
    ```Dart
    library game_store.model;
    
    class Game {
      int id;
      String name;
      String genre;
      String description;
      String image;
      int rating;
      
      // Constructors
      Game(this.id, this.name, this.genre, this.description, this.image, this.rating);
      Game.sample() : this(null, "Game name", "Game genre", "Game description", "chess.jpg", 4);
    }
    ```
  - Add a `game` attribute in the `x-game` class:

    ```Dart
    import 'package:polymer/polymer.dart';
    import 'models.dart';
    
    @CustomTag('x-game')
    class XGame extends PolymerElement {
      Game game = new Game.sample();
      // ...
    }
    ```
  - Bind `game` fields into the `x-game` template ([Hints](#user-story-1-hints)):
    - Game name should be uppercased
    - Rating should be transformed into &#9733; characters (`"\u2605"`)

    ![x-game binding](docs/img/x-game-binding.png)

<a name="user-story-1-hints"></a>
> **Hints:**
> 
> - Don't forget to add needed tags in `index.html` header
> - You need special CSS selectors (/deep/) for the styles to apply inside our webcomponents just like in our `app.css` file. Current CSS libs like bootstrap don't actually use them. For the styles to apply, import the style in each of your templates with:
>
>   ```html
>   <link rel="stylesheet" href="css/bootstrap.min.css">
>   ```
> - Implement a filter function to uppercase the game name, defined in the custom element class (See [Polymer expressions](http://pub.dartlang.org/packages/polymer_expressions))
> - Implement also a filter function to transform the rating integer to &#9733; characters ([List.generate](https://api.dartlang.org/docs/channels/stable/latest/dart_core/List.html#generate) and [List.join](https://api.dartlang.org/docs/channels/stable/latest/dart_core/List.html#join) may help)

## [Next >](user-story-2.md)

  [GAME_TEMPLATE]: ../../blob/master/template/index.html#L36-L49
  [GAMES_TEMPLATE]: ../../blob/master/template/index.html#L53-L139
  [GAMES_TEMPLATE_DETAILED]: ../../blob/master/template/index.html#L70-L109
  [GAMES_TEMPLATE_COMPACT]: ../../blob/master/template/index.html#L111-L138
  [GAME_EDIT_TEMPLATE]: ../../blob/master/template/index.html#L143-L173
