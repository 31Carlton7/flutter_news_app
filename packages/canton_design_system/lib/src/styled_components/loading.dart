import 'package:canton_design_system/canton_design_system.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitChasingDots(
        color: cantonSuccess[600],
      ),
    );
  }
}
