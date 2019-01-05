import 'package:flutter/material.dart';
import 'package:rrs/models/models.dart';

class DayTaskTile extends StatelessWidget {
  final DayTask task;

  DayTaskTile(
    this.task,
  );
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Row(
            children: <Widget>[
              Text(
                "Project: ${this.task.id}"
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                "For ${this.task.time} minutes"
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
