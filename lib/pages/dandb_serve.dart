import 'package:flutter/material.dart';

class DandBServe extends StatefulWidget {
  const DandBServe({Key? key}) : super(key: key);

  @override
  _DandBServeState createState() => _DandBServeState();
}

List preparingList = ["1", "2", "3", "4", "5", "6", "7"];

class _DandBServeState extends State<DandBServe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Text('โต๊ะ5'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Image(
                    image: NetworkImage(
                        "https://www.ridertaxis.co.uk/wp-content/uploads/2019/03/vip-taxi.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text('เพิ่มหวาน'),
            ],
          );
        },
        itemCount: preparingList.length,
      ),
    );
  }
}
