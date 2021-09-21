import 'package:flutter/material.dart';
import 'package:flutter_app/api/sheet/customer_count_api.dart';
import 'package:flutter_app/models/customer_count.dart';
import 'package:intl/intl.dart';

class CustomerCounter extends StatefulWidget {
  const CustomerCounter({Key? key}) : super(key: key);

  @override
  _CustomerCounterState createState() => _CustomerCounterState();
}

class CustomerItem {
  final String imgUrl;
  final String title;
  final String keyid;
  CustomerItem(this.imgUrl, this.title, this.keyid);
}

class _CustomerCounterState extends State<CustomerCounter> {
  List typeCustomerList = [
    CustomerItem(
        "https://di-uploads-pod18.dealerinspire.com/woodhousemazdaofomaha/uploads/2019/08/Saleswoman_In_Car_Showroom.jpg",
        "Sale",
        "1"),
    CustomerItem(
        "https://images.netdirector.co.uk/gforces-auto/image/upload/w_398,h_398,dpr_2.0,q_auto,c_fill,f_auto,fl_lossy/auto-client/cd96f3f1abb14be5e54ad087e15a4dc4/_02i9765.jpg",
        "Service",
        "2"),
    CustomerItem(
        "https://di-enrollment-api.s3.amazonaws.com/mazda/landing-pages/routine-maintenance/ScheduleServiceImage.jpg",
        "BP",
        "3"),
    CustomerItem(
        "https://www.ridertaxis.co.uk/wp-content/uploads/2019/03/vip-taxi.jpg",
        "VIP",
        "4"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, position) {
        return InkWell(
          onTap: () async {
            insertCustomerCount(typeCustomerList[position].title, "admin");
          },
          child: Container(
            child: Text(
              typeCustomerList[position].title,
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(typeCustomerList[position].imgUrl),
                    fit: BoxFit.cover)),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(8),
          ),
        );
      },
      itemCount: typeCustomerList.length,
    ));
  }

  Future insertCustomerCount(String g, String u) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    final CustomerCounts = [
      CustomerCount(RecordDate: formattedDate, Group: g, Count: 1, CountBy: u),
    ];
    final jsonCustomerCount = CustomerCounts.map((cc) => cc.toJson()).toList();
    await CustomerCountSheetApi.insert(jsonCustomerCount).then((value) => {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("เพิ่มลูกค้า " + g + " ในระบบเรียบร้อยแล้วคะ")))
        });
  }
}
