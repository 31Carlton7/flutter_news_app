import 'package:canton_design_system/src/styled_components/buttons/primary_button.dart';
import '../../../canton_design_system.dart';

class CantonBackButton extends StatelessWidget {
  final void Function() onPressed;
  const CantonBackButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CantonPrimaryButton(
      containerColor: cantonGrey[200],
      containerHeight: 60.0,
      containerWidth: 60.0,
      radius: 50,
      containerPadding: const EdgeInsets.all(0),
      prefixIcon: FeatherIcons.chevronLeft,
      alignment: MainAxisAlignment.center,
      iconColor: cantonGrey[600],
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}
