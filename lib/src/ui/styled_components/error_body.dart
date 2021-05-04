import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/ui/providers/news_future_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorBody extends ConsumerWidget {
  final String message;

  ErrorBody(this.message);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: cantonGrey[600]),
          ),
        ),
        SizedBox(height: 12),
        CantonPrimaryButton(
          buttonText: 'Retry',
          containerColor: CantonColors.green,
          textColor: cantonGrey[100],
          containerWidth: MediaQuery.of(context).size.width / 2 - 74,
          enabled: true,
          onPressed: () => context.refresh(newsFutureProvider),
        ),
      ],
    ));
  }
}
