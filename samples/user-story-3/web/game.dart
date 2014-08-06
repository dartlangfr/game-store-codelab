import 'package:polymer/polymer.dart';
import 'models.dart';

@CustomTag('x-game')
class XGame extends PolymerElement {
  bool get applyAuthorStyles => true;
  XGame.created() : super.created();
  
  @published Game game = new Game.sample();
  
  String uppercase(String value) => value.toUpperCase();
  String stars(int rating) => new List.generate(rating, (_) => "\u2605").join();
}

