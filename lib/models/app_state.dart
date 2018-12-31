import 'package:meta/meta.dart';
import 'package:rrs/models/models.dart';

@immutable
class AppState {
  final Map<String,Project> projectList;
  final List<DayTask> daySchedule;
  final int curPriority;

  AppState({
    this.projectList = const {},
    this.daySchedule = const [],
    this.curPriority = 0
  });

  AppState copyWith({
    Map<String,Project> projectList,
    List<DayTask> daySchedule,
    int curPriority
  }) {
    return AppState(
      projectList: projectList ?? this.projectList,
      daySchedule: daySchedule ?? this.daySchedule,
      curPriority: curPriority ?? this.curPriority,
    );
  }

  // maybe need hashcode and == operator...

  @override
  String toString() {
    return 'AppState{'
    'projectList: $projectList, '
    'daySchedule: $daySchedule, '
    'curPriority: $curPriority '
    '}';
  }
}