// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/Signin.dart';
import 'package:flutter_app1/pages/home.dart';
import 'package:flutter_app1/shared/SnackBar.dart';
import 'package:flutter_app1/shared/colors.dart';
import 'package:flutter_app1/shared/custom_textfiled.dart';

class Resetpassword extends StatefulWidget {
  Resetpassword({super.key});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  final EmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isloding = false;
  resetPassword() async {
    setState(() {
      isloding = true;
    });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: EmailController.text);
      if (!mounted) return;
    Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => Login())));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR. :${e.code}");
    }
    
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    EmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 212, 238),
      appBar: AppBar(
        backgroundColor: appbar,
        title: Text("Reset Password"),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Enter your email to reset your password.",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 33,
              ),
              TextFormField(
                  // we return "null" when something is valid
                  validator: (email) {
                    return email!.contains(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                        ? null
                        : "Enter a valid email";
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: EmailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: decorationTextfield.copyWith(
                    suffixIcon: Icon(Icons.email),
                    hintText: "Enter Your Email : ",
                  )),
              const SizedBox(
                height: 33,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    resetPassword();
                  } else {
                    showSnackBar(context, 'Error');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(appbar),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: isloding
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Reset Password",
                        style: TextStyle(fontSize: 19),
                      ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
