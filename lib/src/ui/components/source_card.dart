import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/ui/views/source_view/source_view.dart';

class SourceCard extends StatelessWidget {
  const SourceCard(this.source);

  @required
  final Source source;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CantonMethods.viewTransition(context, SourceView(source)),
      child: Column(
        children: [
          Container(
            color: CantonMethods.alternateCanvasColor(context),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      source.name!.substring(0, 1),
                      style: Theme.of(context).textTheme.headline5!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(source.name!, style: Theme.of(context).textTheme.headline6),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
