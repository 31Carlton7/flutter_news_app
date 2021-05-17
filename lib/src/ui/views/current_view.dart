import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/bottom_navigation_bar.dart';
import 'package:canton_news_app/src/ui/views/top_sources_view.dart';
import 'package:canton_news_app/src/ui/views/top_stories_view.dart';

class CurrentView extends StatefulWidget {
  @override
  _CurrentViewState createState() => _CurrentViewState();
}

class _CurrentViewState extends State<CurrentView> {
  int _currentIndex = 0;
  final List<Widget> _views = [
    TopStoriesView(),
    TopSourcesView(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      bottomNavBar: BottomNavBar(_currentIndex, onTabTapped),
      body: _views[_currentIndex],
    );
  }
}
