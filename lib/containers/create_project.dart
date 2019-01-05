import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:rrs/models/models.dart';
import 'package:rrs/actions/actions.dart';
import 'package:rrs/presentation/create_project_screen.dart';

class CreateProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnSubmit>(
      converter: (Store<AppState> store) {
        return (context, scaffoldKey, projectName) {
          _onComplete() {
            Navigator.pop(context);
          }
          _onFail(error) {
            final snackBar = SnackBar(
              content: Text(error),
            );
            scaffoldKey.currentState.showSnackBar(snackBar);
          }
          store.dispatch(CreateProjectAction(
            projectName,
            _onComplete,
            _onFail,
          ));
          store.dispatch(UpdateSchedule());
        };
      },
      builder: (context, onSave) {
        return CreateProjectScreen(onSave);
      },
    );
  }
}