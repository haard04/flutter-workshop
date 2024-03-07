# flutter-workshop

1) Create Git Repo
2) Clone Git Repo
3) View -> Command paleatte (ctrl+shift+p)  ->  Flutter: New Project -> Application -> Name
4) ``flutter run`` for Running App
5) r, R,q  commands
6) in Main.dart -> Remove HomePage Widget
7) create home.dart , stateless widget
8) ``` <dart>
   primarySwatch: Colors.blue
   ```


9) scaffold, appbar, Text, style- textstyle, font size, 
10) Container ,column , row
11) Textfied
    ``` <dart>
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
    ```
    
    
13) Elevated Button, Naviagator
    ```<dart>
    ElevatedButton(onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) =>  Home()),(Route<dynamic> route) => false,
        );
              }, child: Text('Button'))
    ```
14) Icon
    ```<dart>
     Icon(Icons.calculate)
    ```
16) Icon Button
    ```
    IconButton(onPressed: (){}, icon: Icon(Icons.lock_clock_rounded))
    ```
16) Gester detecter
    ```
    GestureDetector(
                onDoubleTap: () {
                  
                },
                child:Icon(Icons.abc)
              )
    ```
18) Alignment
    ```
    mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
    ```
19) padding
20) Bottom Navbar
    ```<dart>
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
    ```
22) Sizer
    ```
    sizer: ^2.0.15
    ```
    ```
    return Sizer(builder: (context, orientation, deviceType) {
    return
       MaterialApp(
    )})
    ```
23) Awesome dialogue box
    ```<dart>
    awesome_dialog: ^3.0.2
    ```
    ```
      
    import 'package:awesome_dialog/awesome_dialog.dart';
    AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.info,
          title: 'Title here',
          desc:   'This is description  ',
          btnOkOnPress: () {},
        ).show();
    ```
24) Snackbar
    ```
    const snackBar = SnackBar(
          content: Text('Snack created successfully'),
        );
    ```
25) 


  
