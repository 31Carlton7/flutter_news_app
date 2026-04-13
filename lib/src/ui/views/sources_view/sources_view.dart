import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/providers/news_sources_future_provider.dart';
import 'package:canton_news_app/src/ui/components/error_body.dart';
import 'package:canton_news_app/src/ui/components/source_card.dart';
import 'package:canton_news_app/src/ui/components/unexpected_error.dart';
import 'package:canton_news_app/src/ui/views/sources_view/components/sources_view_header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourcesView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(newsSourcesProvider).when(
      loading: () => Loading(),
      error: (e, s) {
        if (e is NewsExceptions) {
          return ErrorBody(e.message, newsSourcesProvider);
        }
        return UnexpectedError(newsSourcesProvider);
      },
      data: (sources) {
        return CustomScrollView(
          slivers: [
            SourcesViewHeader(),
            _sourcesList(context, sources),
          ],
        );
      },
    );
  }

  Widget _sourcesList(BuildContext context, List<Source> sources) {
    if (sources.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Text(
            'No sources available',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                ),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              if (index == 0) const Divider(),
              SourceCard(sources[index]),
            ],
          );
        },
        childCount: sources.length,
      ),
    );
  }
}
