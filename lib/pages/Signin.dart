// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously, unused_local_variable, unused_import, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/Register.dart';
import 'package:flutter_app1/pages/ResetPassword.dart';
import 'package:flutter_app1/pages/home.dart';
import 'package:flutter_app1/shared/SnackBar.dart';
import 'package:flutter_app1/shared/custom_textfiled.dart';

import '../shared/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  bool isloding = false;
  bool Isvisibility = false;

  SignIn() async {
    setState(() {
      isloding = true;
    });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: EmailController.text, password: PasswordController.text);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR. :${e.code}");
      // if (e.code == 'user-not-found') {
      //   showSnackBar(context, 'No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   showSnackBar(context, 'Wrong password provided for that user.');
      // } else {
      //   showSnackBar(context, 'ERROR..');
      // }
    } 
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        title: Text("Sign In"),
      ),
      // backgroundColor: Color.fromARGB(255, 245, 245, 245),
      backgroundColor: Color.fromARGB(255, 217, 212, 238),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(33.0),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 64,
              ),
              TextField(
                  controller: EmailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: decorationTextfield.copyWith(
                    hintText: "Enter Your Email : ",
                    suffixIcon: Icon(Icons.email),
                  )),
              const SizedBox(
                height: 33,
              ),
              TextField(
                  controller: PasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: Isvisibility ? false : true,
                  decoration: decorationTextfield.copyWith(
                    hintText: "Enter Your Password : ",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            Isvisibility = !Isvisibility;
                          });
                        },
                        icon: Isvisibility
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                  )),
              const SizedBox(
                height: 55,
              ),
              ElevatedButton(
                onPressed: () async {
                  await SignIn();
                  if (!mounted) return;
                },
                child: isloding
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Sign in",
                        style: TextStyle(fontSize: 19),
                      ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(appbar),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Resetpassword()),
                    );
                  },
                  child: Text("Forgot Password?",
                      style: TextStyle(
                          fontSize: 18, decoration: TextDecoration.underline))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Do not have an account? ",
                    style: TextStyle(fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text('Register',
                        style: TextStyle(
                            // color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
