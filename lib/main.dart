import 'package:flutter/material.dart';
import 'package:search_try/recepies/burger.dart';
import 'package:search_try/recepies/lahmacun.dart';
import 'package:search_try/recepies/pizza.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void takePhoto() {
    setState(() {
      switch ("${myController.text}") {
        case "PİZZA":
          {
            x = 1;
          }
          break;
        case "LAHMACUN":
          {
            x = 2;
          }
          break;
        case "BURGER":
          {
            x = 3;
          }
          break;
      }
    });
  }

  var myController = TextEditingController();
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 40,
                  spreadRadius: 0)
            ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 40, 18, 18),
              child: searchBar(),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          examplephoto(),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              switch (x) {
                case 1:
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => pizzaRc()));
                  }
                  break;
                case 2:
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => lahmacRc()));
                    break;
                  }
                case 3:
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BurgerRc()));
                  }
              }
            },
            child: Text(
              "GO TO RECİPES",
              style: TextStyle(color: Colors.red),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow.shade600,
            ),
          )
        ],
      ),
    );
  }

  Container examplephoto() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.grey),
      width: 300,
      height: 200,
      child: Image.asset("assets/${x}.png"),
    );
  }

  TextField searchBar() {
    return TextField(
      controller: myController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        prefixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            takePhoto();
          },
        ),
      ),
    );
  }

  AppBar appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        "RECEPİES",
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
