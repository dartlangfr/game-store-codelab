import 'dart:html';
import 'package:polymer/polymer.dart';
import 'models.dart';
import 'services.dart';

@CustomTag('x-games')
class XGames extends PolymerElement {
  bool get applyAuthorStyles => true;
  XGames.created() : super.created();
  
  List<Game> games = gameStoreService.games;
  
  // FILTERING
  @observable String search = "";
  
  filterSearch(String search) => (Iterable games) => games.where((Game e) => e.contains(search));

  // SORTING
  @observable String sortField = "";
  @observable bool sortAscending = true;
  
  sort(Event e, var detail, Element target) {
    var field = target.dataset['field'];
    sortAscending = field == sortField ? !sortAscending : true;
    sortField = field;
  }

  sortBy(String field, bool ascending) => (Iterable games) {
    var list = games.toList()..sort(Game.getComparator(field));
    return ascending ? list : list.reversed;
  };
}

