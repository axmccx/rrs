import 'package:redux/redux.dart';
import 'package:rrs/models/models.dart';
import 'package:rrs/actions/actions.dart';

final projectListReducer = combineReducers<Map<String,Project>>([
  TypedReducer<Map<String,Project>, CreateProjectAction>(_addProject),
]);

Map<String,Project> _addProject(
    Map<String,Project> projectList,
    CreateProjectAction action) {
  // new project
  Project newProj = Project(id: action.name);

  // add it to the map, and return it
  Map<String,Project> newProjectList = Map.of(projectList);
  newProjectList[action.name] = newProj;
  return newProjectList;

  // dispatch update_schedule
  // only if the current day schedule isn't already filled?
  // store.dispatch(UpdateSchedule());
}