import 'package:flutter/material.dart';
import 'package:untitled/data/model/transaction_model.dart';

class TransactionSuccessScreen extends StatelessWidget {
  const TransactionSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // 1. Use 'as Map?' to handle null safely
    final args = ModalRoute.of(context)?.settings.arguments as Map?;

    // 2. Check if arguments are missing to prevent the crash
    if (args == null) {
      return const Scaffold(
        body: Center(child: Text("Error: No data received!")),
      );
    }

    // 3. Extract the model from the map correctly
    final transaction = args["transaction"] as TransactionModel;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              transaction.isExpense ? Icons.remove_circle : Icons.add_circle,
              color: transaction.isExpense ? Colors.red : Colors.green,
              size: 60,
            ),
            const SizedBox(height: 20),
            Text(
              transaction.isExpense ? "Expense Added!" : "Income Added!",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Amount: \$${transaction.amount}"),
          ],
        ),
      ),
    );











    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 30),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           // Success Icon Animation Area
    //           Container(
    //             height: 100,
    //             width: 100,
    //             decoration: BoxDecoration(
    //               color: Colors.green.withOpacity(0.1),
    //               shape: BoxShape.circle,
    //             ),
    //             child: const Icon(
    //               Icons.check_circle,
    //               color: Colors.green,
    //               size: 80,
    //             ),
    //           ),
    //           const SizedBox(height: 24),
    //           const Text(
    //             "Transaction Successful!",
    //             style: TextStyle(
    //               fontSize: 22,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.black87,
    //             ),
    //           ),
    //           const SizedBox(height: 8),
    //           const Text(
    //             "Your transaction has been completed successfully.",
    //             textAlign: TextAlign.center,
    //             style: TextStyle(color: Colors.grey),
    //           ),
    //
    //           const SizedBox(height: 40),
    //
    //           // Transaction Detail Card
    //           Container(
    //             padding: const EdgeInsets.all(20),
    //             decoration: BoxDecoration(
    //               color: const Color(0xffF3F3F7),
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //             child: Column(
    //               children: [
    //                 _buildDetailRow("Title", transaction.title),
    //                 const Divider(height: 30),
    //                 _buildDetailRow("Amount", "\$${transaction.amount.toStringAsFixed(2)}"),
    //                 const Divider(height: 30),
    //                 _buildDetailRow("Type", transaction.isExpense ? "Expense" : "Income"),
    //                 const Divider(height: 30),
    //                 _buildDetailRow("Date", "${transaction.date.day}/${transaction.date.month}/${transaction.date.year}"),
    //               ],
    //             ),
    //           ),
    //
    //           const SizedBox(height: 50),
    //
    //           // Home එකට යන Button එක (ඔයා කලින් ඉල්ලපු style එකටමයි තියෙන්නෙ)
    //           ElevatedButton(
    //             onPressed: () {
    //               Navigator.pushNamedAndRemoveUntil(
    //                 context,
    //                 '/dashboard',
    //                     (route) => false,
    //               );
    //             },
    //             style: ElevatedButton.styleFrom(
    //               backgroundColor: Colors.purple,
    //               minimumSize: const Size(double.infinity, 55),
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(25),
    //               ),
    //             ),
    //             child: const Text(
    //               "Back to Home",
    //               style: TextStyle(color: Colors.white, fontSize: 16),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  // Details පෙන්නන්න helper widget එකක්
  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}