import 'package:calculadora_imc/pages/login/widget/forgot_password.dart';
import 'package:calculadora_imc/pages/login/widget/login_form.dart';
import 'package:calculadora_imc/pages/login/widget/register_form.dart';
import 'package:calculadora_imc/pages/login/widget/welcome.dart';
import 'package:calculadora_imc/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:after_layout/after_layout.dart';

class LoginFormType {
  static final int login = 0;
  static final int register = 1;
  static final int forgotPassword = 2;
}

class LoginPage extends StatefulWidget {
  static final routeName = 'login';
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AfterLayoutMixin {
  PageController _pageController =
      PageController(initialPage: LoginFormType.login);
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _switchForm(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  Widget _getForms(bool isLandscape) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        LoginForm(
          alignment: isLandscape ? Alignment.center : Alignment.bottomCenter,
          onGoToRegister: () {
            _switchForm(LoginFormType.register);
          },
          onGoToForgotPassword: () {
            _switchForm(LoginFormType.forgotPassword);
          },
        ),
        RegisterForm(
          alignment: isLandscape ? Alignment.center : Alignment.bottomCenter,
          onGoToLogin: () {
            _switchForm(LoginFormType.login);
          },
        ),
        ForgotPasswordForm(
          onGoToLogin: () {
            _switchForm(LoginFormType.login);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
            child: OrientationBuilder(builder: (_, Orientation orientation) {
              if (orientation == Orientation.portrait) {
                return SingleChildScrollView(
                  child: Container(
                    height: responsive.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Welcome(),
                        Expanded(
                          child: _getForms(false),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          height: responsive.height,
                          child: Center(
                            child: Welcome(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          height: responsive.height,
                          child: _getForms(true),
                        ),
                      ),
                    ),
                  ],
                );
              }
            })),
      ),
    );
  }
}
