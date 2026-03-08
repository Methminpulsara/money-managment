import 'package:flutter/material.dart';
import 'package:untitled/data/model/transaction_model.dart';
import 'package:untitled/widgets/transaction_widget.dart';

class TransactionScreen extends StatelessWidget {

  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, "Transaction page closed");
          },
        ),

        title: const Text(
          "All Transactions",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text("Name"),
                hintText: "Enter Your name",

              ),
            )
          ],
        ),
      ),
    );
  }
}