import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:rrs/reducers/root_reducer.dart';
import 'package:rrs/models/models.dart';
import 'package:rrs/presentation/root_screen.dart';

void main() => runApp(RrsApp());

class RrsApp extends StatelessWidget {
  final Store<AppState> store;
  final int workDayLength = 240;
  final int tq = 120;

  RrsApp() : store = Store<AppState>(
    rootReducer,
    initialState: AppState(),
    middleware: []
      ..add(LoggingMiddleware.printer()),

  ) {
    //store.dispatch(InitAppAction());
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: "RRScheduler",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootScreen(),
      ),
    );
  }
}