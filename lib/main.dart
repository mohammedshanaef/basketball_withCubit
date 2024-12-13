import 'package:flutter/material.dart';

enum Team { A, B }

void main() {
  runApp(BasketApp());
}

class BasketApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<Team, int> teamPoints = {
    Team.A: 0,
    Team.B: 0,
  };

  void incrementPoints(Team team, int points) {
    setState(() {
      teamPoints[team] = (teamPoints[team] ?? 0) + points;
    });
  }

  void resetPoints() {
    setState(() {
      teamPoints[Team.A] = 0;
      teamPoints[Team.B] = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const  Text(
          "Points Counter",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                const  Text(
                    "Team A",
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    "${teamPoints[Team.A]}",
                    style: TextStyle(fontSize: 150),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () => incrementPoints(Team.A, 1),
                    child: Text(
                      "Add 1 Point",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () => incrementPoints(Team.A, 2),
                    child: Text(
                      "Add 2 Points",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () => incrementPoints(Team.A, 3),
                    child: Text(
                      "Add 3 Points",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
              SizedBox(
                height: 450,
                child: VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                ),
              ),
              Column(
                children: [
                  Text(
                    "Team B",
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    "${teamPoints[Team.B]}",
                    style: TextStyle(fontSize: 150),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () => incrementPoints(Team.B, 1),
                    child: Text(
                      "Add 1 Point",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () => incrementPoints(Team.B, 2),
                    child: Text(
                      "Add 2 Points",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () => incrementPoints(Team.B, 3),
                    child: Text(
                      "Add 3 Points",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                onPressed: resetPoints,
                child: Text(
                  "Reset",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
