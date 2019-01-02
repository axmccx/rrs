import 'package:meta/meta.dart';
import 'package:rrs/models/models.dart';

@immutable
class AppState {
  final Map<String,Project> projectList;
  final List<DayTask> daySchedule;
  final int curPriority;
  final int workDayLength;
  final int timeQuantum;

  AppState({
    this.projectList = const {},
    this.daySchedule = const [],
    this.curPriority = 0,
    this.workDayLength = 240,
    this.timeQuantum = 120
  });

  AppState copyWith({
    Map<String,Project> projectList,
    List<DayTask> daySchedule,
    int curPriority,
    int workDayLength,
    int timeQuantum
  }) {
    return AppState(
      projectList: projectList ?? this.projectList,
      daySchedule: daySchedule ?? this.daySchedule,
      curPriority: curPriority ?? this.curPriority,
      workDayLength: workDayLength ?? this.workDayLength,
      timeQuantum: timeQuantum ?? this.timeQuantum
    );
  }

  // maybe need hashcode and == operator...

  @override
  String toString() {
    return 'AppState{'
    'projectList: $projectList, '
    'daySchedule: $daySchedule, '
    'curPriority: $curPriority, '
    'workDayLength: $workDayLength, '
    'timeQuantum: $timeQuantum'
    '}';
  }
}