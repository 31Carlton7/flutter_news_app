import 'package:canton_design_system/canton_design_system.dart';

class CantonScaffold extends StatelessWidget {
  final Widget body;
  final EdgeInsets padding;

  const CantonScaffold({
    Key key,
    this.body,
    this.padding = const EdgeInsets.only(top: 17, left: 17, right: 17),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => defocusTextfield(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: padding,
            child: body,
          ),
        ),
      ),
    );
  }
}
