import 'package:brl_task1/Models/UserModel.dart';
import 'package:brl_task1/Pages/FirstPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Models/FirebaseHelper.dart';
import 'Pages/HomePage.dart';
import 'firebase_options.dart';

//having asynchronous func's- time alter based in I/O
void main() async{
  //initialise flutter framework
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  User? currentUser=FirebaseAuth.instance.currentUser;
  if(currentUser != null) {
    UserModel? thisUserModel = await FirebaseHelper.getUserModelById(
        currentUser.uid);
    if (thisUserModel != null) {
      runApp(
          MyAppLoggedIn(userModel: thisUserModel, firebaseUser: currentUser));
    }
    else {
      runApp(MyApp());
    }
  }
  else{
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

// ALREADY LOGIN
class MyAppLoggedIn extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;

  const MyAppLoggedIn({super.key, required this.userModel, required this.firebaseUser});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      //userModel: userModel,firebaseUser: firebaseUser
    );
  }
}
