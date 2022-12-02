  class PeriodEntity {
    late int id;
    final String period;
  
    PeriodEntity({required this.period});
  }
  enum PeriodEnum {
    time1(id: 1, period: '1 час'),
    time2(id: 2, period: '3 часа'),
    time3(id: 3, period: '1 день'),
    time4(id: 4, period: 'навсегда');
    const PeriodEnum({
      required this.id,
      required this.period,
    });
    final String period;
    final int id;
  }
