import 'package:rrs/models/models.dart';

class AppProjectAction {
  final String name;
  // final "date" dueDate;
  // final int timeToFinish;

  AppProjectAction(this.name);

  @override
  String toString() {
    return 'AppProjectAction{name: $name}';
  }
}

class DoWork {
  final int time;

  DoWork(this.time);

  @override
  String toString() {
    return 'DoWork{time: $time}';
  }
}

class UpdateSchedule {
  final List<DayTask> daySchedule;

  UpdateSchedule(this.daySchedule);

  @override
  String toString() {
    return 'UpdateSchedule{}';
  }
}

class UpdatePriority {
  final int newPri;

  UpdatePriority(this.newPri);

  @override
  String toString() {
    return 'UpdateSchedule{}';
  }
}