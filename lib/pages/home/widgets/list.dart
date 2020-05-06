import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qv2/blocs/app.dart';
import 'package:qv2/domains/models/article.dart';
import 'package:qv2/pages/article/page.dart';

class HomeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeListState();
}

class HomeListState extends State<HomeList> {
  ScrollController _scrollController;
  int _scrollItemCount;

  void _handleScroll() {
    if (_scrollItemCount == 0) return;

    final offsetPerItem = _scrollController.position.maxScrollExtent /
        _scrollItemCount;
    final indexOfScroll = _scrollController.offset / offsetPerItem;

    if (_scrollItemCount - indexOfScroll < 5) {
      final bloc = Provider.of<AppBloc>(context, listen: false);
      bloc.updateItems();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
    _scrollItemCount = 0;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context, listen: false);

    final colors = <int>[200, 100, 50];

    return Column(
      children: <Widget>[
        SizedBox(
          height: 500,
          child: StreamBuilder<Catalog>(
            stream: bloc.catalog,
            initialData: Catalog(articles: List<Article>()),
            builder: (context, snapshot) {
              final catalog = snapshot.data;
              if (catalog.articles.isEmpty) {
                _scrollItemCount = 0;
                return Icon(FontAwesomeIcons.gamepad, size: 20);
              } else {
                _scrollItemCount = catalog.articles.length;
                return ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(8),
                    itemCount: catalog.articles.length,
                    itemBuilder: (context, index) =>
                        HomeListItem(
                            article: catalog.articles[index],
                            color: Colors.amber[colors[index % 3]]),
                    separatorBuilder: (context, index) => const Divider());
              }
            },
          ),
        )
      ],
    );
  }
}

class HomeListItem extends StatelessWidget {
  HomeListItem({Key key, this.article, this.color}) : super(key: key);
  final Color color;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Row(
          children: <Widget>[
            SizedBox(
                width: 70, child: Image.network(article.user.profileImageUrl)),
            Expanded(
                child: FlatButton(
                  child: Text(article.title),
                  color: color,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(
                          ArticlePage.routeName,
                          arguments: {ArticlePage.routeName: article}),
                ))
          ],
        ));
  }
}
