import 'package:flutter/material.dart';
import 'package:flutter_app/pages/make_order.dart';

class FromTables extends StatelessWidget {
  const FromTables({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      crossAxisCount: 3,
      children: List.generate(18, (index) {
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MakeOrder(tname: "Table${index + 1}", qty: 1)),
              );
            },
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: Text(
                "Table${index + 1}",
                style: TextStyle(fontSize: 16),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://www.norpelfurniture.com/upload/155592169539.jpg"),
                      fit: BoxFit.fill)),
            ),
          ),
        );
      }),
    ));
  }
}
