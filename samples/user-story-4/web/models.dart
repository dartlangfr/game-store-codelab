library game_store.model;

class Game {
  int id;
  String name;
  String genre;
  String description;
  String image;
  int rating;
  
  // CONSTRUCTORS
  Game(this.id, this.name, this.genre, this.description, this.image, this.rating);
  Game.sample() : this(null, "Game name", "Game genre", "Game description", "chess.jpg", 4);

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
}

