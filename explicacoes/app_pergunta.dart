
import 'dart:ffi';

main() => runApp(PerguntaApp());
//esplicações de estrutura de widget
//arvore de widget (componentes), arvore de componentes baseado em composição ...
class PerguntasApp estends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //temos o material design, passa um atributo, que passa um widget, que vai passar outro widget
      home: Scaffold( //estrutura da aplicação
        appBar: AppBar( //
          title: Text('Perguntas'), //parametro nomeado que recebe um widget (Text)
        ),
        body: Text('Olá Mundo!'), // se apertar o ctrl + espaço ele mostra o que quer receber, e também no vscode mostra as possibilidades de parametros. 
      ),
    );
  }
}

//tem alguns componetes que recebem mais de um widget
//diferentes tipos de widgets 

class PerguntasApp estends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //temos o material design, passa um atributo, que passa um widget, que vai passar outro widget
      home: Scaffold( //estrutura da aplicação
        appBar: AppBar( //
          title: Text('Perguntas'), //parametro nomeado que recebe um widget (Text)
        ),
        body: Column(
          children: <Widget>[ //essa estrutura faz automatica clicando em ctrl . ( ele apresenta outras opções)
            Text('Olá Flutter'),
           ], 
          //fazendo manualmente
           body: Column(
          children: [ 
            Text('Linha 1'),
            Text('Linha 2'),
            Text('Linha 3'),
           ], 
        ), 
      ),
    );
  }
}

// colocando variáveis e button     
class PerguntasApp estends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      final List<String> perguntas =[]//pode ser escrita desta forma
  final perguntas = [ //no dart é possivel criar uma lista de variáveis.
    'Qual é a sua cor favorita?',
    'Qual é o seu animal favorito?',
    'Qual é a sua comida favorita?',
  ];
    
    return MaterialApp( //temos o material design, passa um atributo, que passa um widget, que vai passar outro widget
      home: Scaffold( //estrutura da aplicação
        appBar: AppBar( //
          title: Text('Perguntas'), //parametro nomeado que recebe um widget (Text)
        ),
        body: Column(
          children: <Widget>[ //essa estrutura faz automatica clicando em ctrl . ( ele apresenta outras opções)
            Text(perguntas.elementAt(0)), //pega o primeiro elemento
            //outra forma
             Text(perguntas[0]),//pega o primeiro elemento
            RaisedButton( //componente que recebe 2 parametros
              child: Text('Resposta 1'), //crio um botao que recebe outro widget um filho, que pode ser uma coluna, uma linha, um texto, um icone...
              onPressed: null, // parametro relacionada ao click as ações
            ),
            RaisedButton( //componente que recebe 2 parametros
              child: Text('Resposta 2'), //crio um botao que recebe outro widget um filho, que pode ser uma coluna, uma linha, um texto, um icone...
              onPressed: null, // parametro relacionada ao click as ações
            ),
            RaisedButton( //componente que recebe 2 parametros
              child: Text('Resposta 3'), //crio um botao que recebe outro widget um filho, que pode ser uma coluna, uma linha, um texto, um icone...
              onPressed: null, // parametro relacionada ao click as ações
            ),
           ], 
        ), 
      ),
    );
  }
}      


//conectando função ao evento do botão
      //criação de metodos 
