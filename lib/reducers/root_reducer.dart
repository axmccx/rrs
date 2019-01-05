import 'package:rrs/models/models.dart';
import 'package:rrs/reducers/reducers.dart';
import 'package:rrs/actions/actions.dart';

AppState rootReducer(AppState state, action) {
  if (action is UpdateScheduleAction) {
    List<DayTask> newDaySchedule = [];
    int currentPriority = 1;

    List<Project> allProjects = state.projectList.values.toList();
    int dayScheduleTime = 0;
    int i = 0;  // iterator for the allProjects list

    // look in prj_lst for projects that have priority equal to currentPriority
    // i.e. while dayScheduleTime is less than workDayLength, keep filling newDaySchedule 
    while (dayScheduleTime < state.workDayLength) {
      // create day task for that project and add it to newDaySchedule, allocate at most timeQuantum time
      if (allProjects[i].priority <= currentPriority) {
        int workTime;
        if (allProjects[i].timeQuantum < (state.workDayLength - dayScheduleTime)) {
          workTime = allProjects[i].timeQuantum;
        } else {
          workTime = state.workDayLength - dayScheduleTime;
        }

        newDaySchedule.add(DayTask(
          allProjects[i].id,
          workTime,
          allProjects[i].priority
        ));
        dayScheduleTime += workTime;
      }

      i++;

      // if end of list is reached but newDaySchedule not filled with dayScheduleTime, then 
      // increase priority and restart i
      if (i == allProjects.length) {
        currentPriority++;
        i = 0;
      }
    }

    return state.copyWith(
      daySchedule: newDaySchedule,
      curPriority: currentPriority,
    );
  } else {
    return AppState(
      projectList: projectListReducer(state.projectList, action),
      daySchedule: dayScheduleReducer(state.daySchedule, action),
      curPriority: curPriorityReducer(state.curPriority, action)
    );
  }
}