import 'package:brl_task1/Pages/FirstPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Home Page',
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//       ),
//       home: HomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String> fetchData() async {
    // await Future.delayed(Duration(seconds: 1));
    return '';
  }

  //func parameters
  //BuildContext- info about loc of widget: access/navigate/display
  void showThankYouMessage(BuildContext context) {
    showDialog(
      context: context,
      //callback func def UI and content of dialog
      builder: (context) {
        return AlertDialog(
          title: Text("Thank You"),
          content: Text("You have been successfully logged out."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image_vortex.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.indigo.withOpacity(0.5),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //expected string data in future
              FutureBuilder<String>(
                future: fetchData(),
                //whether opn is ongoing, completed or error
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return Text(
                      'Today Is A Good Day!',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  showThankYouMessage(context);
                },
                child: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// stl - stful
// no change in appearance or behaviour - update acc
// immutable - mutable(changing)
// static content - dynamic
