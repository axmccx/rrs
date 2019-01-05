import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rrs/models/models.dart';
import 'package:rrs/presentation/home_screen.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return HomeScreen(
          vm.dayTasks,
          vm.pri
        );
      },
    );
  }
}

class _ViewModel {
  final List<DayTask> dayTasks;
  final int pri;
  
  _ViewModel(
    this.dayTasks,
    this.pri
  );

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      store.state.daySchedule,
      store.state.curPriority
    );
  }
}