import '../../domain/entity/period.dart';
class Period extends PeriodEntity {
  Period({required super.period});
  Map<String, dynamic> toMap() {
    return {'period': period};
  }
  factory Period.toFromMap(Map<String, dynamic> json) {
    return Period(period: json['period']);
  }
}
