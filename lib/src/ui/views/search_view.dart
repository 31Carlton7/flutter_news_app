import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/environment_config.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/ui/providers/news_search_future_provider.dart';
import 'package:canton_news_app/src/ui/providers/recent_searches_provider.dart';
import 'package:canton_news_app/src/ui/styled_components/error_body.dart';
import 'package:canton_news_app/src/ui/styled_components/result_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchView extends StatefulWidget {
  final searchController = TextEditingController();

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: <Widget>[
        _header(context),
        _body(),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Search',
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: cantonSuccess[600]),
        ),
        Text(
          'News from all over the world',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: cantonGrey[600]),
        ),
        SizedBox(height: 20),
        CantonTextInput(
          isTextInputTwo: true,
          isTextFormField: true,
          obscureText: false,
          hintText: 'Search topics, sources & locations',
          prefixIcon:
              Icon(FeatherIcons.search, size: 24, color: cantonGrey[600]),
          controller: widget.searchController,
          onChanged: (_) {
            setState(() {
              context.refresh(newsSearchFutureProvider);
              _body();
            });
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _body() {
    return Expanded(
      child: ([null, ''].contains(widget.searchController.text)) ||
              newsSearchFutureProvider == null
          ? _recentSearchesList()
          : _resultsList(),
    );
  }

  Widget _recentSearchesList() {
    return Column(
      children: <Widget>[
        Text(
          'Recent',
          style: textTheme(context).headline5.copyWith(color: cantonGrey[600]),
        ),
        Consumer(
          builder: (context, watch, child) {
            final searches = watch(recentSearchesProvider);
            return (searches.getRecentSearches.length != 0)
                ? Expanded(
                    child: ListView.separated(
                      itemCount: searches.getRecentSearches.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 7);
                      },
                      itemBuilder: (context, index) {
                        return Text(searches.getRecentSearches[index]);
                      },
                    ),
                  )
                : Text(
                    'No recent searches',
                    style: textTheme(context)
                        .bodyText1
                        .copyWith(color: cantonGrey[600]),
                  );
          },
        ),
      ],
    );
  }

  Widget _resultsList() {
    return Consumer(
      builder: (context, watch, child) {
        final _environmentConfig = EnvironmentConfig();
        path =
            'https://newsapi.org/v2/everything?q=${widget.searchController.text}&apiKey=${_environmentConfig.newsApiKey}';
        return watch(newsSearchFutureProvider).when(
          error: (e, s) {
            if (e is NewsExceptions) {
              return ErrorBody(e.message);
            }
            return Center(
              child: Text(
                'Oops, something unexpected happened :(',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: cantonGrey[600]),
              ),
            );
          },
          loading: () => Center(
            child: SpinKitChasingDots(
              color: cantonSuccess[600],
            ),
          ),
          data: (results) {
            return Column(
              children: <Widget>[
                Text(
                  'Top Results',
                  style: textTheme(context)
                      .headline5
                      .copyWith(color: cantonGrey[600]),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    itemCount: results.length != 0 ? results.length : 1,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 3.5);
                    },
                    itemBuilder: (context, index) {
                      return results.length != 0
                          ? ResultCard(result: results[index])
                          : Text(
                              'No Results',
                              style: textTheme(context)
                                  .headline6
                                  .copyWith(color: cantonGrey[600]),
                            );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
