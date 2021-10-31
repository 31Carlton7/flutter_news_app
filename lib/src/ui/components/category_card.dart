import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/ui/views/category_view/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.source);

  @required
  final Source source;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CantonMethods.viewTransition(context, CategoryView(source)),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  source.category!.substring(0, 1),
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(width: 7),
              Expanded(
                child: Text(source.category!, style: Theme.of(context).textTheme.headline6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
