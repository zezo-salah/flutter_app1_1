// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/check.dart';
import 'package:flutter_app1/provider/cart.dart';
import 'package:provider/provider.dart';

class ProudctanaPrice extends StatelessWidget {
  const ProudctanaPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<cart>(builder: ((context, cartt, child) {
      return Row(
        children: [
          Stack(
            children: [
              Positioned(
                bottom: 22,
                child: Container(
                    child: Text(
                      "${cartt.selectedproudct.length}",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(210, 222, 222, 222),
                        shape: BoxShape.circle)),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOut(),
                      ),
                    );
                  },
                  icon: Icon(Icons.add_shopping_cart)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              "\$ ${cartt.price}",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      );
    }));
  }
}
