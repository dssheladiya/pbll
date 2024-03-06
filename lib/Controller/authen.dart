// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:pbl/View/AuthScreen/signup.dart';
// import 'package:pbl/View/HomeScreen/home_bar.dart';
// import 'package:pbl/View/HomeScreen/splash_screen.dart';
//
// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();
//
//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;
//   var verificationId = "".obs;
//
//   @overrid
//   void onReady() {
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, _setInitialScreen);
//   }
//
//   _setInitialScreen(User? user) {
//     user == null
//         ? Get.offAll(() => const SplashScreen())
//         : Get.offAll(() => const SignUpScreen());
//   }
//
//   Future<void> createUserWithAndPassword(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       firebaseUser.value != null
//           ? Get.offAll(() => const HomeScreen(
//                 userid: '',
//               ))
//           : Get.offAll(() => const SplashScreen());
//     } on FirebaseAuthException catch (e) {}
//   }
//
//   Future<void> loginUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {}
//   }
//
//   Future<void> logout() async => await _auth.signOut();
//
//   Future<void> phoneAuthentication(String phoneNo) async {
//     await _auth.verifyPhoneNumber(
//       phoneNumber: phoneNo,
//       verificationCompleted: (credential) async {
//         await _auth.signInWithCredential(credential);
//       },
//       codeSent: (verificationId, resendToken) {
//         this.verificationId.value = verificationId;
//       },
//       codeAutoRetrievalTimeout: (verificationId) {
//         this.verificationId.value = verificationId;
//       },
//       verificationFailed: (e) {
//         if (e.code == "invalid-phone-numer") {
//           Get.snackbar('Error', 'The provided number oi not valid');
//         } else {
//           Get.snackbar('Error', 'Something went wrong. try again');
//         }
//       },
//     );
//   }
//
//   Future<bool> verifyOTP(String otp) async {
//     var credential = await _auth.signInWithCredential(
//         PhoneAuthProvider.credential(
//             verificationId: verificationId.value, smsCode: otp));
//     return credential.user != null ? true : false;
//   }
// }
