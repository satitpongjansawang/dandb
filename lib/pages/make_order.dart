import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api/sheet/dandb_order_api.dart';
import 'package:flutter_app/models/dandb_order.dart';
import 'package:intl/intl.dart';

class MakeOrder extends StatefulWidget {
  final String tname;
  final int qty;

  const MakeOrder({
    Key? key,
    required this.tname,
    required this.qty,
  }) : super(key: key);

  @override
  _MakeOrderState createState() => _MakeOrderState(tname, qty);
}

class FruitsList {
  String name;
  int index;
  FruitsList({required this.name, required this.index});
}

class _MakeOrderState extends State<MakeOrder> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final String tname;
  final int qty;
  String? value;
  String? aa;
  final bList = ["น้ำดื่ม", "กาแฟ"];
  final DBAddiReqList = [
    '',
    'หวานปกติ',
    'หวานน้อย',
    'เพิ่มหวาน',
    'ไม่เย็น',
    'ขอช้อนเพิ่ม',
    'ไม่ใส่นม',
    'เพิ่มนม',
    'อุ่นร้อน',
    'เข้มข้น'
  ];
  _MakeOrderState(this.tname, this.qty);
  List<String> lst = ['0', '1', '2', '3', '4', '5'];

  int secondaryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    int _value = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(tname),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: this._formKey,
            child: ListView(
              children: <Widget>[
                DropdownButton<String>(
                  isExpanded: true,
                  value: value,
                  onChanged: (newValue) {
                    setState(() {
                      value = newValue;
                      //print(value);
                    });
                  },
                  items: bList.map((valueItem) {
                    return DropdownMenuItem(
                        value: valueItem, child: Text(valueItem));
                  }).toList(),
                ),
                DropdownButton<String>(
                    value: aa,
                    onChanged: (a) {
                      setState(() {
                        aa = a;
                      });
                    },
                    isExpanded: true,
                    items: DBAddiReqList.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList()),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      customRadio2(lst[1], 1),
                      customRadio2(lst[2], 2),
                      customRadio2(lst[3], 3),
                      customRadio2(lst[4], 4),
                      customRadio2(lst[5], 5),
                    ],
                  ),
                ),
                Container(
                  width: screenSize.width,
                  child: ElevatedButton(
                    child: Text(
                      'บันทึก',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      insertOrder(value!, secondaryIndex, '-', tname,
                              'Preparing', 'admin')
                          .then((value) => {Navigator.pop(context)});
                    },
                  ),
                  margin: EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }

  void changeSecondaryIndex(int index) {
    setState(() {
      secondaryIndex = index;
      //print(secondaryIndex);
    });
  }

  Future insertOrder(String DandBID, int OrderQty, String DBAddiReq,
      String DeskTake, String Status, String MakeByEmail) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    final DandBOrders = [
      DandBOrder(
          OrderingDate: formattedDate,
          DandBID: DandBID,
          OrderQty: OrderQty,
          DBAddiReq: DBAddiReq,
          Status: Status,
          DeskTake: DeskTake,
          MakeByEmail: MakeByEmail),
    ];

    final jsonDandBOrder = DandBOrders.map((db) => db.toJson()).toList();
    await DandBOrderSheetApi.insert(jsonDandBOrder);
  }

  Widget customRadio2(String txt, int index) {
    return ButtonTheme(
      height: 30,
      minWidth: 70,
      child: OutlineButton(
        onPressed: () => changeSecondaryIndex(index),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        borderSide: BorderSide(
            color:
                secondaryIndex == index ? Colors.deepOrangeAccent : Colors.grey,
            width: 1.2),
        child: Text(txt,
            style: TextStyle(
              color:
                  secondaryIndex == index ? Colors.orangeAccent : Colors.grey,
            )),
      ),
    );
  }
}
