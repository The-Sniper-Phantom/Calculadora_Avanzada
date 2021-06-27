import 'package:calculadora_imc/libs/auth.dart';
import 'package:calculadora_imc/widget/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  static final routeName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AccountScreen> {
  Widget _getAlias(String displayName) {
    final List<String> tmp = displayName.split(" ");

    String alias = "";
    if (tmp.length > 0) {
      alias = tmp[0][0];
      if (tmp.length == 2) {
        alias += tmp[1][0];
      }
    }

    return Center(
      child: Text(
        alias,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: FutureBuilder<FirebaseUser>(
            future: Auth.instance.user,
            builder: (BuildContext _, AsyncSnapshot<FirebaseUser> snapshot) {
              if (snapshot.hasData) {
                final user = snapshot.data;

                return ListView(
                  children: <Widget>[
                    SizedBox(height: 30),
                    CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 40,
                        child: user.photoUrl != null
                            ? ClipOval(
                                child: Image.network(
                                  user.photoUrl,
                                  width: 74,
                                  height: 74,
                                  fit: BoxFit.contain,
                                ),
                              )
                            : _getAlias(user.displayName)),
                    SizedBox(height: 10),
                    Text(
                      user.displayName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.email,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 20),
                    RoundedButton(
                      backgroundColor: Colors.black,
                      label: "Sign Out",
                      onPressed: () {
                        Auth.instance.logOut(context);
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Network error"),
                );
              }

              return Center(child: CupertinoActivityIndicator());
            },
          ),
        ),
      ),
    );
  }
}
