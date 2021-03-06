import 'package:calculadora_imc/libs/auth.dart';
import 'package:calculadora_imc/pages/home/home_page.dart';
import 'package:calculadora_imc/pages/login/widget/input_text_login.dart';
import 'package:calculadora_imc/utils/responsive.dart';
import 'package:calculadora_imc/utils/app_colors.dart';
import 'package:calculadora_imc/utils/dialogs.dart';
import 'package:calculadora_imc/utils/extras.dart';
import 'package:calculadora_imc/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterForm extends StatefulWidget {
  final Alignment alignment;
  final VoidCallback onGoToLogin;

  const RegisterForm(
      {Key key,
      @required this.onGoToLogin,
      this.alignment = Alignment.bottomCenter})
      : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _agree = false;
  final GlobalKey<InputTextLoginState> _usernamekey = GlobalKey();
  final GlobalKey<InputTextLoginState> _emailkey = GlobalKey();
  final GlobalKey<InputTextLoginState> _passwordkey = GlobalKey();
  final GlobalKey<InputTextLoginState> _vpasswordkey = GlobalKey();

  void _goTo(FirebaseUser user) {
    if (user != null) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      print("Error Al Registrarse");
    }
  }

  _submit() async {
    final String username = _usernamekey.currentState.value;
    final String email = _emailkey.currentState.value;
    final String password = _passwordkey.currentState.value;
    final String vpassword = _vpasswordkey.currentState.value;

    final bool usernameOk = _usernamekey.currentState.isOk;
    final bool emailOk = _emailkey.currentState.isOk;
    final bool passwordOk = _passwordkey.currentState.isOk;
    final bool vpasswordOk = _vpasswordkey.currentState.isOk;

    if (usernameOk && emailOk && passwordOk && vpasswordOk) {
      if (_agree) {
        final FirebaseUser user = await Auth.instance.signUp(
          context,
          username: username,
          email: email,
          password: password,
        );

        _goTo(user);
      } else {
        Dialogs.alert(context,
            description: "Terminos y Condiciones No Aceptados");
      }
    } else {
      Dialogs.alert(context,
          description: "Las Credenciales Ingresadas Son Incorrectos");
    }

    print(username);
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Align(
      alignment: widget.alignment,
      child: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Nueva Cuenta",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Benne',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: responsive.ip(2)),
              InputTextLogin(
                key: _usernamekey,
                iconPath: 'assets/pages/login/profile.svg',
                placeholder: "Usuario",
                validator: (text) {
                  return text.trim().length > 0;
                },
              ),
              SizedBox(height: responsive.ip(2)),
              InputTextLogin(
                key: _emailkey,
                iconPath: 'assets/pages/login/email.svg',
                placeholder: "Correo Electronico",
                keyboardType: TextInputType.emailAddress,
                validator: (text) => Extras.isValidEmail(text),
              ),
              SizedBox(height: responsive.ip(2)),
              InputTextLogin(
                key: _passwordkey,
                iconPath: 'assets/pages/login/password.svg',
                placeholder: "Contrase??a",
                obscureText: true,
                validator: (text) {
                  _vpasswordkey.currentState?.checkValidation();
                  return text.trim().length >= 6;
                },
              ),
              SizedBox(height: responsive.ip(2)),
              InputTextLogin(
                key: _vpasswordkey,
                iconPath: 'assets/pages/login/password.svg',
                placeholder: "Verificar Contrase??a",
                obscureText: true,
                validator: (text) {
                  return text.trim().length >= 6 &&
                      _vpasswordkey.currentState.value ==
                          _passwordkey.currentState.value;
                },
              ),
              SizedBox(height: responsive.ip(2)),
              DefaultTextStyle(
                style: TextStyle(
                    fontSize: responsive.ip(1.3),
                    color: Theme.of(context).textTheme.subtitle.color),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Checkbox(
                        value: _agree,
                        checkColor: Colors.white,
                        onChanged: (isChecked) {
                          setState(() {
                            _agree = isChecked;
                          });
                        }),
                    Text(
                      "Acepto Las ",
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Condiciones Del Servicio",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      " & ",
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Politica De Privacidad",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: responsive.ip(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: widget.onGoToLogin,
                    child: Text(
                      "<- Volver",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  RoundedButton(
                    label: "Registrarse",
                    onPressed: _submit,
                  ),
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
