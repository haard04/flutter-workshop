import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

  TextEditingController fieldTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    String fieldText ;
    fieldText= fieldTextController.text;
    fieldTextController.selection = TextSelection.collapsed(offset: fieldText.length);



    return Scaffold(
      appBar: AppBar(title: Text('Hello',style: TextStyle(),),),
      body: Container(
        child: Column(
          children: 
        [
          Row(
            children: [
              Container(
                height: 120,
                width: 250,
                child: TextField(
                        maxLines: 1,
                        controller: fieldTextController,
                        onChanged: (text)=>{
                          fieldText = text
                        },
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                    
                        decoration: InputDecoration(
                          hintText: 'Enter  Name',
                          hintStyle: TextStyle(color: Colors.black),
                          counterText: ''
                        ),   
                    ),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) =>  Home()),(Route<dynamic> route) => false,
        );
              }, child: Text('Button'))
            ],
          ),
          Row(
            children: [
              Icon(Icons.calculate)
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: (){
                const snackBar = SnackBar(
          content: Text('Snack created successfully'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }, icon: Icon(Icons.lock_clock_rounded)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onDoubleTap: () {
                  AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.info,
          title: 'Title here',
          desc:   'This is description  ',
          btnOkOnPress: () {},
        ).show();
                },
                child:Icon(Icons.abc)
              )
            ],
          )
        ]),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.brown,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('data'),
            ),
            Text('qqww')
          ],
        ),
      ),
    );
  }
}