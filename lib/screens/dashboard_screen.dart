import 'package:flutter/material.dart';
import 'package:untitled/data/model/transaction_model.dart';
import 'package:untitled/widgets/transaction_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

final List<TransactionModel> trans = [
  TransactionModel(
    iconName: Icons.add_ic_call_outlined,
    title: "bla bla",
    date: DateTime.parse("2021-12-01"),
    amount: 100.00,
    isExpense: true,
  ),
  TransactionModel(
    iconName: Icons.two_k_sharp,
    title: "bla bla",
    date: DateTime.parse("2021-12-01"),
    amount: 100.00,
    isExpense: true,
  ),TransactionModel(
    iconName: Icons.eighteen_up_rating,
    title: "bla bla",
    date: DateTime.parse("2021-12-01"),
    amount: 100.00,
    isExpense: true,
  ),TransactionModel(
    iconName: Icons.fourteen_mp_sharp,
    title: "bla bla",
    date: DateTime.parse("2021-12-01"),
    amount: 100.00,
    isExpense: true,
  ),
  TransactionModel(
    iconName: Icons.ten_k,
    title: "bla bla",
    date: DateTime.parse("2021-12-01"),
    amount: 100.00,
    isExpense: true,
  ),TransactionModel(
    iconName: Icons.twenty_mp_rounded,
    title: "bla bla",
    date: DateTime.parse("2021-12-01"),
    amount: 100.00,
    isExpense: true,
  ),
];


class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              // Month Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  Text(
                    'March 2024',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Balance Card
              Container(
                height: 200, // Fixed height
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top: Balance
                      const Text(
                        'Total Balance',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '\$3,550.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Spacer(), // pushes bottom row down

                      // Bottom: Income & Expense Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Income Bottom Left
                          Row(
                            children: const [
                              Icon(Icons.arrow_downward, color: Colors.green, size: 16),
                              SizedBox(width: 6),
                              Text(
                                'Income',
                                style: TextStyle(color: Colors.white, fontSize: 13),
                              ),
                              SizedBox(width: 4),
                              Text(
                                '\$2,500',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),

                          // Expense Bottom Right
                          Row(
                            children: const [
                              Icon(Icons.arrow_upward, color: Colors.pink, size: 16),
                              SizedBox(width: 6),
                              Text(
                                'Expense',
                                style: TextStyle(color: Colors.white, fontSize: 13),
                              ),
                              SizedBox(width: 4),
                              Text(
                                '\$950',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Recent Transactions Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Transactions',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Added routing here
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Colors.purple),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 8),

              // Transactions List ->
              Expanded(
                child: ListView.separated(  //-> can scroll now -> using ListView
                    itemCount: trans.length,
                    itemBuilder:(context,index) {
                      return TransactionWidget(transacton: trans[index]);

                    },
                    separatorBuilder: (context,index) {
                      return Divider(thickness: 1,);
                    }


                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          // Added routing here
          Navigator.pushNamed(context, '/add_transaction');
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );


  }

// Widget transactionItem(
//     {required IconData icon,
//       required String title,
//       required String date,
//       required double amount}) {
//   return Card(
//     margin: const EdgeInsets.symmetric(vertical: 6),
//     child: ListTile(
//       leading: Icon(icon, size: 20),
//       title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//       subtitle: Text(date),
//       trailing: Text(
//         '${amount >= 0 ? '+' : '-'}\$${amount.abs().toStringAsFixed(2)}',
//         style: TextStyle(
//             color: amount >= 0 ? Colors.green : Colors.red,
//             fontWeight: FontWeight.bold),
//       ),
//     ),
//   );
// }
}