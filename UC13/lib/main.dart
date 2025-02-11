import 'package:flutter/material.dart';

main() => runApp(PerguntasApp());

class PerguntasApp extends StatelessWidget {
  //metodo criado para a classe e POO
  void responder() {
    print('Pergunta resposndida!');
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      //variável que contém um lista
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
      'qual é a sua comida favorita?',
    ];

    return MaterialApp(
      //material design
      home: Scaffold(
        //estrutura da aplicação
        appBar: AppBar(
          //topo
          title: Text('Perguntas'),
        ),
        //body: Text('Olá Mundo!') //teste de página
        body: Column(
          children: <Widget>[
           // Text(perguntas.elementAt(0)),
            Text(perguntas[1]),
            ElevatedButton(
              //recebe dois parametros
              child: Text(
                  'Resposta1'), //crio um botão que recebe outro widget um filho, que pode ser uma coluna, linha, texto, icone...
              onPressed: responder, //parametros de click
            ),
            ElevatedButton(
              //recebe dois parametros
              child: Text(
                  'Resposta2'), //crio um botão que recebe outro widget um filho, que pode ser uma coluna, linha, texto, icone...
              onPressed: responder, //parametros de click
            ),
            ElevatedButton(
              //recebe dois parametros
              child: Text(
                  'Resposta3'), //crio um botão que recebe outro widget um filho, que pode ser uma coluna, linha, texto, icone...
              onPressed: responder, //parametros de click
            ),
          ],
        ),
      ),
    );
  }
}

//teste do git



