import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/api/sheet/customer_count_api.dart';
import 'package:flutter_app/api/sheet/dandb_order_api.dart';
import 'package:flutter_app/pages/customer_counter.dart';
import 'package:flutter_app/pages/dandb_serve.dart';
import 'package:flutter_app/pages/from_tables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CustomerCountSheetApi.init();
  await DandBOrderSheetApi.init();
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [
    FromTables(),
    DandBServe(),
    Center(
        child: Text(
      "3",
      style: TextStyle(fontSize: 50),
    )),
    CustomerCounter(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "zHiew",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ครับ"),
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.blueGrey,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "เริ่มจากโต๊ะ"),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt), label: "รายการที่สั่ง"),
            BottomNavigationBarItem(
              icon: Icon(Icons.cancel),
              label: "ยกเลิกรายการ",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "นับลูกค้า",
            )
          ],
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}
