import 'package:redux/redux.dart';
import 'package:rrs/models/models.dart';
import 'package:rrs/actions/actions.dart';

final dayScheduleReducer = combineReducers<List<DayTask>>([
  TypedReducer<List<DayTask>, UpdateSchedule>(_updateSchedule)
]);

List<DayTask> _updateSchedule(
    List<DayTask> daySchedule,
    UpdateSchedule action) {
  return daySchedule;
}