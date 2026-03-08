import 'package:flutter/material.dart';
import 'package:untitled/screens/add_transaction_screen.dart';
import 'package:untitled/screens/dashboard_screen.dart';
import 'package:untitled/screens/home.dart';
import 'package:untitled/screens/profile_screen.dart';
import 'package:untitled/screens/transaction_screen.dart';
import 'package:untitled/screens/transactions_success.dart';

import 'config/size_config.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        SizedConfig.init(context);
        return child!;
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home(),
      routes: {
        "/home" : (context) => Home(),
        '/transaction-add': (context) => AddTransactionScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/transactions' : (context) => TransactionScreen(),
        '/profile' : (context) => ProfileScreen(),
        "/success": (context) => TransactionSuccessScreen()
      },

     );
  }
}

class MyWidget extends StatelessWidget{
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Text('My Widget'),
    );
  }
}


class MyFirstWidget extends StatelessWidget{
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      height: 20,
      width: 200,
      color: Colors.blue,
      child: Text('My First Widget'),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 50,
        color: Colors.red,
        child: Center(child: Text('My Button')),
      ),
    );
  }
}
