import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFDFF9FB)),
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Espaço liberado, bem vindo(a)";


  _changePeople(int delta) {
    
   

    setState(() {
      _people += delta;

      if (_people == 0) {
        return null;
      } else if (_people <= 20) {
        _infoText = "Espaço liberado, bem vindo(a)";
      } else {
        _infoText = "Lotado! Aguarde um pouco";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            //     Image.asset(
            //      'images/fundorestaurante.jpg',
            //      fit: BoxFit.cover,
            //      height: 1000,
            //    ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/fila.png',
                    width: 380,
                    height: 250,
                  ),
                  Text(
                    'Pessoas no local    $_people',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  ),
                   SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () => {_changePeople(1)},
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                        backgroundColor: Colors.purple,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FloatingActionButton(
                        onPressed: () => {if (_people == 0) {
                          null
                        } else {
                       _changePeople(-1)  
                        },
                          },
                        tooltip: 'Remove',
                        child: Icon(Icons.remove),
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    _infoText,
                    style: TextStyle(
                        color: Colors.purple,
                        fontStyle: FontStyle.italic,
                        fontSize: 29),
                  ),
                ]),
          ],
        ),
        bottomNavigationBar:
            BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            label: 'Entrar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Sair',
          ),
        ]));
  }
}
