import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/ui/views/source_view/source_view.dart';

class SourceCard extends StatelessWidget {
  const SourceCard(this.source, {Key? key}) : super(key: key);

  final Source source;

  @override
  Widget build(BuildContext context) {
    final name = source.name ?? '';
    return GestureDetector(
      onTap: () => CantonMethods.viewTransition(context, SourceView(source)),
      child: Column(
        children: [
          Container(
            color: CantonMethods.alternateCanvasColor(context),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    name.isNotEmpty ? name.substring(0, 1) : '?',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Text(name, style: Theme.of(context).textTheme.headline6),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
