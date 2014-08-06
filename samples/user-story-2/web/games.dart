import 'package:polymer/polymer.dart';
import 'models.dart';
import 'services.dart';

@CustomTag('x-games')
class XGames extends PolymerElement {
  bool get applyAuthorStyles => true;
  XGames.created() : super.created();
  
  List<Game> games = gameStoreService.games;
}

