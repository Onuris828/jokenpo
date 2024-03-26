import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Faça sua escolha";

  _opcaoUsuario (String escolhaUsuario) {
    var opcoes = ["papel", "pedra", "tesoura"];
    var numeros = Random().nextInt(3);
    var escolhaApp = opcoes[numeros];


    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    //validação do vencedor

    if (
    (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ) {
      setState(() {
        this._mensagem = "Parabens você ganhou!";
      });

    }else if(
    (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")){

      setState(() {
        this._mensagem = "Que pena você perdeu!";
      });

    }else{
        setState(() {
          this._mensagem = "Empate!";
        });
    }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JOKENPO",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.double
        ),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 36, bottom: 16),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 36, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoUsuario("papel"),
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoUsuario("pedra"),
                child: Image.asset("images/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoUsuario("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100,),
              ),
              /*Image.asset("images/papel.png", height: 100,),
              Image.asset("images/pedra.png", height: 100,),
              Image.asset("images/tesoura.png", height: 100,),*/
            ],
          )
        ],
      ),
    );
  }
}
