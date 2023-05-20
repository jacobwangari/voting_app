import 'package:Electchain/controllers/auth_controller.dart';
import 'package:Electchain/screens/screens.dart';
import 'package:Electchain/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ElectChainAdmin extends StatefulWidget {
  @override
  _ElectChainState createState() => _ElectChainState();
}

class _ElectChainState extends State<ElectChainAdmin> {
  final GlobalKey _scafflofKey = GlobalKey();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      key: _scafflofKey,
      appBar: AppBar(
        //  leading: IconButton(
        //   icon: Icon(Icons.dashboard),
        //  onPressed: () {
        //     Scaffold.of(context).openDrawer();
        // }),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.indigo, Colors.blue])),
        ),
        elevation: 0.0,
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'ELECT',
                style: GoogleFonts.gugi(
                    color: Colors.pink[300],
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'CHAIN',
                style: GoogleFonts.gugi(
                    fontSize: 18.0, fontWeight: FontWeight.bold))
          ]),
        ),
        actions: [
          IconButton(
              tooltip: 'logout',
              color: Colors.white,
              icon: Icon(Icons.logout),
              onPressed: () {
                Get.find<AuthController>().signOut();
                Get.snackbar(
                    'SIGN OUT', 'You have been successfully signed out');
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(AuthScreen()),
                    child: ActionBox(
                      action: "Register Voters",
                      description: "Register a new voter",
                      image: Icons.group_add,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(NewVote());
                    },
                    child: ActionBox(
                      action: "Create Election",
                      description: "Create a new Election",
                      image: Icons.how_to_vote,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => Get.to(UserElections()),
                    child: ActionBox(
                      action: "My Elections",
                      description: "View your owned Elections",
                      image: Icons.ballot,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
      //bottomNavigationBar:BottomNavAdmin(),

      
    );
  }
}
