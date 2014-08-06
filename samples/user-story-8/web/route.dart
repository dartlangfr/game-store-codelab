import 'package:polymer/polymer.dart';
import 'package:route/client.dart';

@CustomTag('x-route')
class XRoute extends PolymerElement {
  // Whether styles from the document apply to the contents of the component
  bool get applyAuthorStyles => true;
  XRoute.created() : super.created() {
    var router = new Router()
      ..addHandler(gamesUrl, _routeHandler(gamesUrl))
      ..addHandler(gameUrl, _routeHandler(gameUrl))
      ..addHandler(newGameUrl, _routeHandler(newGameUrl))
      ..listen();

    route = new Route(gamesUrl);
  }
  
  final gamesUrl = new UrlPattern(r'/(.*)#/games');
  final gameUrl = new UrlPattern(r'/(.*)#/games/(\d+)');
  final newGameUrl = new UrlPattern(r'/(.*)#/games/new');

  @observable Route route;

  Handler _routeHandler(UrlPattern url) => (String path) {
    print("Route changed: $url - $path");
    route = new Route(url, url.parse(path));
  };
  
  int asInt(String value) => int.parse(value);
}

class Route {
  final UrlPattern url;
  final List params;
  Route(this.url, [this.params = const []]);
  operator [](int index) => index < params.length ? params[index] : null;
}
