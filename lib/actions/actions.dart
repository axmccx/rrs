import 'package:rrs/models/models.dart';

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

class DoWorkAction {
  final Project project;
  final int time;

  DoWorkAction(this.project, this.time);

  @override
  String toString() {
    return 'DoWorkAction{project: $project, time: $time}';
  }
}

class UpdateScheduleAction {
  @override
  String toString() {
    return 'UpdateScheduleAction{}';
  }
}

class UpdatePriorityAction {
  final int newPri;

  UpdatePriorityAction(this.newPri);

  @override
  String toString() {
    return 'UpdatePriorityAction{newPri: $newPri}';
  }
}