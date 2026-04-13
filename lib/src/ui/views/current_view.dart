import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/bottom_navigation_bar.dart';
import 'package:canton_news_app/src/ui/views/category_list_view/category_list_view.dart';
import 'package:canton_news_app/src/ui/views/sources_view/sources_view.dart';
import 'package:canton_news_app/src/ui/views/top_stories_view/top_stories_view.dart';

final _navigatorKeys = [
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
];

class CurrentView extends StatefulWidget {
  @override
  _CurrentViewState createState() => _CurrentViewState();
}

class _CurrentViewState extends State<CurrentView> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    TopStoriesView(),
    SourcesView(),
    CategoryListView(),
  ];

  void _onTabTapped(int index) {
    if (index == _currentIndex) {
      final navigatorState = _navigatorKeys[index].currentState;
      if (navigatorState != null && navigatorState.canPop()) {
        navigatorState.pop();
      }
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      backgroundColor: CantonMethods.alternateCanvasColor(context, index: _currentIndex, targetIndexes: [0, 1]),
      bottomNavBar: BottomNavBar(_currentIndex, _onTabTapped),
      padding: EdgeInsets.zero,
      safeArea: false,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildNavigator(0),
          _buildNavigator(1),
          _buildNavigator(2, horizontalPadding: 17),
        ],
      ),
    );
  }

  Widget _buildNavigator(int index, {double horizontalPadding = 0}) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          fullscreenDialog: true,
          builder: (context) {
            Widget child = _views[index];
            if (horizontalPadding > 0) {
              child = Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: child,
              );
            }
            return SafeArea(child: child);
          },
        );
      },
    );
  }
}
