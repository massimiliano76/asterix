import 'package:asterix/models/Local/DataWrapper.dart';
import 'package:asterix/redux/actions/Local/local_action.dart';
import 'package:asterix/redux/store/AppState.dart';

AppState localReducer(AppState prevState, dynamic action) {
  switch (action.type) {
    case LocalActions.SaveInfo:
      AppState newState = prevState;

      DataWrapper newInfo = action.payload as DataWrapper;

      newState.localInfo = newInfo.localInfo;
      newState.addons = newInfo.addons;

      return newState;
  }

  return prevState;
}
