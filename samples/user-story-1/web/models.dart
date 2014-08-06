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
}

