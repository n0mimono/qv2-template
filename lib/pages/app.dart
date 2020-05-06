import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qv2/blocs/app.dart';
import 'package:qv2/pages/article/page.dart';
import 'package:qv2/pages/home/page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AppBloc>(
      create: (_) => AppBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: MaterialApp(
          title: 'qv2',
          theme: ThemeData(),
          home: HomePage(),
          routes: <String, WidgetBuilder>{
            ArticlePage.routeName: (context) => ArticlePage(),
          }),
    );
  }
}
