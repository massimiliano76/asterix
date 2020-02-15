import 'package:asterix/models/Local/DataWrapper.dart';

enum LocalActions {
  SaveInfo,
}

class SaveInfo {
  DataWrapper payload;
  final LocalActions type = LocalActions.SaveInfo;

  SaveInfo(this.payload);
}
