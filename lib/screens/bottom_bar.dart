import 'package:book_tickets/screens/home_screen.dart';
import 'package:book_tickets/screens/search_screen.dart';
import 'package:book_tickets/screens/ticket_screen.dart';
import 'package:book_tickets/utils/app_icons.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const Text("Profile"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("My Tickets"),
      // ),
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xFF526480),
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(AppIcons.homeRegular),
            activeIcon: Icon(AppIcons.homeFilled),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(AppIcons.searchRegular),
            activeIcon: Icon(AppIcons.searchFilled),
          ),
          BottomNavigationBarItem(
            label: "Ticket",
            icon: Icon(AppIcons.ticketRegular),
            activeIcon: Icon(AppIcons.ticketFilled),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(AppIcons.personRegular),
            activeIcon: Icon(AppIcons.personFilled),
          ),
        ],
      ),
    );
  }
}
