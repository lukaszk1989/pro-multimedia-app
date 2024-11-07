import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentSelectedIndex,
      onTap: (index) {
        setState(() {
          _currentSelectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Śląskie',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: 'Aktualności',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_sharp),
          label: 'Wydarzenia',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Eksploruj',
        ),
      ],
    );
  }
}
