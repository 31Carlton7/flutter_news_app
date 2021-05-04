import 'package:canton_design_system/canton_design_system.dart';

class COVID19Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'COVID-19 News: ',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: CantonColors.green,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    TextSpan(
                      text: 'Get the latest coverage of the coronavirus',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: CantonColors.textPrimary),
                    ),
                  ],
                ),
              ),
            ),
            CantonHeaderButton(
              icon: IconlyIcon(
                IconlyBold.ArrowRight1,
                color: CantonColors.iconSecondary,
              ),
              radius: 35,
              size: 55.0,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
