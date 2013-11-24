Game Store Codelab
==================

Learn how to build a webapp with Dart and Polymer.  
<!--
TODO:
- Publish on gh-pages branches and add a link to the template
-->
# Introduction
The goal of this codelab is to develop a game store application from a html template. Users will be able to manage the games in the store.

## Prerequisites
Before you begin this codelab, you should have the last [Dart Editor][1] Setup ready.

## User stories
This codelab is divided into the following sections:

1. [Show the content of a game](#user-story-1)
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

# User stories

<a name="user-story-1"></a>
## 1. Show the content of a game
> **Goal**: _As a user, I want to see the content of a game_

_**Keywords**: class, custom element, binding, template_

1. Create a new Polymer application named `game_store_codelab` and explore it
    ![Project creation](/docs/img/project-creation.png)
  - `pubspec.yaml` with its new dependency
  
    ```YAML
    dependencies:
      polymer: any
    ```
  - `clickcounter.html` and `clickcounter.dart` to know how to build a custom element  
  - `game_store_codelab.html` to know how Polymer is initialized and how a custom element is used
  
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

2. Copy all files from the _[Template](./Template)_ folder into the _web_ directory of your project
3. Create a new custom element `x-game`
  - **TODO**

> **Hints:**
> 
> - Use a filter function to transform the rating integer to star characters (See [Polymer expressions][5])

<a name="user-story-2"></a>
## 2. Show the list of all games (detailed template)
> **Goal**: _As a user, I want to see the list of all games with a detailed template_

<a name="user-story-3"></a>
## 3. Filter and sort the games list
> **Goal**: _As a user, I want to filter and sort the games list_

<a name="user-story-4"></a>
## 4. Show the list of all games (compact template)
> **Goal**: _As a user, I want to see the list of all games with an alternative compact template_

<a name="user-story-5"></a>
## 5. Edit the content of an existing game
> **Goal**: _As a user, I want to edit the content of an existing game_

<a name="user-story-6"></a>
## 6. Add a new game
> **Goal**: _As a user, I want to add a new game_

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
