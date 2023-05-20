import 'package:Electchain/screens/screens.dart';
import 'package:flutter/material.dart';
import 'screens.dart';

class InitialRoute extends StatelessWidget {
  InitialRoute({key}) : super(key: key);

  final TextStyle myNormalStyle = TextStyle(
      fontSize: 20.0, color: Colors.indigo[50], fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo[100],
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/icons/logo.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('CHOOSE YOUR LEVEL',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(primary: Colors.indigo[400]),
                    child: Text(
                      'VOTER',
                      style: myNormalStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(primary: Colors.indigo[400]),
                    child: Text(
                      'ADMIN',
                      style: myNormalStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(primary: Colors.indigo[400]),
                    child: Text(
                      'SUPERADMIN',
                      style: myNormalStyle,
                    ),
                  ),
                ),
              ]),
        ));
  }
}
