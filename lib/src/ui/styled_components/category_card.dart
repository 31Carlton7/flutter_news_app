import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/ui/views/source_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.name);

  @required
  final Source name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => viewTransition(context, SourceView(name)),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  name.category.substring(0, 1),
                  style: textTheme(context).headline5.copyWith(
                        color: cantonSuccess[600],
                      ),
                ),
              ),
              SizedBox(width: 7),
              Expanded(
                child: Text(
                  name.category,
                  style: textTheme(context)
                      .headline6
                      .copyWith(color: cantonGrey[900]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
