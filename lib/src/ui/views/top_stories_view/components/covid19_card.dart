import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/ui/views/covid19_view/covid19_view.dart';

class COVID19Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CantonMethods.viewTransition(context, COVID19View());
      },
      child: Card(
        margin: const EdgeInsets.all(1),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'COVID-19 News: ',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      TextSpan(
                        text: 'Get the latest coverage of the coronavirus pandemic.',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ),
              CantonArrowButton(view: COVID19View()),
            ],
          ),
        ),
      ),
    );
  }
}
