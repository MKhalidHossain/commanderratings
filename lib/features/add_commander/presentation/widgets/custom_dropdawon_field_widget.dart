// import 'package:flutter/material.dart';

// class CustomDropdawonFieldWidget extends StatelessWidget {
//   final String label;
//   final T? value;
//   final List<T> items;
//   final void Function(T?)? onChanged;
//   final String? Function(T?)? validator;
//   const CustomDropdawonFieldWidget({
//     super.key,
//     required this.label,
//     required this.value,
//     required this.items,
//     required this.onChanged,
//     required this.validator,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<T>(
//       value: value,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Colors.white70),
//         filled: true,
//         fillColor: Colors.grey[850],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(4),
//           borderSide: BorderSide(color: Colors.grey.shade600),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(4),
//           borderSide: BorderSide(color: Colors.grey.shade600),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(4),
//           borderSide: BorderSide(color: Colors.white),
//         ),
//       ),
//       dropdownColor: Colors.grey[900],
//       iconEnabledColor: Colors.white,
//       style: TextStyle(color: Colors.white),
//       items:
//           items.map((item) {
//             return DropdownMenuItem<T>(
//               value: item,
//               child: Text(item.toString()),
//             );
//           }).toList(),
//       onChanged: onChanged,
//       validator: validator,
//     );
//   }
// }
