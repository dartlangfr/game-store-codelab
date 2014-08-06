library game_store.service;
import 'models.dart';

final gameStoreService = new InMemoryGameStoreService();

class InMemoryGameStoreService {
  final List<Game> games = [
     new Game(1, "Darts", "Pub game", 'Darts is ...', "darts.jpg", 5),                    
     new Game(2, "Chess", "Board game", 'Chess is ...', "chess.jpg", 4),                    
     new Game(3, "Dices", "Random game", 'Dice are ...', "dice.jpg", 3),                    
     new Game(4, "Go", "Board game", 'Go is ...', "go.jpg", 2),
     new Game(5, "Poker", "Card game", 'Poker is ..', "poker.jpg", 4),
     new Game(6, "Pool", "Pub game", 'Pool is ..', "pool.jpg", 3),
     new Game(7, "Bingo", "Boring game", 'Bingo is ..', "bingo.jpg", 1)
  ];
}
