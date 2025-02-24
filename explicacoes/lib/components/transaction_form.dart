import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  //criar uma função para submeter o formulario
    final void Function(String, double) onSubmit;
  //programando o enviar 
    TransactionForm(this.onSubmit, {Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'Nova Transação',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                  //programação do botão que irá receber as informações do forms
                  onPressed: () {
                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0;
                    onSubmit(title, value);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//alterar o user, o parametro do forms
//TransactionForm(_addTransaction),
//##########------------

//inserindo o teclado numerico
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  //criar uma função para submeter o formulario
  final void Function(String, double) onSubmit;
  //programando o enviar
  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);
//função para transformar o alfanumerico em apenas númerico 
  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;
//caso esses dados estiverem corretos ele chama o onSubmit, caso contrario ele retorna a função (sai da função no caso) 
    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(), //declaração do teclado alfanumérico
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              //inserindo o teclado numérico
               keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(), // o "_" ignora o parâmetro que foi chamado na função.
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'Nova Transação',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                  //programação do botão que irá receber as informações do forms
                  // onPressed: () {
                  //   final title = titleController.text;
                  //   final value = double.tryParse(valueController.text) ?? 0;
                  //   onSubmit(title, value);
                  // },
                   onPressed: _submitForm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//pode apagar os itens fixos na lista, para poder inserir mais caso quiera. 
