//import 'package:electchain/controllers/auth_controller.dart';
import 'package:Electchain/controllers/controllers.dart';
import 'package:Electchain/models/models.dart';
import 'package:Electchain/screens/screens.dart';
import 'package:Electchain/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ElectChainVoter extends StatefulWidget {
  @override
  _ElectChainState createState() => _ElectChainState();
}

class _ElectChainState extends State<ElectChainVoter> {
  final GlobalKey _scafflofKey = GlobalKey();
  TextEditingController _electionAccessCodeController = TextEditingController();
 
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50.0),
                Text(
                  "ENTER A VOTE CODE",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  height: 50.0,
                  margin: const EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(18.0)),
                  child: Form(
                    // key: GlobalKey<FormState>(),
                    child: TextFormField(
                      controller: _electionAccessCodeController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        hintText: "Enter the election code",
                        hintStyle: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.normal),
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0, left: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.indigo, Colors.blue])),
                  child: TextButton.icon(
                      //height: 40.0,
                      onPressed: () async {
                        FirebaseFirestore _firestore =
                            FirebaseFirestore.instance;
                        List<ElectionModel> allElections = <ElectionModel>[];
                        var usersQuerySnap =
                            _firestore.collection("users").get();
                        usersQuerySnap.then((usersQuery) {
                          var _allUsers = usersQuery.docs
                              .map((_user) => Get.find<UserController>()
                                  .fromDocumentSnapshot(_user))
                              .toList();

                          _allUsers.forEach((user) {
                            print(user.email);
                            _firestore
                                .collection("users")
                                .doc(user.id)
                                .collection("elections")
                                .get()
                                .then((_userElectionsSnap) {
                              var userElections = _userElectionsSnap.docs
                                  .map((_election) =>
                                      Get.put(ElectionController())
                                          .fromDocumentSnapshot(_election))
                                  .toList();
                              userElections.forEach((element) {
                                allElections.add(element);
                              });
                              allElections.forEach((election) {
                                if (election.accessCode ==
                                    _electionAccessCodeController.text) {
                                  print(
                                      "Election found ${election.accessCode}");
                                  Get.to(CastVote(), arguments: election);
                                } else {
                                  print("Election not found");
                                }
                              });
                            });
                          });
                          //print("All elections $allElections");
                        });
                      },
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Validate",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(),
     // bottomNavigationBar: BottomNavUser(),
    );
  }
}
