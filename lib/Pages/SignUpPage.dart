import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:brl_task1/Pages/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

// import 'package:google_sign_in/google_sign_in.dart';
// GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
//   'email',
//   'https://www.googleapis.com/auth/contacts.readonly'
// ]);

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController uidController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  get uid => null;
  get email => null;
  get password => null;

  // void checkValues() {
  //   String uid=uidController.text.trim();
  //   String email=emailController.text.trim();
  //   String password=passwordController.text.trim();
  //
  //   if(email == "" || uid=="" || password==""){
  //     print("Please fill this field");
  //   }
  //   signUp(uid, email, password);
  // }

  void signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        await userCredential.user!.sendEmailVerification();

        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
      }
    } catch (e) {
      print('Error: $e');
    }
    // try {
    //   UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );
    //
    //   await credential.user?.sendEmailVerification();
    //
    //   if (credential.user!.emailVerified) {
    //     String uid = credential.user!.uid;
    //     UserModel newUser = UserModel(
    //       uid: uid,
    //       email: email,
    //     );
    //     await FirebaseFirestore.instance.collection("users").doc(uid).set(newUser.toMap());
    //     print("New User Created and Email Verified");
    //   }
    //   else {
    //     print("Email verification failed");
    //   }
    // } on FirebaseAuthException catch (ex) {
    //   print(ex.code.toString());
    // }
  }


  // late GoogleSignInAccount _currentUser;
  // void initState() {
  //   super.initState();
  //   _googleSignIn.onCurrentUserChanged.listen((account) {
  //     setState(() {
  //       _currentUser = account!;
  //     });
  //     if (_currentUser != null) {
  //       print("Done");
  //     }
  //   });
  //   _googleSignIn.signInSilently();
  // }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image_vortex.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: uidController,
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w800),
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person),
                                  hintText: 'What do people call you?',
                                  labelText: 'Username *'),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: emailController,
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w800),
                              decoration: InputDecoration(
                                  icon: Icon(Icons.mail), labelText: 'Email *'),

                              // onSaved: (String? value) {
                              // },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                String pattern =
                                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                                RegExp regex = RegExp(pattern);
                                if (!regex.hasMatch(value)) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: passwordController,
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w800),
                              decoration: InputDecoration(
                                  icon: Icon(Icons.password),
                                  labelText: 'Password *'),

                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                String pattern =
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                RegExp regex = RegExp(pattern);
                                if (!regex.hasMatch(value)) {
                                  return "Weak Password\n\nMust contain:\n*Uppercase\n*Lowercase\n*Digit\n*Special Symbol !@#&*~\ ";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => HomePage()),
                                // );
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.indigo,
                                        behavior: SnackBarBehavior.floating,
                                        // showCloseIcon: true,
                                        // closeIconColor: Colors.white,
                                        dismissDirection:
                                        DismissDirection.startToEnd,
                                        content: Text('Processing Data')),
                                  );
                                  signUp();
                                }
                              },
                              child: Text('Sign Up'),
                            ),
                            TextButton(
                                onPressed: () {
                                    if(email == "" || uid=="" || password==""){
                                       print("Please fill this field");
                                    }
                                    else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginPage()),
                                      );
                                    };
                                },
                                child: Text("Already have an account? Login")),

                            // SEARCH
                            // StreamBuilder(stream: FirebaseFirestore.instance.collection("users").where("email",isEqualTo: emailController.text).snapshots(),
                            // builder: (context,snapshot){
                            //   if(snapshot.connectionState == ConnectionState.active) {
                            //     if(snapshot.hasData)
                            //       {
                            //         QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;
                            //
                            //         if(dataSnapshot.docs.length > 0){
                            //         Map<String,dynamic> userMap= dataSnapshot.docs[0].data() as Map<String,dynamic>;
                            //         UserModel searchUser = UserModel.fromMap(userMap);
                            //
                            //         return ListTile(
                            //           // on tap navigator to home
                            //           title: Text(searchUser.uid!),
                            //           subtitle: Text(searchUser.email!),
                            //         );}
                            //         else{
                            //           return Text("No results found");
                            //         }
                            //       }
                            //     else if(snapshot.hasError)
                            //       {
                            //           return Text("An Error Occurred!");
                            //       }
                            //     else {
                            //       return Text("No result found");
                            //     }
                            //   }
                            // },
                            // ),
                          ],
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/google.png'),height: 45,width: 45,),

                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Sign Up With Google'),),],),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

