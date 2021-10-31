import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/ui/components/category_card.dart';
import 'package:canton_news_app/src/ui/views/category_list_view/components/category_list_view_header.dart';

class CategoryListView extends StatefulWidget {
  final searchController = TextEditingController();

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      padding: EdgeInsets.zero,
      body: _content(context),
    );
  }

  List<String> categories = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

  Widget _content(BuildContext context) {
    return Column(
      children: <Widget>[
        CategoryListViewHeader(),
        SizedBox(height: 7),
        _body(),
      ],
    );
  }

  Widget _body() {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return CategoryCard(Source(category: categories[index]));
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 7);
        },
        itemCount: 7,
      ),
    );
  }
}
