import 'package:canton_design_system/canton_design_system.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int) onTabTapped;

  const BottomNavBar(this.currentIndex, this.onTabTapped);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: widget.onTabTapped,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondaryVariant,
        selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor, size: 24),
        items: [
          BottomNavigationBarItem(
            label: 'Top Stories',
            tooltip: '',
            activeIcon: Icon(Iconsax.note_2, size: 24),
            icon: Icon(Iconsax.note_2, size: 24),
          ),
          BottomNavigationBarItem(
            label: 'Sources',
            tooltip: '',
            activeIcon: Icon(Iconsax.favorite_chart, size: 24),
            icon: Icon(Iconsax.favorite_chart, size: 24),
          ),
          BottomNavigationBarItem(
            label: 'Categories',
            tooltip: '',
            activeIcon: Icon(Iconsax.category_2, size: 24),
            icon: Icon(Iconsax.category_2, size: 24),
          ),
        ],
      ),
    );
  }
}
