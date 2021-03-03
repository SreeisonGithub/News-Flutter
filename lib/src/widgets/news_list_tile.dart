import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
//import '../models/item_model.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;
  

  NewsListTile({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('data is loading..!!');
        }
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return Text('item still loading $itemId');
            }

            return Text(itemSnapshot.data.title);
          },
        );
      },
    );
  }
}
