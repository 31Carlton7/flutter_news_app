import 'package:canton_design_system/canton_design_system.dart';

class COVID19Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'COVID-19 News: ',
                      style: textTheme(context).bodyText1.copyWith(
                          color: cantonSuccess[600],
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: 'Get the latest coverage of the coronavirus',
                      style: textTheme(context)
                          .bodyText1
                          .copyWith(color: cantonGrey[900]),
                    ),
                  ],
                ),
              ),
            ),
            CantonHeaderButton(
              icon: FeatherIcons.chevronRight,
              radius: 35,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
