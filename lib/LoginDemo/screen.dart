/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.userid}) : super(key: key);
  final String userid;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DocumentReference? login;

 final box = GetStorage();

  @override
  void initState() {
    login = FirebaseFirestore.instance.collection('login').doc(widget.userid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 60),
              Center(
                child: FutureBuilder(
                  future: login!.get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var data = snapshot.data;
                      TextEditingController firstNamecontroller =
                          TextEditingController(text: data!['FirstName']);
                      TextEditingController lastNamecontroller =
                          TextEditingController(text: data!['LastName']);
                      TextEditingController emailcontroller =
                          TextEditingController(text: data!['Email']);
                      TextEditingController passwcontroller =
                          TextEditingController(text: data!['password']);
                      return Column(
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey),
                              child: Image.network('${data['imagess']}')),
                          Text('${data['FirstName']}'),
                          Text('${data['LastName']}'),
                          Text('${data['Email']}'),
                          Text('${data['password']}'),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     showDialog(
                          //       context: context,
                          //       builder: (context) => Dialog(
                          //         child: Container(
                          //           height: 350,
                          //           color: Colors.white,
                          //           child: Column(
                          //             children: [
                          //               const SizedBox(height: 20),
                          //               TextField(
                          //                 controller: firstNamecontroller,
                          //                 decoration: const InputDecoration(
                          //                     labelText: "Firstname",
                          //                     enabledBorder: OutlineInputBorder(
                          //                         borderSide: BorderSide.none),
                          //                     focusedBorder: OutlineInputBorder(
                          //                         borderSide: BorderSide.none)),
                          //               ),
                          //               const SizedBox(height: 15),
                          //               TextField(
                          //                 controller: lastNamecontroller,
                          //                 decoration: const InputDecoration(
                          //                     labelText: "Lastname",
                          //                     enabledBorder: OutlineInputBorder(
                          //                         borderSide: BorderSide.none),
                          //                     focusedBorder: OutlineInputBorder(
                          //                         borderSide: BorderSide(
                          //                             color: Colors.black))),
                          //               ),
                          //               const SizedBox(height: 15),
                          //               ElevatedButton(
                          //                 child: const Text('update'),
                          //                 onPressed: () {
                          //                   login?.update({
                          //                     'FirstName':
                          //                         firstNamecontroller.text,
                          //                     'LastName':
                          //                         lastNamecontroller.text,
                          //                   });
                          //                 },
                          //               )
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     );
                          //   },
                          //   child: const Text('Edit'),
                          // ),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Icon(Icons.logout),
              //     TextButton(
              //       onPressed: () async {
              //         await googleSignIn.signOut();
              //         await box.erase();
              //         Get.to(const LoginScreen());
              //
              //       },
              //       child: const Text(
              //         'LOGOUT',
              //         style: TextStyle(
              //             color: Colors.red,
              //             fontWeight: FontWeight.bold,
              //             fontSize: 15),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
