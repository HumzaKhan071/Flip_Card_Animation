import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlipCardController _controller = FlipCardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLip Card Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlipCard(
                controller: _controller,
                direction: FlipDirection.VERTICAL,
                flipOnTouch: false,
                front: customCard("Frond Side"),
                back: customCard("Back Side")),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  _controller.toggleCard();
                },
                child: Text("FLip Card"))
          ],
        ),
      ),
    );
  }
}

Widget customCard(String title) {
  return Material(
    elevation: 5,
    borderRadius: BorderRadius.circular(20),
    color: Colors.blue,
    child: Container(
      height: 450,
      width: 300,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
