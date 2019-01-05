import 'package:flutter/material.dart';
import 'package:rrs/models/models.dart';
import 'package:rrs/presentation/day_task_tile.dart';

class DayTaskList extends StatelessWidget {
  final List<DayTask> dayTasks;

  DayTaskList(
    this.dayTasks,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: dayTasks.length,
        itemBuilder: (BuildContext context, int index) {
          final task = dayTasks[index];
          return DayTaskTile(task);
        },
      ),
    );
  }
}

