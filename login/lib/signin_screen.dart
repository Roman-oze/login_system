import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login/home_screen.dart';
import 'package:login/reusable_widget/reusable_widget.dart';
import 'package:login/signup_screen.dart';

import 'forgot_pw_page.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference users;

  @override
  void initState() {
    users = firestore.collection('users');
    super.initState();
  }

  void login() {
    users
        .where(
          'email',
          isEqualTo: _emailTextController.text,
        )
        .where(
          'password',
          isEqualTo: _passwordTextController.text,
        )
        .get()
        .then((value) {
      final data = value.docs;
      print(data.length);
      print('User found');
      if (data.isNotEmpty) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }).catchError((error) => print("Failed to found user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        color: Colors.teal,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/thanks.png"),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter username", Icons.person_outline, false,
                    _emailTextController),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Passworrd", Icons.lock_outline, true,
                    _passwordTextController),
                SizedBox(
                  height: 10,
                ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ForgotPasswordPage();
                              },
                              ),
                              );
                            },
                            child: Text('Forgot Password',style: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                              fontWeight:FontWeight.bold
                            ),),
                          ),
                        ],
                      ),
                    ),

                signInSignUpButton(context, true, () {
                  login();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
                signUpOption()
              ],
            ),
          ),

        ),

      ), // decoration:BoxDecoration(gradient: LinearGradien(Colors,),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont have an account ?',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            ' Sign UP',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
  // Widget forgetPassword(BuildContext context) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: 35,
  //     alignment: Alignment.bottomRight,
  //     child: TextButton(
  //       child: const Text(
  //         "Forgot Password?",
  //         style: TextStyle(color: Colors.white70),
  //         textAlign: TextAlign.right,
  //       ),
  //       onPressed: () => Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => ResetPassword())),
  //     ),
  //   );
  // }
}
