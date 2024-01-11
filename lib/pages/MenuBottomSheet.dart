import 'package:flutter/material.dart';

class MenuBottomSheet extends StatelessWidget {
  final List<MenuData> menuList = [
    MenuData(icon: Icons.star, color: Colors.amber, name: 'Favorite'),
    MenuData(icon: Icons.info, color: Colors.blue, name: 'Info'),
    MenuData(icon: Icons.settings, color: Colors.green, name: 'Settings'),
    // Add more menu items as needed
  ];

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: menuList.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Icon(
                    menuList[index].icon,
                    color: menuList[index].color,
                  ),
                  title: Text(
                    menuList[index].name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // Handle menu item tap
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showBottomSheet(context),
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'Show Bottom Sheet',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class MenuData {
  final IconData icon;
  final Color color;
  final String name;

  MenuData({
    required this.icon,
    required this.color,
    required this.name,
  });
}
