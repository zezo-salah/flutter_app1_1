// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/Signin.dart';
import 'package:flutter_app1/pages/Register.dart';
import 'package:flutter_app1/pages/check.dart';
import 'package:flutter_app1/pages/details.dart';
import 'package:flutter_app1/pages/home.dart';
import 'package:flutter_app1/provider/cart.dart';
import 'package:flutter_app1/shared/SnackBar.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return cart();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            } else if (snapshot.hasError) {
              return showSnackBar(context, "Something went wrong");
            } else if (snapshot.hasData) {
              return Home();
            } else {
              return Login();
            }
          }),
        ),
      ),
    );
  }
}
