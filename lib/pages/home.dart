// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_key_in_widget_constructors, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/model/item.dart';
import 'package:flutter_app1/pages/check.dart';
import 'package:flutter_app1/pages/details.dart';
import 'package:flutter_app1/provider/cart.dart';
import 'package:flutter_app1/shared/appbar.dart';
import 'package:provider/provider.dart';
import '../shared/colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 217, 212, 238),
        body: Padding(
          padding: const EdgeInsets.only(top: 44),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 33),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Destails(
                          product: items[index],
                          proudct: items[index],
                        ),
                      ),
                    );
                  },
                  child: GridTile(
                    child: Stack(children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: -5,
                        top: -3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(55),
                          child: Image.asset(items[index].imgpath),
                        ),
                      ),
                    ]),
                    footer: GridTileBar(
// backgroundColor: Color.fromARGB(66, 73, 127, 110),
                      trailing:
                          Consumer<cart>(builder: ((context, cartt, child) {
                        return IconButton(
                            color: Color.fromARGB(255, 62, 94, 70),
                            onPressed: () {
                              cartt.add(items[index]);
                            },
                            icon: Icon(Icons.add));
                      })),
                      leading: Text("\$1200"),
                      title: Text(
                        "",
                      ),
                    ),
                  ),
                );
              }),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(
                      "Zizosalah",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    accountEmail: Text("zizo@yahoo.com"),
                    currentAccountPicture: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage("assets/img/IMG_E2118.JPG"),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/img/075.webp"),
                            fit: BoxFit.cover)),
                  ),
                  ListTile(
                      title: Text("Home"),
                      leading: Icon(Icons.home),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      }),
                  ListTile(
                      title: Text("My products"),
                      leading: Icon(Icons.add_shopping_cart),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckOut(),
                          ),
                        );
                      }),
                  ListTile(
                      title: Text("About"),
                      leading: Icon(Icons.help_center),
                      onTap: () {}),
                  ListTile(
                      title: Text("Logout"),
                      leading: Icon(Icons.exit_to_app),
                      onTap: () {
                       FirebaseAuth.instance.signOut();
                      }),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Developed by Zizo Salah © 2023",
                    style: TextStyle(fontSize: 16),
                  ))
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: appbar,
          actions: [ProudctanaPrice()],
        ));
  }
}
