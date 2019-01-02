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