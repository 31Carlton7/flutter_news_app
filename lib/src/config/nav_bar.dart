import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/ui/views/top_sources_view.dart';
import 'package:canton_news_app/src/ui/views/top_stories_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CurrentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PersistentTabController _controller = PersistentTabController();

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const IconlyIcon(IconlyBold.Home, size: 24),
          title: '',
          activeColorPrimary: CantonColors.green,
          inactiveColorPrimary: CantonColors.iconTertiary,
        ),
        PersistentBottomNavBarItem(
          icon: const IconlyIcon(IconlyBold.Chart, size: 24),
          title: '',
          activeColorPrimary: CantonColors.green,
          inactiveColorPrimary: CantonColors.iconTertiary,
        ),
      ];
    }

    final List<Widget> views = [
      TopStoriesView(),
      TopSourcesView(),
    ];

    return PersistentTabView(
      context,
      controller: _controller,
      screens: views,
      backgroundColor: cantonGrey[100],
      resizeToAvoidBottomInset: true,
      navBarStyle: NavBarStyle.style12,
      navBarHeight: MediaQuery.of(context).size.height / 16,
      decoration: NavBarDecoration(
        colorBehindNavBar: cantonGrey[100],
      ),
      items: _navBarsItems(),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
    );
  }
}
