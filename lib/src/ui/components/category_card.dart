import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/ui/views/category_view/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.source, {Key? key}) : super(key: key);

  final Source source;

  @override
  Widget build(BuildContext context) {
    final category = source.category ?? '';
    return GestureDetector(
      onTap: () => CantonMethods.viewTransition(context, CategoryView(source)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  category.isNotEmpty ? category.substring(0, 1) : '?',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Text(category, style: Theme.of(context).textTheme.headline6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
