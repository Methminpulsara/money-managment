import 'package:flutter/material.dart';
import 'package:untitled/screens/add_transaction_screen.dart';
import 'package:untitled/screens/dashboard_screen.dart';
import 'package:untitled/screens/profile_screen.dart';
import 'package:untitled/screens/transaction_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState  extends State<Home>{
  int _selectIndecx = 0;

  final List<Widget> _pages  =[
    DashboardScreen(),
    TransactionScreen(),
    AddTransactionScreen(),
    ProfileScreen()
  ];


  void _onSelecttedPage(int index){
    setState(() {
      _selectIndecx = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:IndexedStack(
        index:_selectIndecx,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10), // පැතිවලින් ඉඩ තියනවා
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: _selectIndecx,
            onTap: _onSelecttedPage,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.purple, // තෝරපු icon එකේ පාට
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            showSelectedLabels: true,
            showUnselectedLabels: false, // Modern ලුක් එකක් ගන්න මේක false කරන්න
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.receipt_long_rounded), label: "Transactions"),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "Add"),
              BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile"),

            ],
          ),
        ),
      ),
    );
  }

}
