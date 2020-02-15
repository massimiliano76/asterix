import 'package:asterix/models/Local/Day.dart';

class TimeTables {
  final Day monday;
  final Day tuesday;
  final Day wednesday;
  final Day thursday;
  final Day friday;
  final Day saturday;
  final Day sunday;

  TimeTables(this.monday, this.tuesday, this.wednesday, this.thursday,
      this.friday, this.saturday, this.sunday);

  TimeTables.fromJson(Map<String, dynamic> json)
      : monday = Day(json['monday_am'], json['monday_pm']),
        tuesday = Day(json['tuesday_am'], json['tuesday_pm']),
        wednesday = Day(json['wednesday_am'], json['wednesday_pm']),
        thursday = Day(json['thursday_am'], json['thursday_pm']),
        friday = Day(json['friday_am'], json['friday_pm']),
        saturday = Day(json['saturday_am'], json['saturday_pm']),
        sunday = Day(json['sunday_am'], json['sunday_pm']);
}
