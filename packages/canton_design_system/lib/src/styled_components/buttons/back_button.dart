import 'package:canton_design_system/src/styled_components/buttons/primary_button.dart';
import '../../../canton_design_system.dart';

class CantonBackButton extends StatelessWidget {
  final bool isClear;
  const CantonBackButton({this.isClear});
  @override
  Widget build(BuildContext context) {
    return CantonPrimaryButton(
      containerColor:
          [null, false].contains(isClear) ? cantonGrey[200] : cantonInvisible,
      containerHeight: 60.0,
      containerWidth: 60.0,
      radius: 50,
      containerPadding: const EdgeInsets.all(0),
      prefixIcon: FeatherIcons.chevronLeft,
      alignment: [null, false].contains(isClear)
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      iconColor: [null, false].contains(isClear)
          ? cantonGrey[600]
          : Theme.of(context).primaryColor,
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
