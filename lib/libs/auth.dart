import 'package:calculadora_imc/pages/login/login_page.dart';
import 'package:calculadora_imc/utils/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/services.dart';

class Auth {
  Auth._internal();
  static Auth get instance => Auth._internal();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> get user async {
    return (await _firebaseAuth.currentUser());
  }

  Future<FirebaseUser> loginByPassword(BuildContext context,
      {@required String email, @required String password}) async {
    ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      progressDialog.dismiss();

      if (result.user != null) {
        return result.user;
      }
      return null;
    } on PlatformException catch (e) {
      progressDialog.dismiss();
      String message = "";
      if (e.code == "ERROR_USER_NOT_FOUND") {
        message = "E-MAIL NO REGISTRADO";
      } else {
        message = e.message;
      }
      Dialogs.alert(context, title: "ERROR", description: message);
      return null;
    }
  }

  Future<FirebaseUser> facebook(BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();

      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == 200) {
        print("Facebook login ok");
        /* final userData = await FacebookAuth.instance.getUserData();
        print(userData);
 */
        final AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: result.accessToken.token);

        final AuthResult authResult =
            await _firebaseAuth.signInWithCredential(credential);

        final FirebaseUser user = authResult.user;
        print("facebook username: ${user.displayName}");
        progressDialog.dismiss();

        return user;
      } else if (result.status == 403) {
        print("Facebook login cancelled");
      } else {
        print("Facebook login failed");
      }
      progressDialog.dismiss();
      return null;
    } catch (e) {
      print(e);
      progressDialog.dismiss();
      return null;
    }
  }

  Future<FirebaseUser> google(BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication authentication =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken);

      final AuthResult result =
          await _firebaseAuth.signInWithCredential(credential);

      final FirebaseUser user = result.user;
      progressDialog.dismiss();

      return user;
    } catch (e) {
      print(e);
      progressDialog.dismiss();
      return null;
    }
  }

  Future<void> logOut(BuildContext context) async {
    final String providerId = (await user).providerData[0].providerId;
    print("providerID $providerId");
    switch (providerId) {
      case "facebook.com":
        await FacebookAuth.instance.logOut();
        break;
      case "google.com":
        await _googleSignIn.signOut();
        break;
      case "password":
        break;
      case "phone.com":
        break;
    }
    await _firebaseAuth.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (_) => false);
  }

  Future<FirebaseUser> signUp(BuildContext context,
      {@required String username,
      @required String email,
      @required String password}) async {
    ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final AuthResult result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        final UserUpdateInfo userUpdateInfo = UserUpdateInfo();
        userUpdateInfo.displayName = username;
        await result.user.updateProfile(userUpdateInfo);
        progressDialog.dismiss();
        return result.user;
      }

      progressDialog.dismiss();

      return null;
    } on PlatformException catch (e) {
      String message = "Error Desconocido";
      if (e.code == "ERROR_EMAIL_ALREADY_IN_USE") {
        message = e.message;
      } else if (e.code == "ERROR_WEAK_PASSWORD") {
        message = e.message;
      }
      print(e);
      progressDialog.dismiss();
      Dialogs.alert(context, title: "ERROR", description: message);
      return null;
    }
  }

  Future<bool> sendResetEmailLink(BuildContext context,
      {@required String email}) async {
    ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      progressDialog.dismiss();
      return true;
    } on PlatformException catch (e) {
      print(e);
      progressDialog.dismiss();
      Dialogs.alert(context, title: "ERROR", description: e.message);
      return false;
    }
  }
}
