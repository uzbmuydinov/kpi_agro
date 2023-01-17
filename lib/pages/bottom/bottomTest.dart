import 'package:flutter/material.dart';

class BottomTest extends StatefulWidget {
  const BottomTest({Key? key}) : super(key: key);

  @override
  State<BottomTest> createState() => _BottomTestState();
}

class _BottomTestState extends State<BottomTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: (){
            // debugPrint("Bosildi");

            showBottom(context);
          },
          color: Colors.orange,
          child: Text("Press me"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );

  }

}
Future showBottom(BuildContext context){
  return showModalBottomSheet(
    enableDrag: true,

      context: context,
      builder: (BuildContext context){
        return Container(
          height: MediaQuery.of(context).size.height*5,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
          ),

          child: ListView.builder(
            itemCount:30,
              itemBuilder: (context, index) =>ListTile(
                leading: CircleAvatar(backgroundColor: Colors.red),
                title: Text("takror"),

              ) ,)

        );
      }
  );
}


