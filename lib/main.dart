import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: tik_tak(),
  ));
}

class tik_tak extends StatefulWidget {
  const tik_tak({Key? key}) : super(key: key);

  @override
  State<tik_tak> createState() => _tik_takState();
}

class _tik_takState extends State<tik_tak> {
  String p1 = "O";
  String p2 = "X";
  String msj = "Game Is Running";
  // List<String> l = [" "," "," "," "," "," "," "," "," "];
  List<String> l = List.filled(9, "");

  int cnt = 0;
  int checkwin = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tik Tak Toi"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Center(
                child: Text(
                  msj,
                  style: TextStyle(fontSize: 30),
                ),
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                          children: [abc(0), abc(1), abc(2)],
                        )),
                    Expanded(
                        child: Row(
                          children: [abc(3), abc(4), abc(5)],
                        )),
                    Expanded(
                        child: Row(
                          children: [abc(6), abc(7), abc(8)],
                        ))
                  ],
                ),
              )),
          Expanded(
              child: InkWell(
                onTap: () {
                  l = List.filled(9, "");
                  msj = "Game Is Running";
                  cnt = 0;
                  checkwin = 0;
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.blue),
                  child: Center(
                    child: Text(
                      "Restart",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget abc(int i) {
    return Expanded(
        child: InkWell(
          onTap: () {
            if (l[i] == "" && checkwin == 0) {
              if (cnt % 2 == 0) {
                l[i] = p1;
              } else {
                l[i] = p2;
              }
              cnt++;
              win();
            }
            setState(() {});
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.blue),
            child: Center(
              child: Text(
                l[i],
                style: TextStyle(fontSize: 100, color: Colors.white),
              ),
            ),
          ),
        ));
  }

  win(){
    if((l[0] == p1 && l[1] == p1 && l[2] == p1) ||
        (l[3] == p1 && l[4] == p1 && l[5] == p1) ||
        (l[6] == p1 && l[7] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[3] == p1 && l[6] == p1) ||
        (l[1] == p1 && l[4] == p1 && l[7] == p1) ||
        (l[2] == p1 && l[5] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[4] == p1 && l[8] == p1) ||
        (l[2] == p1 && l[4] == p1 && l[6] == p1)){
      msj = "$p1 is Winner";
      checkwin = 1;
    }else if((l[0] == p2 && l[1] == p2 && l[2] == p2) ||
        (l[3] == p2 && l[4] == p2 && l[5] == p2) ||
        (l[6] == p2 && l[7] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[3] == p2 && l[6] == p2) ||
        (l[1] == p2 && l[4] == p2 && l[7] == p2) ||
        (l[2] == p2 && l[5] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[4] == p2 && l[8] == p2) ||
        (l[2] == p2 && l[4] == p2 && l[6] == p2)){
      msj = "$p2 is Winner";
      checkwin = 1;
    }
  }
}
