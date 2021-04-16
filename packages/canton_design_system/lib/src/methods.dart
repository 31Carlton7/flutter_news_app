import 'package:canton_design_system/canton_design_system.dart';

void defocusTextfield(BuildContext context) =>
    FocusScope.of(context).requestFocus(new FocusNode());

Future<void> viewTransition(BuildContext context, Widget view) =>
    Navigator.push(
      context,
      PageTransition(
        child: view,
        type: PageTransitionType.slideInLeft,
        curve: Curves.ease,
        duration: Duration(milliseconds: 300),
      ),
    );
