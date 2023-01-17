
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: RefreshIndicator(
        onRefresh: () async {Get.snackbar("title", "message");},
        child: ListView.builder(itemCount: 5, itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("Bajarilgan topshiriqlar"),
          );
        }),
      ),
    );
  }
}
