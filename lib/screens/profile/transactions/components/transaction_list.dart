import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klambi_admin/screens/profile/transactions/components/transaction_card.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      {
        'icon': Icons.input,
        'description': 'Salary Payment',
        'dateTime': '2024-08-27 09:00',
        'amount': '199.000',
      },
      {
        'icon': Icons.money_off,
        'description': 'Grocery Shopping',
        'dateTime': '2024-08-26 15:30',
        'amount': '200.000',
      },
      {
        'icon': Icons.attach_money,
        'description': 'Freelance Work',
        'dateTime': '2024-08-25 10:00',
        'amount': '120.000',
      },
    ];

    return Column(
      children: [
        // Other widgets can go here
        Container(
          height: MediaQuery.of(context).size.height,
            child: ListView.builder(
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return TransactionCard(
                icon: transaction['icon'] as IconData,
                description: transaction['description'] as String,
                dateTime: transaction['dateTime'] as String,
                amount: transaction['amount'] as String,
              );
            },
          )
        ),
      ],
    );
  }
}
