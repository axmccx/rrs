import 'package:flutter/material.dart'; 
import 'package:rrs/models/models.dart';

typedef OnSubmit = Function(Project, int);

class ReportWorkTimeScreen extends StatefulWidget {
  final List<Project> projects;
  final OnSubmit onSubmit;

  ReportWorkTimeScreen(this.projects, this.onSubmit);

  @override
  _ReportWorkTimeScreenState createState() => new _ReportWorkTimeScreenState();
}

class _ReportWorkTimeScreenState extends State<ReportWorkTimeScreen> {
  static final _formKey = GlobalKey<FormState>();

  int _timeWorked;
  int _selectedProjectIndex;

  Function _submit(BuildContext context) {
    return () {
      final form = _formKey.currentState;
      if (form.validate()) {
        form.save();
        widget.onSubmit(
          widget.projects[_selectedProjectIndex],
          _timeWorked
        );
        Navigator.pop(context);
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "Report Work Time"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Time worked in minutes: ",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0),
                    width: 80.0,
                    height: 45.0,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      validator: (val) {
                        try {
                          if (val.isEmpty) { return 'Empty!'; }
                          final num = int.parse(val);
                          if (num <= 0) { return 'Must be > 0, why report this?'; }
                          debugPrint((val.length).toString() );
                          if (val.length > 5) { return 'Invalid'; }
                          return null;
                        } on FormatException {
                          return 'Invalid';
                        }
                      },
                      onSaved: (val) =>
                        _timeWorked = int.parse(val),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              Row(
                children: <Widget>[
                  Text(
                    "Project: ",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: DropdownButton<int>(
                      value: _selectedProjectIndex,
                      items: widget.projects.map((project) {
                        return DropdownMenuItem<int>(
                          child: Text(
                            project.id,
                          ),
                          value: widget.projects.indexOf(project),
                        );
                      }).toList(),
                      onChanged: (int index) {
                        setState(() {
                          _selectedProjectIndex = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              Builder(
                builder: (BuildContext context) {
                  return RaisedButton(
                    onPressed: _submit(context),
                    child: Text("Submit"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}