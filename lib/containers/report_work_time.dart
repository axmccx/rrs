import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:rrs/models/models.dart';
import 'package:rrs/actions/actions.dart';
import 'package:rrs/presentation/report_work_time_screen.dart';

class ReportWorkTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,  _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return ReportWorkTimeScreen(vm.projects, vm.onSubmit);
      }
    );
  }
}

class _ViewModel {
  final List<Project> projects;
  final OnSubmit onSubmit;

  _ViewModel(this.projects, this.onSubmit);

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      store.state.projectList.values.toList(),
      (project, time) {
        store.dispatch(DoWorkAction(project, time));
        store.dispatch(UpdateScheduleAction());
      }
    );
  }
}