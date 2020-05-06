import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qv2/blocs/app.dart';
import 'package:qv2/pages/home/presenter.dart';

class HomePage extends StatefulWidget {
  static String routeName =  '/home';

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final bloc = Provider.of<AppBloc>(context, listen: false);
    bloc.updateItems();
  }

  @override
  Widget build(BuildContext context) {
    return HomePresenter(title: 'qv2');
  }
}
