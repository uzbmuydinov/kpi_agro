import 'package:flutter/material.dart';

class BarchaTopshiriqlar extends StatelessWidget {
  const BarchaTopshiriqlar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(itemCount: 5, itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("Barcha topshiriqlar"),
        );
      }),
    );
  }
}
