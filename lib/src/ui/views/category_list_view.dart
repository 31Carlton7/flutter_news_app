import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/ui/styled_components/category_card.dart';

class CategoryListView extends StatefulWidget {
  final searchController = TextEditingController();

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      body: _content(context),
    );
  }

  List<String> categories = [
    'Business',
    'Entertainment',
    'General',
    'Politics',
    'Health',
    'Science',
    'Sports',
    'Technology',
    'Covid19',
  ];

  Widget _content(BuildContext context) {
    return Column(
      children: <Widget>[
        _header(context),
        SizedBox(height: 7),
        _body(),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CantonBackButton(isClear: true),
        Text(
          'Categories',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: cantonSuccess[600],
              ),
        ),
        Container(width: 60),
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
          itemCount: 9),
    );
  }
}
