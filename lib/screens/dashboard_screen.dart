
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

@override
State<DashboardScreen> createState() => _DashboardScreenState();
}


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
                    onPressed: () {},
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
                 child: ListView(  //-> can scroll now -> using ListView
                  children: [
                    transactionItem(
                        icon: Icons.shopping_cart,
                        title: 'Groceries',
                        date: 'Today',
                        amount: -120),
                    transactionItem(
                        icon: Icons.account_balance_wallet,
                        title: 'Salary',
                        date: 'Mar 25',
                        amount: 2000),
                    transactionItem(
                        icon: Icons.local_taxi,
                        title: 'Uber',
                        date: 'Mar 24',
                        amount: -35),
                    transactionItem(
                        icon: Icons.store,
                        title: 'Online Store',
                        date: 'Mar 20',
                        amount: -150),
                    transactionItem(
                        icon: Icons.account_balance,
                        title: 'Bank Transfer',
                        date: 'Mar 18',
                        amount: -100),
                    transactionItem(
                        icon: Icons.account_balance_wallet,
                        title: 'Salary',
                        date: 'Mar 25',
                        amount: 2000),
                    transactionItem(
                        icon: Icons.store,
                        title: 'Online Store',
                        date: 'Mar 20',
                        amount: -150),
                    transactionItem(
                        icon: Icons.account_balance,
                        title: 'Bank Transfer',
                        date: 'Mar 18',
                        amount: -100),
                    transactionItem(
                        icon: Icons.account_balance_wallet,
                        title: 'Salary',
                        date: 'Mar 25',
                        amount: 2000),
                  ],
                ),
              ),
            ],
          ),
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

  Widget transactionItem(
      {required IconData icon,
        required String title,
        required String date,
        required double amount}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date),
        trailing: Text(
          '${amount >= 0 ? '+' : '-'}\$${amount.abs().toStringAsFixed(2)}',
          style: TextStyle(
              color: amount >= 0 ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}