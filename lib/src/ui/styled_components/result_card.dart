import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';

class ResultCard extends StatelessWidget {
  final Article result;

  const ResultCard({this.result});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                result.name.substring(0, 1),
                style: textTheme(context).headline5.copyWith(
                      color: cantonSuccess[600],
                    ),
              ),
            ),
            SizedBox(width: 7),
            Expanded(
              child: Text(
                result.name,
                style: textTheme(context)
                    .headline6
                    .copyWith(color: cantonGrey[900]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