class PerguntasApp estends StatelessWidget {
  // o metodo deve ser criado dentro da classe para ficar orientado a objeto
  void responder(){
    print('Pergunta respondida!'); //visualizacao no console
  }
//passar esse método onde está o null
  @override
  Widget build(BuildContext context) {
  final perguntas = [ 
    'Qual é a sua cor favorita?',
    'Qual é o seu animal favorito?',
    'Qual é a sua comida favorita?',
  ];
    return MaterialApp( 
      home: Scaffold( 
        appBar: AppBar( 
          title: Text('Perguntas'), 
        ),
        body: Column(
          children: <Widget>[ 
            Text(perguntas.elementAt(0)), 
            
             Text(perguntas[0]),
            RaisedButton( 
              child: Text('Resposta 1'), 
              onPressed: responder(), //assim ele vai gerar um problema. (mostrar no crtl espaço)
              //está dando erro pq eu chamei a funcao responder, eu nao passei como parametro. BASTA TIRAR OS (), ASSIM PASSAREMOS A FUNCAO COMO PARAMETRO
            ),
            RaisedButton( 
              child: Text('Resposta 2'), 
              onPressed: responder(), 
            ),
            RaisedButton( 
              child: Text('Resposta 3'), 
              onPressed: responder(), 
            ),
           ], 
        ), 
      ),
    );

    //executando sem o parenteses no console 
//view debug console
class PerguntasApp estends StatelessWidget {

  void responder(){
    print('Pergunta respondida!'); 
  }
  // Invocando uma funcao mesmo, sem ser como parametro:
//funcao invocando uma funcao
    void Function() funcaoqueretornaoutrafuncao(){
      return (){
    print('Pergunta respondida! #02'); 
      };
  }

  @override
  Widget build(BuildContext context) {
  final perguntas = [ 
    'Qual é a sua cor favorita?',
    'Qual é o seu animal favorito?',
    'Qual é a sua comida favorita?',
  ];
    return MaterialApp( 
      home: Scaffold( 
        appBar: AppBar( 
          title: Text('Perguntas'), 
        ),
        body: Column(
          children: <Widget>[ 
            Text(perguntas.elementAt(0)), 
            
             Text(perguntas[0]),
            RaisedButton( 
              child: Text('Resposta 1'), 
              onPressed: responder, 
               //pode ser criado uma funcao direto no onpress
              onPressed: (){
                print('resopsta 1 foi selecionada');
              },
            ),
            RaisedButton( 
              child: Text('Resposta 2'), 
              onPressed: responder, 
               //pode ser assim tbm
              onPressed: () => print('resopsta 3'),
            ),
            RaisedButton( 
              child: Text('Resposta 3'), 
              onPressed: funcaoqueretornaoutrafuncao(), 
            ),
           ], 
        ), 
      ),
    );
  }
}      

////========***********==========
///
///transformando em stateful
      
//Primeiro passo, preciso jogar o que está em stateless, para ful.
//Com isso ele vai renderizar novamente 
//Trocar a class PerguntaApp para Stateful (trocando a herança)
//depois criar uma outra class a cima do pergunta: 
/*class PerguntaAppState extends state<PerguntaApp>{ //colocar a conexao entre osdois estados
 colocar aqui dentro a variavel, o metodo set e o build
} */
//alt seta para cima, vai subindo.


import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void responder() {
    setState(() { // irá dizer aquilo que está sendo medificado. 
      _perguntaSelecionada++; //incrementando a pergunta onde cada vez que clicar mudar a pergunta.
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Text(perguntas[_perguntaSelecionada]),
            ElevatedButton(
              onPressed: responder,
              child: const Text('Resposta 1'),
            ),
            ElevatedButton(
              onPressed: responder,
              child: const Text('Resposta 2'),
            ),
            ElevatedButton(
              onPressed: responder,
              child: const Text('Resposta 3'),
            ),
          ],
        ),
      ),
    );
  }
}

//criando um estado abstrado dentro da class
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}

//tornando membros privados
/* quando queremos transformar um atributo em privado, no dart não tem palavra reservada
é usado um "_ " 
conceito,o objeto só será visto pelo arquivo que está sendo executado.

teste para verificação: 
crieum arquivo chamado pessoa
class Pessoa{
  String nome;
  String _cpf;
}

main(){
var p1 = Pessoa();
p1.nome = 'João';
p1._cpf = '123.456.789-00';

print('O ${p1.nome} tem CPF ${p1.cpf}');
}

crie outro arquivo para testar , coloque em outro arquivo a class Pessoa e importa no arquivo que está o main

import './pessoa.dart';

o cpf não virá pois será privado.

para torna isso possivel deve-se criar um getter. 
...no arquivo pessoa, dentro da class criar o seguinte:

set cpf(String cpf){
this._cpf = cpf;
}

get cpf{
return _cpf;
}

lá no outro arquivo colocar o get:
print('O ${p1.nome} tem CPF ${p1.cpf}');


*/

// voltando ao arquivo...

import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void __responder() {
    setState(() { 
      _perguntaSelecionada++; 
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Text(perguntas[_perguntaSelecionada]),
            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 1'),
            ),
            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 2'),
            ),
            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 3'),
            ),
          ],
        ),
      ),
    );
  }
}


class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}


//criar outro componete: questao.dart 
// digitar st e espaço
//escolher stateless
//dar o nome e digitar ctrl . para importar o material design

