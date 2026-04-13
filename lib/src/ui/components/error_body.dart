import 'package:canton_design_system/canton_design_system.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorBody extends StatelessWidget {
  final String? message;
  final ProviderBase provider;

  const ErrorBody(this.message, this.provider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message ?? 'An error occurred',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                ),
          ),
          const SizedBox(height: 12),
          CantonPrimaryButton(
            buttonText: 'Retry',
            textColor: CantonColors.white,
            containerWidth: MediaQuery.of(context).size.width / 2 - 34,
            onPressed: () => context.refresh(provider),
          ),
        ],
      ),
    );
  }
}
