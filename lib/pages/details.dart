// ignore_for_file: prefer_const_constructors, sort_child_properties_last, camel_case_types, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app1/model/item.dart';
import 'package:flutter_app1/shared/appbar.dart';
import 'package:flutter_app1/shared/colors.dart';

class Destails extends StatefulWidget {
  Items proudct;
  Destails({required this.proudct, required Items product});

  @override
  State<Destails> createState() => _DestailsState();
}

class _DestailsState extends State<Destails> {
  bool isShowmore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 212, 238),
      appBar: AppBar(
        title: Text("Details screen"),
        backgroundColor: appbar,
        actions: [
          ProudctanaPrice()
          // Row(
          //   children: [
          //     Stack(
          //       children: [
          //         Positioned(
          //           bottom: 22,
          //           child: Container(
          //               child: Text(
          //                 "8",
          //                 style: TextStyle(fontSize: 18, color: Colors.white),
          //               ),
          //               padding: EdgeInsets.all(5),
          //               decoration: BoxDecoration(
          //                   color: Color.fromARGB(210, 222, 222, 222),
          //                   shape: BoxShape.circle)),
          //         ),
          //         IconButton(
          //             onPressed: () {}, icon: Icon(Icons.add_shopping_cart)),
          //       ],
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(right: 12),
          //       child: Text(
          //         "\$ 104",
          //         style: TextStyle(fontSize: 18),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.proudct.imgpath),
            SizedBox(height: 11),
            Text(
              "\$ ${widget.proudct.price}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    "New",
                    style: TextStyle(fontSize: 15),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color.fromARGB(255, 255, 129, 129),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 26,
                    ),
                    Icon(Icons.star, color: Colors.amber, size: 26),
                    Icon(Icons.star, color: Colors.amber, size: 26),
                    Icon(Icons.star, color: Colors.amber, size: 26),
                    Icon(Icons.star, color: Colors.amber, size: 26),
                  ],
                ),
                SizedBox(
                  width: 66,
                ),
                Row(
                  children: [
                    Icon(Icons.edit_location, color: Colors.green, size: 26),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Mobile shop",
                      style: TextStyle(fontSize: 19),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Destails: ",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Mobile Shop is one of the largest companies for retail. Mobile Shop established in 2006 and it has more than 100 branches all over Egypt. It distinguishes among many companies that it became number 1 in the field of selling mobiles and mobile accessories. Furthermore, it has many international brands such as Samsung, Apple, HTC, Lenovo, ….. etc, in addition to original mobile accessories that have international quality. Mobile shop presents other services to its customers like Te-data, Vodafone, Masary and else. All of the above services are in all Mobile Shop branches, represented by loyal customer service agents that highly talented through continuing training. Our well experienced and trained staff has been always granted a high level of Customer satisfaction, Their main focus is to advise customers of the ideal products rather than to push them to buy.",
              style: TextStyle(fontSize: 20),
              maxLines: isShowmore ? 4 : null,
              overflow: TextOverflow.fade,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isShowmore = !isShowmore;
                  });
                },
                child: Text(
                  isShowmore ? "Show more" : "Show less",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
