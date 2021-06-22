import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  String result;
  String msg;
  String des;

  ResultScreen(this.result, this.msg, this.des);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F2E3A),
      appBar: AppBar(
        title: Text("RESULTADOS"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                "Tus Resultados",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
          Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFF24232F),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.result,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      widget.msg,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      widget.des,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Color(0xFF1DE9B6),
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                "Recalcular",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
