// import 'package:firebase_signin/reusable_widgets/reusable_widget.dart;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login/home_screen.dart';
import 'package:login/signin_screen.dart';
import 'reusable_widget/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference users;

  @override
  void initState() {
    users = firestore.collection('users');
    super.initState();
  }

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users.add({
      'full_name': _nameTextController.text, // John Doe
      'email': _emailTextController.text, // Stokes and Sons
      'password': _passwordTextController.text // 42
    }).then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    }).catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: Text(
          'Sign UP',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email", Icons.person_outline, false,
                    _nameTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter username", Icons.person_outline, false,
                    _emailTextController),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () {
                  print("Sign Up");
                  addUser();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                })
              ],
            ),
          ),
        ),
      ), // decoration:BoxDecoration(gradient: LinearGradien(Colors,),
    );
  }
}
