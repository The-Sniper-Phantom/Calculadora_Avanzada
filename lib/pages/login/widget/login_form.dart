import 'package:calculadora_imc/libs/auth.dart';
import 'package:calculadora_imc/pages/home/home_page.dart';
import 'package:calculadora_imc/pages/login/widget/input_text_login.dart';
import 'package:calculadora_imc/utils/responsive.dart';
import 'package:calculadora_imc/utils/extras.dart';
import 'package:calculadora_imc/widget/circle_button.dart';
import 'package:calculadora_imc/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginForm extends StatefulWidget {
  final Alignment alignment;
  final VoidCallback onGoToRegister, onGoToForgotPassword;

  const LoginForm(
      {Key key,
      @required this.onGoToRegister,
      @required this.onGoToForgotPassword,
      this.alignment = Alignment.bottomCenter})
      : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<InputTextLoginState> _emailkey = GlobalKey();
  final GlobalKey<InputTextLoginState> _passwordkey = GlobalKey();

  void _goTo(FirebaseUser user) {
    if (user != null) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      print("Login failed");
    }
  }

  Future<void> _submit() async {
    final String email = _emailkey.currentState.value;
    final String password = _passwordkey.currentState.value;

    final bool emailOk = _emailkey.currentState.isOk;
    final bool passwordOk = _passwordkey.currentState.isOk;

    if (emailOk && passwordOk) {
      final FirebaseUser user = await Auth.instance
          .loginByPassword(context, email: email, password: password);

      _goTo(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Align(
      alignment: widget.alignment,
      child: SafeArea(
        top: false,
        child: Container(
          width: 330,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InputTextLogin(
                key: _emailkey,
                iconPath: 'assets/pages/login/email.svg',
                placeholder: "Correo Electronico",
                keyboardType: TextInputType.emailAddress,
                validator: (text) => Extras.isValidEmail(text),
              ),
              SizedBox(
                height: responsive.ip(2),
              ),
              InputTextLogin(
                key: _passwordkey,
                iconPath: 'assets/pages/login/password.svg',
                placeholder: "Contraseña",
                obscureText: true,
                validator: (text) {
                  return text.trim().length >= 6;
                },
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Olvide mi contraseña",
                    style: TextStyle(fontFamily: 'Oranienbaum'),
                  ),
                  onPressed: widget.onGoToForgotPassword,
                ),
              ),
              SizedBox(
                height: responsive.ip(2),
              ),
              RoundedButton(
                label: "Iniciar",
                onPressed: this._submit,
              ),
              SizedBox(
                height: responsive.ip(3.3),
              ),
              Text("Iniciar Sesion Con:"),
              SizedBox(
                height: responsive.ip(1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleButton(
                    iconPath: 'assets/pages/login/facebook.svg',
                    size: 50,
                    backgroundColor: Color(0xff448AFF),
                    onPressed: () async {
                      final user = await Auth.instance.facebook(context);
                      _goTo(user);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleButton(
                    iconPath: 'assets/pages/login/google.svg',
                    size: 50,
                    backgroundColor: Color(0xffFF1744),
                    onPressed: () async {
                      final user = await Auth.instance.google(context);
                      _goTo(user);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: responsive.ip(2.7),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("¿No tiene una cuenta?"),
                  CupertinoButton(
                    child: Text(
                      "Registrarse",
                      style: TextStyle(
                        fontFamily: 'Oranienbaum',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: widget.onGoToRegister,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
