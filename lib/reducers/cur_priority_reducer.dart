import 'package:redux/redux.dart';
import 'package:rrs/actions/actions.dart';

final curPriorityReducer = combineReducers<int>([
  TypedReducer<int, UpdatePriority>(_updateCurPriority)
]);

int _updateCurPriority(
    int curPriority,
    UpdatePriority action) {
  return action.newPri;
}