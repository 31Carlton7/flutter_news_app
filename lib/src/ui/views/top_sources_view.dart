import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/ui/providers/news_sources_future_provider.dart';
import 'package:canton_news_app/src/ui/styled_components/error_body.dart';
import 'package:canton_news_app/src/ui/styled_components/source_card.dart';
import 'package:canton_news_app/src/ui/styled_components/unexpected_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopSourcesView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return CantonScaffold(
      body: _content(context, watch),
    );
  }

  Widget _content(BuildContext context, ScopedReader watch) {
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
            _header(context),
            CupertinoSliverRefreshControl(
              onRefresh: () async => await context.refresh(newsSourcesProvider),
            ),
            _sourcesList(context, sources),
          ],
        );
      },
    );
  }

  Widget _header(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      title: Text(
        'Sources',
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: CantonColors.green),
      ),
      centerTitle: true,
    );
  }

  Widget _sourcesList(BuildContext context, List<Source> sources) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (sources.length != 0) {
            return SourceCard(sources[index]);
          } else {
            Center(
              child: Text(
                'Error :(',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: CantonColors.textSecondary),
              ),
            );
          }
          return Container();
        },
        childCount: sources.length,
      ),
    );
  }
}
