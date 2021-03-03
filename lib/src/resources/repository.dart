import 'package:news/src/models/item_model.dart';
import 'news_api_provider.dart';
import 'news_db_provider.dart';

class Repository {
  List<Source> sources = <Source>[NewsApiProvider(), newsDbProvider];

  List<Cache> caches = <Cache>[newsDbProvider];

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    Source source;

    for (source in sources) {
      item = await source.fetchItem(id);

      if (item != null) {
        break;
      }
    }

    for (var cache in caches) {
      cache.addItem(item);
    }

    return item;
  }

  Future<List<int>> fetchTopItems() {
    return sources[1].fetchTopIds();
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();

  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
}
