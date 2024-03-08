// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class MyPageDemo extends StatefulWidget {
//   const MyPageDemo({super.key});
//
//   @override
//   State<MyPageDemo> createState() => _MyPageDemoState();
// }
//
// class _MyPageDemoState extends State<MyPageDemo> {
//   List data = [
//     "Agreement",
//     "Execution of the work",
//     "Schedule",
//     "Taxes fees and penalties",
//     "Warranties",
//     "Supervision",
//     "Safety",
//     "MEETINGS",
//     "INSPECTION",
//     "COORDINATION AND ACCESS",
//     "SUBMITTALS",
//     "Owner policies",
//     "Changes in the work",
//     "Indemnity",
//   ];
//   bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Expanded(
//         child: ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             final item = data[index];
//             return ListTile(
//               title: Text(item),
//               leading: Checkbox(
//                 value: isChecked,
//                 onChanged: (bool? value) {
//                   setState(() {
//                     isChecked = value!;
//                   });
//                 },
//               ),
//             );
//           },
//         ),
//
//       ),
//     );
//   }
//
// // void _showDialog() {
// //   showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return AboutDialog(
// //         children: [
// //           Column(
// //             children: [
// //               TextFormField(
// //                 validator: (value) {
// //                   if (value!.isEmpty) {
// //                     return 'Place Enter Name';
// //                   }
// //                   return null;
// //                 },
// //                 controller: textController,
// //                 keyboardType: TextInputType.name,
// //                 decoration: InputDecoration(
// //                     labelText: " Enter Name",
// //                     errorBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                         borderSide: const BorderSide(color: Colors.red)),
// //                     focusedErrorBorder: const OutlineInputBorder(
// //                         borderSide: BorderSide(color: Colors.red)),
// //                     border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(10))),
// //               ),
// //               const SizedBox(height: 20),
// //               // ElevatedButton(
// //               //   onPressed: () {
// //               //     _controller.dataList
// //               //         .add(dataList(textController.text, false));
// //               //     textController.clear();
// //               //     Get.back();
// //               //   },
// //               //   child: const Text('Add'),
// //               // ),
// //             ],
// //           ),
// //         ],
// //       );
// //     },
// //   );
// // }
// }
// //_controller.listItems.add(ListItem("New Item", false));
// //  _controller._saveData();
// //
