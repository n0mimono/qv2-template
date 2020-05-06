import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qv2/blocs/app.dart';

class HomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context, listen: false);

    return IconButton(
      icon: Icon(FontAwesomeIcons.thumbsUp),
      iconSize: 100.0,
      onPressed: () => bloc.updateItems(),
    );
  }
}
