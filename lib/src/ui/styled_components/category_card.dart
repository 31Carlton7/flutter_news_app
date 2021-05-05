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
      onTap: () =>
          CantonMethods.viewTransition(context, SourceView(name, false)),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  name.category.substring(0, 1),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: CantonColors.green),
                ),
              ),
              SizedBox(width: 7),
              Expanded(
                child: Text(
                  name.category,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: CantonColors.textPrimary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
