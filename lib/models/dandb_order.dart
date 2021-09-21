class DandBOrderFields {
  static final String OrderingDate = 'OrderingDate';
  static final String DandBID = 'DandBID';
  static final String OrderQty = 'OrderQty';
  static final String DBAddiReq = 'DBAddiReq';
  static final String DBLocation = 'DBLocation';
  static final String GroupTake = 'GroupTake';
  static final String LINE_UserID = 'LINE_UserID';
  static final String phone = 'phone';
  static final String CarLicensePlate = 'CarLicensePlate';
  static final String CarProvincePlate = 'CarProvincePlate';
  static final String WhoTake = 'WhoTake';
  static final String DeskTake = 'DeskTake';
  static final String TakeLocation = 'TakeLocation';
  static final String Status = 'Status';
  static final String MakeByEmail = 'MakeByEmail';
  static final String UpdateDate = 'UpdateDate';
  static final String DandBname = 'DandBname';
  static final String GroupReport = 'GroupReport';
  static final String NHCF = 'NHCF';
  static List<String> getFields() => [
        OrderingDate,
        DandBID,
        OrderQty,
        DBAddiReq,
        DBLocation,
        GroupTake,
        LINE_UserID,
        phone,
        CarLicensePlate,
        CarProvincePlate,
        WhoTake,
        DeskTake,
        TakeLocation,
        Status,
        MakeByEmail,
        UpdateDate,
        DandBname,
        GroupReport,
        NHCF
      ];
}

class DandBOrder {
  final String OrderingDate;
  final String DandBID;
  final int OrderQty;
  final String DBAddiReq;
  final String DeskTake;
  final String Status;
  final String MakeByEmail;
  const DandBOrder({
    required this.OrderingDate,
    required this.DandBID,
    required this.OrderQty,
    required this.DBAddiReq,
    required this.DeskTake,
    required this.Status,
    required this.MakeByEmail,
  });

  Map<String, dynamic> toJson() => {
        DandBOrderFields.OrderingDate: OrderingDate,
        DandBOrderFields.DandBID: DandBID,
        DandBOrderFields.OrderQty: OrderQty,
        DandBOrderFields.DBAddiReq: DBAddiReq,
        DandBOrderFields.Status: Status,
        DandBOrderFields.DeskTake: DeskTake,
        DandBOrderFields.MakeByEmail: MakeByEmail,
      };
}
