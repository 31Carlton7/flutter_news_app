import 'package:canton_design_system/canton_design_system.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTabTapped;

  const BottomNavBar(this.currentIndex, this.onTabTapped, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabTapped,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.secondaryVariant,
      selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor, size: 24),
      items: const [
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
    );
  }
}
