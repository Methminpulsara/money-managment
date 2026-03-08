import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF3F3F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Add Transaction",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        // Corrected placement and syntax for your button
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context, '/transaction-success',
                arguments: {"transactionType" : "Expense"},
                    (route) => route.settings.name == '/home');
            },
            child: const Text("Home"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Toggle buttons
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.shade200,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                          colors: [Color(0xffFF5F7E), Color(0xffFF2E63)],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Expense",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Income",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Amount box
            Container(
              width: double.infinity,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffE7E7EF),
              ),
              child: const Text(
                "\$0.00",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Category",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),

            const SizedBox(height: 10),

            /// Category dropdown container
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: const [
                  Icon(Icons.shopping_bag, color: Colors.red),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Shopping",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// Note field
            TextField(
              decoration: InputDecoration(
                hintText: "Note (optional)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const Spacer(),

            /// Button
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  colors: [Color(0xff6A5AE0), Color(0xffC86DD7)],
                ),
              ),
              child: const Center(
                child: Text(
                  "Add Expense",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 90),
            /// Bottom bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.home, color: Colors.deepPurple),
                Icon(Icons.bar_chart, color: Colors.grey),
                Icon(Icons.account_balance_wallet, color: Colors.grey),
                Icon(Icons.person, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}