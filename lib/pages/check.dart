// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_app1/model/item.dart';
import 'package:flutter_app1/provider/cart.dart';
import 'package:flutter_app1/shared/appbar.dart';
import 'package:flutter_app1/shared/colors.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 217, 212, 238),
        appBar: AppBar(
          backgroundColor: appbar,
          title: Text("Check Out"),
          actions: [ProudctanaPrice()],
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: 550,
                child: Consumer<cart>(builder: ((context, cartt, child) {
                  return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: cartt.selectedproudct.length,
                      // itemCount:3,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            subtitle:
                                Text("\$${cartt.selectedproudct[index].price}"),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                  cartt.selectedproudct[index].imgpath),
                            ),
                            title: Text(cartt.selectedproudct[index].name),
                            trailing: IconButton(
                                onPressed: () {
                                  cartt.delete(cartt.selectedproudct[index]);
                                },
                                icon: Icon(Icons.remove)),
                          ),
                        );
                      });
                })),
              ),
            ),
            Consumer<cart>(builder: ((context, cartt, child) {
              return ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(appbar),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: Text(
                  "Pay \$ ${cartt.price} ",
                  style: TextStyle(fontSize: 19),
                ),
              );
            })),
          ],
        ));
  }
}
