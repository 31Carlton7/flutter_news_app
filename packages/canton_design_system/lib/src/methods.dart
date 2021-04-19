import 'package:canton_design_system/canton_design_system.dart';

/// Defocuses a textfield
void defocusTextfield(BuildContext context) =>
    FocusScope.of(context).requestFocus(new FocusNode());

/// Default transition for switching views
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

/// Adds '...' to the end of a string
String addDotsToString(String string, int index) {
  List<String> wordList = string.split(' ');

  String result =
      wordList.sublist(0, index).join(' ').replaceAll(RegExp(r' '), ' ') +
          '...';

  return result;
}
