import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

class Jogojokenpo extends StatefulWidget {

  @override
  _JogojokenpoState createState() => _JogojokenpoState();
}


class _JogojokenpoState extends State<Jogojokenpo> {
  var _imagemApp = AssetImage("imagens/padrao.png");
  var _imagemUser = AssetImage("imagens/padrao.png");
  List _opcoes = ["pedra", "papel", "tesoura"];
  int numeroAleatorio = 3;
  String escolhaApp = "";
  String escolhaUser = "";
  String _mensagem = "Usuário, escolha uma opção";

  void _OpcaoSelecionada(String escolhaUsuario){
    //print("Opção selecionada ${escolhaUsuario}");
    numeroAleatorio = new Random().nextInt(_opcoes.length);
    escolhaApp = _opcoes[numeroAleatorio];
    escolhaUser = escolhaUsuario;

    //print("app ${escolhaApp}");
    //print("user ${escolhaUsuario}");

    //Adicionando imagem escolhida pelo usuário ao círculo vazio
    switch(escolhaUser){
      case "pedra":
        setState(() {
          _imagemUser = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemUser = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemUser = AssetImage("imagens/tesoura.png");
        });
        break;
    }

    //Adicionando imagem escolhida pelo app ao círculo vazio
    switch(escolhaApp){
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }

    //validar ganhador
    if ( (escolhaUser=="pedra" && escolhaApp=="tesoura")  || (escolhaUser=="tesoura" && escolhaApp=="papel") || (escolhaUser=="papel" && escolhaApp=="pedra")) {
      setState(() {
        this._mensagem = "Parabéns, você ganhou do Aplicativo!";
      });
    }

    else if ( (escolhaApp=="pedra" && escolhaUser=="tesoura")  || (escolhaApp=="tesoura" && escolhaUser=="papel") || (escolhaApp=="papel" && escolhaUser=="pedra")) {
      setState(() {
        this._mensagem = "Infelizmente, você perdeu para o Aplicativo!";
      });
    }

    else{
      setState(() {
        this._mensagem = "Empatou, você escolheu o mesmo que o Aplicativo!";
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("JoKenPô"),
        backgroundColor: Colors.redAccent,

      ),


      body: Container(
        //Estende os elementos até o final da tela, caso falte espaço na largura ou altura
        //width: double.infinity,
        //height: double.infinity,

        //Adiciona um rolador na tela (Scroll). Ao usar essa função, a linha de distribuição mainAxisAlignment não funciona
        child: SingleChildScrollView(

          child: Column(
            //distribui igualmente na transversal, iniciando do centro
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            //distriui os elementos proporcionalmente na coluna ou linha [não á funcionando]
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //mainAxisSize: MainAxisSize.max,

            children: <Widget>[
              Image.asset(
                "imagens/jokenpo.jpeg",
                height: 150,
                // fit: BoxFit.fill,
              ),


              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),

                child: Text("Sua Escolha     |     Escolha do App",
                  //alinhando apenas esse texto no centro, diferente da configuração total do app que está dentro de uma coluna
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),

              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    Image(
                      image: this._imagemUser,
                      height: 120,
                    ),
                    Image(
                      image: this._imagemApp,
                      height: 120,
                    ),
                  ]

              ),

              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),

                child: Text(_mensagem,
                  //alinhando apenas esse texto no centro, diferente da configuração total do app que está dentro de uma coluna
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),

              ),

              Row(
                //distribui os valores igualmente no espaço
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[

                    //Adicionando ação para uma imagem/texto, quando clicada(o)
                    GestureDetector(
                      onDoubleTap: () => _OpcaoSelecionada("pedra"),
                      child: Image.asset(
                        "imagens/pedra.png",
                        height: 80,
                      ),

                    ),
                    GestureDetector(
                      onDoubleTap:  () => _OpcaoSelecionada("papel"),
                      child: Image.asset(
                        "imagens/papel.png",
                        height: 80,
                      ),

                    ),
                    GestureDetector(
                      onDoubleTap:  () => _OpcaoSelecionada("tesoura"),
                      child:  Image.asset(
                        "imagens/tesoura.png",
                        height: 80,
                      ),

                    ),


                  ]


              ),

            ],



          ),

        ),

        ),

/*
      bottomNavigationBar: BottomAppBar(
        color: Colors.redAccent,

        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),

        ),

      ),
*/

    );
  }
}
