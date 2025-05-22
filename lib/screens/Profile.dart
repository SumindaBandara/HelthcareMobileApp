import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          ('images/profile.PNG'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Ruchita',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ProfileMenuItem(
                        icon: Icons.favorite_outline,
                        title: 'My Saved',
                        iconBackgroundColor: Colors.blue.shade50,
                        onTap: () {},
                      ),
                      const SizedBox(height: 12),
                      ProfileMenuItem(
                        icon: Icons.calendar_today_outlined,
                        title: 'Appointmnet',
                        iconBackgroundColor: Colors.blue.shade50,
                        onTap: () {},
                      ),
                      const SizedBox(height: 12),
                      ProfileMenuItem(
                        icon: Icons.payment_outlined,
                        title: 'Payment Method',
                        iconBackgroundColor: Colors.blue.shade50,
                        onTap: () {},
                      ),
                      const SizedBox(height: 12),
                      ProfileMenuItem(
                        icon: Icons.logout_outlined,
                        title: 'Logout',
                        iconBackgroundColor: Colors.blue.shade50,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const BottomNavBar(currentIndex: 3),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconBackgroundColor;
  final VoidCallback onTap;

  const ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.iconBackgroundColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.blue,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        if (index == currentIndex) return; // Prevent redundant navigation

        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/one');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/reports');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/thirteen');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/twelve');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description_outlined),
          label: 'Reports',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
