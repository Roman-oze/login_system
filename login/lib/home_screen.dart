import 'package:flutter/material.dart';
import 'package:login/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter =0;
  void incrementcounter(){
    setState(() {
      counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" DIU Student Id Card"),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: Container(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                SizedBox(
                  height: 5.0,
                ),
                Image.asset(
                  'assets/daffodil.jpg',
                  height:70.0,
                  width: 250.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                CircleAvatar(
                  radius: 73.0,
                  backgroundColor: Colors.amber,
                  child: CircleAvatar(
                    radius: 70.0, // Adjust the radius as needed
                    backgroundImage: AssetImage('assets/dp - Copy.jpg'),
                  ),
                ),
                SizedBox(height: 10,),
                Divider(
                thickness: 1.0,
                  color: Colors.black,
                ),
                        SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(" Full Name : "),
                    ),
                    Container(
                      child: Text("Roman Oze"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Student ID : "),
                    ),
                    Container(
                      child: Text(" 211-51-043"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(" Blood Group : "),
                    ),
                    Container(
                      child: Text(" B+"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Department :"),
                    ),
                    Container(
                      child: Text(" Information Technology & Management (ITM)"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5.0,
                      ),
                     Container(
                       color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10,5, 10, 5),
                          child: Text(' Spent Hours : $counter',style:TextStyle(
                            fontSize: 17.0,
                            fontWeight:FontWeight.bold,
                            color:Colors.black54,

                          ),),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                    onPressed: incrementcounter, child: Text('Track',style: TextStyle(
                  fontSize: 17.0,
                  fontWeight:FontWeight.bold,
                  color:Colors.white,
                ),)),
                SizedBox(height: 40.0,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: ElevatedButton(
                          child: Icon(
                            Icons.logout,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()));
                          },
                        ),
                      ),
                    ])
              ]))),
        ));
  }
}
