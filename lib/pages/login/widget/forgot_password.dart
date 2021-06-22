import 'package:calculadora_imc/libs/auth.dart';
import 'package:calculadora_imc/pages/home/home_page.dart';
import 'package:calculadora_imc/pages/login/widget/input_text_login.dart';
import 'package:calculadora_imc/utils/responsive.dart';
import 'package:calculadora_imc/utils/extras.dart';
import 'package:calculadora_imc/utils/app_colors.dart';
import 'package:calculadora_imc/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordForm extends StatefulWidget {
  final VoidCallback onGoToLogin;
  const ForgotPasswordForm({Key key, @required this.onGoToLogin})
      : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  bool _sent = false;
  final GlobalKey<InputTextLoginState> _emailkey = GlobalKey();

  void _goTo(BuildContext context, FirebaseUser user) {
    if (user != null) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      print("Login failed");
    }
  }

  Future<void> _submit() async {
    final String email = _emailkey.currentState.value;
    final bool emailOk = _emailkey.currentState.isOk;

    if (emailOk) {
      final isOk =
          await Auth.instance.sendResetEmailLink(context, email: email);
      setState(() {
        _sent = isOk;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Align(
      alignment: Alignment.center,
      child: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Restablecer Contraseña",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 25,
                  fontFamily: 'Wallpoet',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: responsive.ip(2)),
              _sent
                  ? Text("Correo Enviado Revise Su Bandeja De Entrada")
                  : InputTextLogin(
                      key: _emailkey,
                      iconPath: 'assets/pages/login/email.svg',
                      placeholder: "Correo Electronico",
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) => Extras.isValidEmail(text),
                    ),
              SizedBox(height: responsive.ip(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: widget.onGoToLogin,
                    child: Text("<- Volver"),
                  ),
                  if (!_sent) ...[
                    SizedBox(width: 10),
                    RoundedButton(
                      label: "Restablecer",
                      onPressed: this._submit,
                    ),
                  ]
                ],
              ),
              SizedBox(height: responsive.ip(2)),
            ],
          ),
        ),
      ),
    );
  }
}
