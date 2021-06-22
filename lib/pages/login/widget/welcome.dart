import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/responsive.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: LayoutBuilder(
        builder: (_, contraints) {
          return Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: contraints.maxHeight * 0.8,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 4,
                        width: contraints.maxWidth,
                        decoration: new BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.orangeAccent,
                              Colors.yellow
                            ],
                            stops: [0.3, 0.3, 0.7],
                            begin: FractionalOffset.topRight,
                            end: FractionalOffset.bottomLeft,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "¡Bienvenido/Welcome!",
                        style: TextStyle(
                          fontSize: responsive.ip(2.5),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Benne',
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/pages/login/clouds.svg',
                    width: contraints.maxWidth,
                    height: contraints.maxHeight * 0.8,
                  ),
                ),
                Positioned(
                  top: contraints.maxHeight * 0.145,
                  left: 5,
                  child: SvgPicture.asset(
                    'assets/pages/login/woman.svg',
                    width: contraints.maxWidth * 0.2,
                  ),
                ),
                Positioned(
                  top: contraints.maxHeight * 0.23,
                  right: 5,
                  child: SvgPicture.asset(
                    'assets/pages/login/men.svg',
                    width: contraints.maxWidth * 0.2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
