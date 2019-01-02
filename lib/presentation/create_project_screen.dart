import 'package:flutter/material.dart';

typedef OnSubmit = Function(BuildContext, GlobalKey<ScaffoldState>, String);

class CreateProjectScreen extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  static final _projectNameKey = GlobalKey<FormFieldState<String>>();
  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  final OnSubmit onSubmit;

  CreateProjectScreen(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "New Project"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                key: _projectNameKey,
                autofocus: true,
                style: textTheme.headline,
                decoration: InputDecoration(
                  labelText: "Project Name",
                ),
                validator: (val) {
                  return val.trim().isEmpty
                      ? 'Please enter a project name'
                      : null;
                },
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    onSubmit(
                        context,
                        _scaffoldKey,
                        _projectNameKey.currentState.value
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}