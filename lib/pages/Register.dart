// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unused_local_variable, sort_child_properties_last, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/Signin.dart';
import 'package:flutter_app1/shared/SnackBar.dart';
import 'package:flutter_app1/shared/custom_textfiled.dart';
import '../shared/colors.dart';
import 'package:email_validator/email_validator.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final paswordController = TextEditingController();
  bool isloding = false;
  bool isvisibility = true;
  bool ispassword8char = false;
  bool isAtleast1number = false;
  bool ishasUppercase = false;
  bool ishasLowercase = false;
  bool ishasSpecialCharacters = false;
  isPasswordchange(String password) {
    ispassword8char = false;
    isAtleast1number = false;
    ishasUppercase = false;
    ishasLowercase = false;
    ishasSpecialCharacters = false;
    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        ispassword8char = true;
      }
      if (password.contains(RegExp(r'[0-9]'))) {
        isAtleast1number = true;
      }
      if (password.contains(RegExp(r'[A-Z]'))) {
        ishasUppercase = true;
      }
      if (password.contains(RegExp(r'[a-z]'))) {
        ishasLowercase = true;
      }
      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        ishasSpecialCharacters = true;
      }
    });
  }

  register() async {
    setState(() {
      isloding = true;
    });
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: paswordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        showSnackBar(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        showSnackBar(context, 'The account already exists for that email.');
      } else {
        showSnackBar(context, "ERROR - Please try again late");
      }
    } catch (Error) {
      showSnackBar(context, Error.toString());
    }
    setState(() {
      isloding = false;
    });
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    emailController.dispose();
    paswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: appbar,
      title: Text("Register"),
      elevation: 0,
    ),
      // backgroundColor: Color.fromARGB(255, 245, 245, 245),
      backgroundColor: Color.fromARGB(255, 217, 212, 238),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(33.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(
                    //   height: 64,
                    // ),
                    TextField(
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: decorationTextfield.copyWith(
                          suffixIcon: Icon(Icons.person),
                          hintText: "Enter Your username : ",
                        )),
                    const SizedBox(
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
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        decoration: decorationTextfield.copyWith(
                          suffixIcon: Icon(Icons.email),
                          hintText: "Enter Your Email : ",
                        )),
                    const SizedBox(
                      height: 33,
                    ),
                    TextFormField(
                        onChanged: (password) {
                          isPasswordchange(password);
                        },
                        // we return "null" when something is valid
                        validator: (value) {
                          return value!.length < 8
                              ? "Enter at least 8 characters"
                              : null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: paswordController,
                        keyboardType: TextInputType.text,
                        obscureText: isvisibility ? false : true,
                        decoration: decorationTextfield.copyWith(
                            hintText: "Enter Your Password : ",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isvisibility = !isvisibility;
                                });
                              },
                              icon: isvisibility
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ))),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ispassword8char
                                  ? Colors.green
                                  : Colors.white,
                              border: Border.all(
                                  color: Color.fromARGB(255, 122, 122, 122))),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text("At least 8 characters")
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isAtleast1number
                                  ? Colors.green
                                  : Colors.white,
                              border: Border.all(
                                  color: Color.fromARGB(255, 122, 122, 122))),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text("At least 1 number")
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ishasUppercase
                                  ? Colors.green
                                  : Colors.white,
                              border: Border.all(
                                  color: Color.fromARGB(255, 122, 122, 122))),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text("Has Uppercase")
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ishasLowercase
                                  ? Colors.green
                                  : Colors.white,
                              border: Border.all(
                                  color: Color.fromARGB(255, 122, 122, 122))),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text("Has Lowercase")
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ishasSpecialCharacters
                                  ? Colors.green
                                  : Colors.white,
                              border: Border.all(
                                  color: Color.fromARGB(255, 122, 122, 122))),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text("Has Special Characters")
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    ElevatedButton(
                      onPressed: ()async {
                        if (_formKey.currentState!.validate()) {
                          await register();
                          if (!mounted) return;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  Login()),
                            );
                        } else {
                          showSnackBar(context, 'Error');
                        }
                      },
                      child: isloding
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Register",
                              style: TextStyle(fontSize: 19),
                            ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(appbar),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(12)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  Login()),
                            );
                          },
                          child: Text('Sign Up',
                              style: TextStyle(
                                  // color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline
                                  )),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
