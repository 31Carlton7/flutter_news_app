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
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTabTapped,
      items: [
        BottomNavigationBarItem(
          icon: IconlyIcon(IconlyBold.Home,
              size: 24,
              color: widget.currentIndex == 0
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).colorScheme.secondaryVariant),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconlyIcon(IconlyBold.Chart,
              size: 24,
              color: widget.currentIndex == 1
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).colorScheme.secondaryVariant),
          label: '',
        ),
      ],
    );
  }
}
