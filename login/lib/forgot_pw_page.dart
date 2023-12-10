
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:_firebase/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:login/reusable_widget/reusable_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  // void dispose(){
  //   _emailTextController.dispose();
  //   super.dispose();
  //   Future passwordReset () async {
  //    try{
  //      await FirebaseAuth.instance.SendPasswordResetEmail(email:_emailTextController.text.trim());
  //      showDialog(context: context, builder: context){
  //          return AlertDialog(
  //            content: Text('Reset password check your email'),
  //          );
  //        }
  //    }  FirebaseAuthException catch(e){
  //    print(e);
  //    showDialog(context: context, builder: context){
  //      return AlertDialog(
  //        content: Text(e.message.toString()),
  //      );
  //    }
  //    }
  //   }
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.purpleAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Text(
            'Enter your Email you will get reset password',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.redAccent
          ),),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailTextController ,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.purpleAccent),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.white70,
                filled: true,
                hintText: 'Email',
              ),

            ),
          ),
          SizedBox(height: 20,),

          // MaterialButton(onPressed: passwordReset,
          //   child: Text('Reset Password'),
          //   color: Colors.blueAccent,
          //
          // )
        ],
      ),
    );
  }
}
