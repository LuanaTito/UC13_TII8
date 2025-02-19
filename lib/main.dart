import 'package:appperguntas/resposta.dart';
import 'package:flutter/material.dart';
import './questao.dart';

void main() => runApp(PerguntasApp());

class _PerguntaAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual é a sua comida favorita?',
      'resposta': ['Macarrão', 'Feijoada', 'Churrasco', 'Frutos do Mar'],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

//criando um guetter para saber se tem pergunta selecionada
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas'] as List<String>
        : [];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //material design
      home: Scaffold(
        //estrutura da aplicação
        appBar: AppBar(
          //topo
          title: const Text('Perguntas'),
        ),
        //body: Text('Olá Mundo!') //teste de página
        body: temPerguntaSelecionada
        ? Column(
          children: [
            /*Peguei uma lista de string. que são as minhas respostas, usei um método MAP para converter a lista em listas de wigets dentro da arvore de componentes. Uma vez passado para column, transformei o resultado do map em uma lista, usamos os (...) para pegar cada elemento da lista e jogar dentro da lista (que são os filhos do column*/
            Questao(_perguntas[_perguntaSelecionada]['texto'] as String),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
            // Resposta('Resposta1', _responder),
            // Resposta('Resposta2', _responder),
            // Resposta('Resposta3', _responder),
            /* ElevatedButton(
              //recebe dois parametros
              onPressed: _responder, //parametros de click
              child: Text(
                  'Resposta1'), //crio um botão que recebe outro widget um filho, que pode ser uma coluna, linha, texto, icone...
            ),
            ElevatedButton(
              //recebe dois parametros
              onPressed: _responder, //parametros de click
              child: Text(
                  'Resposta2'), //crio um botão que recebe outro widget um filho, que pode ser uma coluna, linha, texto, icone...
            ),
            ElevatedButton(
              //recebe dois parametros
              onPressed: _responder, //parametros de click
              child: Text(
                  'Resposta3'), //crio um botão que recebe outro widget um filho, que pode ser uma coluna, linha, texto, icone...
            ),*/
          ],
        )
        : const Center(
                child: Text(
                  'Parabéns!',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),

      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
