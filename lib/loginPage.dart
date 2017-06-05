import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart' as main;

class LoginApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();


   _logInAnonymously() async {
    FirebaseUser user = await auth.signInAnonymously();
    assert(user != null);
    assert(user == auth.currentUser);
    assert(user.isAnonymous);
    assert(!user.isEmailVerified);
    if (Platform.isIOS) {
      // Anonymous auth doesn't show up as a provider on iOS
      assert(user.providerData.length == 0);
    } else if (Platform.isAndroid) {
      // Anonymous auth does show up as a provider on Android
      assert(user.providerData.length == 1);
      assert(user.providerData[0].providerId == 'firebase');
      assert(user.providerData[0].uid != null);
      assert(user.providerData[0].displayName == null);
      assert(user.providerData[0].photoUrl == null);
      assert(user.providerData[0].email == null);
    }
    main.connectedUser = user;
    print("this user is signed in : $user");
    main.isLoggedIn = true;
    Navigator.pushReplacementNamed(context, "/");
  }


  _logWithGoogle() async {
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    assert(user.email != null);
    assert(user.displayName != null);

    print("this user is signed in : $user");
    main.connectedUser = user;
    main.isLoggedIn = true;
    Navigator.pushReplacementNamed(context, "/");
  }

  //TODO
   _logWithFacebook()  {
    showDialog(context: context, child:
    new AlertDialog(
      title: new Text("Coming soon"),
      content: new Text("Facebook auth will come soon !"),
    )
    );
  }

  //TODO
   _logWithPhone()  {
    showDialog(context: context, child:
      new AlertDialog(
        title: new Text("Coming soon"),
        content: new Text("Phone auth will come soon !"),
      )
    );
  }

  //TODO
   _logWithTwitter()  {
    showDialog(context: context, child:
    new AlertDialog(
      title: new Text("Coming soon"),
      content: new Text("Twitter auth will come soon !"),
    )
    );
  }

   _logInWithEmailAndPassword() async {
     showDialog(context: context, child:
     new AlertDialog(
       title: new Text("Coming soon"),
       content: new Text("Email and pwd auth will come soon !"),
     )
     );
  }


  Widget buildTile(Image image, String label, loginFunction) {
    Color color = Theme.of(context).primaryColor;
    return new InkWell(
      onTap: loginFunction,
      child :
        new Column(
          children: [
            image,
            new Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: new Text(
                label,
                style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ],
        )
    );

  }

  Widget buildIconTile(Icon icon, String label, loginFunction) {
    Color color = Theme.of(context).primaryColor;
    return new InkWell(
      onTap: loginFunction,
      child : new Column(
        children: [
          icon,
          new Container(
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    print("building login page");

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sign up / Log In"),
        centerTitle: true,
      ),
      body:
      new Center (
        child :
          new GridView(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                //TODO  : use SVG images when Flutter will allow
                buildTile(new Image.asset("images/google-logo.png"), 'Log in with Google', _logWithGoogle),
                buildTile(new Image.asset("images/facebook-logo.png"), 'Log in with Facebook', _logWithFacebook),
                buildTile(new Image.asset("images/twitter-logo.png"), 'Log in with twitter', _logWithTwitter),
                buildIconTile(new Icon(Icons.phone), "Log in with Phone", _logWithPhone),
                buildIconTile(new Icon(Icons.mail_outline), "Log in with email", _logInWithEmailAndPassword),
                buildIconTile(new Icon(Icons.account_circle), "Log anonymously", _logInAnonymously),
              ]
          ),
      )
    );
  }
}
