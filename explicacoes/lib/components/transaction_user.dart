import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';
// comunicação entre pai e filho

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions), //transactionList depente da _trans...se eu deixar uma lista vazia ele não aparece mais a lista ([]), 
        //passando as informações via construtor/parametros..o pai passa uma comunicação direta para o filho.
        TransactionForm(), //preciso recer a informação de quando foi cadastrada ...filho para pai
      ],
    );
  }
}
//##########-----------#######

import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';
// comunicação entre pai e filho

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];
//criar uma função ..filho se comunicando com o pai..chamado do formulário
    _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(), //gerando um valor randomido, um id automático
      title: title,//primeiro é o construtor e o segundo é do parametro da função 
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction); //mudando o estado do meu componente renderiza o estado todo. alteração de forma externa
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions), 
        TransactionForm(), 
      ],
    );
  }
}
//ir para o forms
