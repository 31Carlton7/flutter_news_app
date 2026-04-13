import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/ui/components/category_card.dart';
import 'package:canton_news_app/src/ui/views/category_list_view/components/category_list_view_header.dart';

class CategoryListView extends StatelessWidget {
  static const _categories = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      padding: EdgeInsets.zero,
      body: Column(
        children: <Widget>[
          CategoryListViewHeader(),
          const SizedBox(height: 7),
          Expanded(
            child: ListView.separated(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return CategoryCard(Source(category: _categories[index]));
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 7);
              },
            ),
          ),
        ],
      ),
    );
  }
}
