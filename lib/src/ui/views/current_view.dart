import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/bottom_navigation_bar.dart';
import 'package:canton_news_app/src/ui/views/category_list_view/category_list_view.dart';
import 'package:canton_news_app/src/ui/views/sources_view/sources_view.dart';
import 'package:canton_news_app/src/ui/views/top_stories_view/top_stories_view.dart';

final _topStoriesNavigatorKey = GlobalKey<NavigatorState>();
final _sourcesNavigatorKey = GlobalKey<NavigatorState>();
final _categoriesNavigatorKey = GlobalKey<NavigatorState>();

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
    if (index == _currentIndex && _currentIndex == 0 && _topStoriesNavigatorKey.currentState!.canPop()) {
      _topStoriesNavigatorKey.currentState!.pop();
    }
    if (index == _currentIndex && _currentIndex == 1 && _sourcesNavigatorKey.currentState!.canPop()) {
      _sourcesNavigatorKey.currentState!.pop();
    }
    if (index == _currentIndex && _currentIndex == 2 && _categoriesNavigatorKey.currentState!.canPop()) {
      _categoriesNavigatorKey.currentState!.pop();
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
          Navigator(
            key: _topStoriesNavigatorKey,
            // observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())],
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                settings: settings,
                fullscreenDialog: true,
                builder: (context) => SafeArea(child: _views[_currentIndex]),
              );
            },
          ),
          Navigator(
            key: _sourcesNavigatorKey,
            // observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())],
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                settings: settings,
                fullscreenDialog: true,
                builder: (context) => SafeArea(child: _views[_currentIndex]),
              );
            },
          ),
          Navigator(
            key: _categoriesNavigatorKey,
            // observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())],
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                settings: settings,
                fullscreenDialog: true,
                builder: (context) => SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: _views[_currentIndex],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
