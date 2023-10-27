import 'package:brl_task1/Pages/HomePage.dart';
import 'package:brl_task1/Pages/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // void checkValues() {
  //   String email=emailController.text.trim();
  //   String password=passwordController.text.trim();
  //
  //   if(email == "" || password==""){
  //     print("Please fill this field");
  //   }
  //   login(email, password);
  // }

  // void login(String email, String password) async{
  //   UserCredential? credential;
  //   credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  //
  //   try{
  //     credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch(ex) {
  //     print(ex.message.toString());
  //   }
  //
  //   if(credential!=null)
  //     {
  //       String uid=credential.user!.uid;
  //       DocumentSnapshot userData=await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //       UserModel userModel=UserModel.fromMap(userData.data() as Map<String,dynamic>);
  //       //Home page
  //       print("Login Successful!");
  //     }
  // }

  Future<void> login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      }
    } catch (e) {
      print('Error: $e');
    }
  }

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
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.w800),
                          decoration: InputDecoration(
                              icon: Icon(Icons.mail),
                              // hintText: 'What do people call you?',
                              labelText: 'Email *'),
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
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                          child: Text('Log In'),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // builder: (context) => WillPopScope(
                                  //   onWillPop: () async {
                                  //     Navigator.popUntil(context, FirstPage() as RoutePredicate);
                                  //     return false;
                                  //   },
                                  //   child: ForgotPassword(title: 'Forgot Password',),
                                  // ),
                                  builder: (context) =>ForgotPassword(title: 'Forgot Password')
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/google.png'),
                                height: 45,
                                width: 45,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Sign Up With Google'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
