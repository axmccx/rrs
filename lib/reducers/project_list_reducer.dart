import 'package:redux/redux.dart';
import 'package:rrs/models/models.dart';
import 'package:rrs/actions/actions.dart';

final projectListReducer = combineReducers<Map<String,Project>>([
  TypedReducer<Map<String,Project>, CreateProjectAction>(_addProject),
  TypedReducer<Map<String,Project>, DoWorkAction>(_doWork),
]);

Map<String,Project> _addProject(
    Map<String,Project> projectList,
    CreateProjectAction action) {
  if (projectList.containsKey(action.name)) {
    action.onFail("Project already exists!");
    return projectList;
  }

  Project newProj = Project(action.name, 1, 120);
  Map<String,Project> newProjectList = Map.of(projectList);
  newProjectList[action.name] = newProj;
  action.onComplete();
  return newProjectList;
}

Map<String,Project> _doWork( 
    Map<String,Project> projectList,
    DoWorkAction action) {
  action.project.doWork(action.time);
  return projectList; // this is weird, b/c not changing app_state, just action object
}