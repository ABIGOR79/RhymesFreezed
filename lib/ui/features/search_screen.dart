import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          title: Text('Rhymer'),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(72),
            child: SearchButton(
              onTap: () {
                _showSearchBottom(context);
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 100,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              final listRyfm = List.generate(4, (index) => 'Ryfm $index');
              return RhymeHistoryCard(listRyfm: listRyfm);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 4);
            },
          ),
        )),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverList.separated(
          itemBuilder: (context, index) {
            return RhymeContainer(
              rhyme: 'Rhyme',
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 2);
          },
        )
      ],
    );
  }

  void _showSearchBottom(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 2,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SearchRhymesBottomSheet(theme: theme),
            ));
  }
}

class SearchRhymesBottomSheet extends StatelessWidget {
  const SearchRhymesBottomSheet({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: theme.hintColor.withAlpha(50),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      )),
                ),
                SizedBox(width: 4),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                      color: theme.primaryColor.withRed(500),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1, color: Colors.grey)),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Expanded(
              child: ListView.separated(
            itemCount: 15,
            itemBuilder: (context, index) => ListTile(
              title: Text('SomeThing'),
            ),
            separatorBuilder: (context, _) {
              return Divider(
                height: 1,
                color: Colors.grey,
              );
            },
          ))
        ],
      ),
    );
  }
}

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      child: SizedBox(width: double.infinity, child: child),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: theme.highlightColor,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Icon(Icons.search_rounded),
            SizedBox(width: 8),
            Text('Search', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class RhymeHistoryCard extends StatelessWidget {
  const RhymeHistoryCard({
    super.key,
    required this.listRyfm,
  });

  final List<String> listRyfm;

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      width: 150,
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rifma',
            style: TextStyle(
                color: Colors.red, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              listRyfm.asMap().entries.map((e) {
                final sb = StringBuffer();
                sb.write(e.value);

                if (e.key != listRyfm.length - 1) {
                  sb.write(', ');
                }
                return sb.toString();
              }).join(),
              // listRyfm.map((e) => '$e,   ').join(),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),

          // Wrap(
          //   children: listRyfm
          //       .map((e) => Padding(
          //             padding: EdgeInsets.only(right: 2),
          //             child: Text(e),
          //           ))
          //       .toList(),
          // )
        ],
      ),
    );
  }
}

class RhymeContainer extends StatelessWidget {
  const RhymeContainer({
    super.key,
    this.isFavorite = false,
    required this.rhyme,
    this.sourceWord,
  });

  final String rhyme;
  final String? sourceWord;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: theme.canvasColor.withAlpha(500),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (sourceWord != null) ...[
                Text(sourceWord!),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(Icons.forward),
                ),
                Text(rhyme),
              ],
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: isFavorite
                    ? theme.primaryColor
                    : theme.highlightColor.withAlpha(200),
              ))
        ],
      ),
    );
  }
}

class BaseContainer extends StatelessWidget {
  const BaseContainer(
      {super.key,
      required this.child,
      this.width,
      required this.margin,
      this.height});

  final Widget child;
  final double? width;
  final EdgeInsets margin;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        width: width,
        margin: margin,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: theme.cardColor, borderRadius: BorderRadius.circular(16)),
        child: child);
  }
}
