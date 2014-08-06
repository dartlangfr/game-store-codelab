import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:polymer_expressions/filter.dart';
import 'models.dart';
import 'services.dart';

@CustomTag('x-game-edit')
class XGameEdit extends PolymerElement {
  // Whether styles from the document apply to the contents of the component
  bool get applyAuthorStyles => true;
  XGameEdit.created() : super.created() {
    onPropertyChange(this, #gameId, loadGame);
  }

  @published int gameId = null;
  @observable Game game = new Game.sample();
  
  loadGame() => game = gameId == null ? new Game.sample() 
                                      : gameStoreService.getById(gameId);
  
  var asInt = new StringToInt();

  save(MouseEvent e, var detail, Element target) => gameStoreService.save(game);
}

class StringToInt extends Transformer<String, int> {
  String forward(int i) => '$i';
  int reverse(String s) => int.parse(s);
}