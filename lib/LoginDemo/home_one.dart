// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx/Controller/getx_controller.dart';
//
// Future buildDialog<dataController>() {
//   return Get.generalDialog(
//     pageBuilder: (context, animation, secondaryAnimation) {
//       final controller = Get.put(MyController());
//
//       final formKey = GlobalKey<FormState>();
//       final textEditingController = TextEditingController();
//
//       return Dialog(
//         child: Form(
//           key: formKey,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//             child: SizedBox(
//               height: 300,
//               width: 300,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 60),
//                   TextFormField(
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Place Enter Name';
//                       }
//                       return null;
//                     },
//                     keyboardType: TextInputType.name,
//                     onFieldSubmitted: controller.addData,
//                     controller: textEditingController,
//                     decoration: InputDecoration(
//                         labelText: " Enter Name",
//                         errorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: const BorderSide(color: Colors.red)),
//                         focusedErrorBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.red)),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (formKey.currentState!.validate()) {
//                         String newData = textEditingController.text.trim();
//                         if (newData.isNotEmpty) {
//                           Get.find<MyController>().addData(newData);
//                           textEditingController.clear();
//                           Navigator.pop(context);
//                         } else {
//                           Get.snackbar('Warning', 'Data already exists');
//                         }
//                       }
//                     },
//                     child: const Text('Add'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
//
// ///
// // InkResponse(
// // child: GestureDetector(
// // child: const Icon(Icons.delete_outline_outlined),
// // onTap: () {
// // // controller.removeWhere(index);
// // },
// // ),
// // ),
