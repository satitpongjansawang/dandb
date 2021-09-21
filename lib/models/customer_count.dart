class CustomerCountFields {
  static final String RecordDate = 'RecordDate';
  static final String Group = 'Group';
  static final String Count = 'Count';
  static final String CountBy = 'CountBy';
  static List<String> getFields() => [RecordDate, Group, Count, CountBy];
}

class CustomerCount {
  final String? RecordDate;
  final String Group;
  final int Count;
  final String CountBy;

  const CustomerCount(
      {required this.RecordDate,
      required this.Group,
      required this.Count,
      required this.CountBy});

  Map<String, dynamic> toJson() => {
        CustomerCountFields.RecordDate: RecordDate,
        CustomerCountFields.Group: Group,
        CustomerCountFields.Count: Count,
        CustomerCountFields.CountBy: CountBy,
      };
}
