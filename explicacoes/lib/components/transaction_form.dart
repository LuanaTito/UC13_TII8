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

