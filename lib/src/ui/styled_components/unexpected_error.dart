import 'package:canton_design_system/canton_design_system.dart';

class UnexpectedError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Oops, something unexpected happened :(',
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: cantonGrey[600]),
      ),
    );
  }
}
