import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rrs/models/models.dart';
import 'package:rrs/containers/containers.dart';
//import 'package:rrs/presentation/home_screen.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Today")
        ),
        body: Container(),
    );
  }
}
