class CreateProjectAction {
  final String name;
  final Function onComplete;
  final Function onFail;
  // final "date" dueDate;
  // final int timeToFinish;

  CreateProjectAction(this.name, this.onComplete, this.onFail);

  @override
  String toString() {
    return 'CreateProjectAction{name: $name}';
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