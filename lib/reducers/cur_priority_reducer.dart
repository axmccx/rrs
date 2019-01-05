import 'package:redux/redux.dart';
import 'package:rrs/actions/actions.dart';

final curPriorityReducer = combineReducers<int>([
  TypedReducer<int, UpdatePriorityAction>(_updateCurPriority)
]);

int _updateCurPriority(
    int curPriority,
    UpdatePriorityAction action) {
  return action.newPri;
}