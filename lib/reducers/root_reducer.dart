import 'package:rrs/models/models.dart';
import 'package:rrs/reducers/reducers.dart';

AppState rootReducer(AppState state, action) {
  return AppState(
    projectList: projectListReducer(state.projectList, action),
    daySchedule: dayScheduleReducer(state.daySchedule, action),
    curPriority: curPriorityReducer(state.curPriority, action)
  );
}