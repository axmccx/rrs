import 'package:flutter/material.dart';
import 'package:rrs/containers/containers.dart';
import 'package:rrs/models/models.dart';
import 'package:rrs/presentation/day_task_list.dart';


class HomeScreen extends StatelessWidget {
  final List<DayTask> dayTasks;
  final int priority;

  HomeScreen(this.dayTasks, this.priority);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            DrawerHeader(
              child: new Text("Header"),
              decoration: new BoxDecoration(
                color: Colors.orange
              ),
            ),
            RaisedButton(
              child: new Text('New project'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return CreateProject();
                  },
                ));
              }
            )
          ],
        )
      ),
      appBar: AppBar(
        title: Text("Tasks"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return ReportWorkTime();
            },
          ));
        },
        child: Icon(Icons.access_time),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              "The current priority is: $priority",
              style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              "Work on the following Tasks",
              style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            DayTaskList(dayTasks),
          ],
        ),
      ),
    );
  }
}