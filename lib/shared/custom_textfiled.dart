// // ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_constructors_in_immutables

// import 'package:flutter/material.dart';

// class Mytextfiled extends StatelessWidget {
//   final bool inpassword;
//   final String hinttextt;
//   final TextInputType textInputTypee;

//   Mytextfiled({super.key,
//     required this.textInputTypee,
//     required this.inpassword,
//     required this.hinttextt, required TextEditingController controller,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//         keyboardType: textInputTypee,
//         obscureText: inpassword,
//         decoration: InputDecoration(
//           hintText: hinttextt,
//           // To delete borders
//           enabledBorder: OutlineInputBorder(
//             borderSide: Divider.createBorderSide(context),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.grey,
//             ),
//           ),
//           // fillColor: Colors.red,
//           filled: true,
//           contentPadding: const EdgeInsets.all(8),
//         ));
//   }
// }
import 'package:flutter/material.dart';
const decorationTextfield = InputDecoration(
  // To delete borders
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
  // fillColor: Colors.red,
  filled: true,
  contentPadding: EdgeInsets.all(8),
);
