import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var _imageApp = AssetImage("images/padrao.png");

  var _message = "Escolha uma das opções abaixo:";

  void runGame(String _userPlay) {
    final _options = ["pedra", "papel", "tesoura"];

    final _appPlay = _options[Random().nextInt(3)];

    final _resultMatrix = {
      "pedra": {
        "pedra": "Empate",
        "papel": "App ganhou !",
        "tesoura": "Usuário ganhou !",
      },
      "papel": {
        "pedra": "Usuário ganhou !",
        "papel": "Empate",
        "tesoura": "App ganhou !",
      },
      "tesoura": {
        "pedra": "App ganhou !",
        "papel": "Usuário ganhou !",
        "tesoura": "Empate",
      },
    };

    setState(() {
      this._imageApp = AssetImage("images/$_appPlay.png");
      this._message =
          _resultMatrix?[_userPlay]?[_appPlay] ?? "Houve algum erro !";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "JokenPo",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "Escolha do App:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image(image: this._imageApp),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  this._message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => runGame("pedra"),
                    child: Image.asset("images/pedra.png", height: 100),
                  ),
                  GestureDetector(
                    onTap: () => runGame("papel"),
                    child: Image.asset("images/papel.png", height: 100),
                  ),
                  GestureDetector(
                    onTap: () => runGame("tesoura"),
                    child: Image.asset("images/tesoura.png", height: 100),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
