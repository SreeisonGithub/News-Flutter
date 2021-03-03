import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_provider.dart';
import 'screens/news_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'NEWS',
        home: NewsList(),
      ),
    );
  }
}
