import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:poem/ui/features/search_screen.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final rhymes = <String>[
      'hfhfhf',
      'gssgd',
      'hfhfhf',
      'gssgd',
      'hfhfhf',
      'gssgd',
      'hfhfhf',
      'gssgd',
      'hfhfhf',
      'gssgd'
    ];
    // final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          title: Text('History'),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverPadding(
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: rhymes.length,
              (BuildContext context, int index) {
                final rhyme = rhymes[index];
                return
                    // Container(
                    //   alignment: Alignment.center,
                    //   color: Colors.teal[100 * (index % 9)],
                    //   child: Text('item $index'),
                    // );
                    RhymeHistoryCard(
                  listRyfm: rhymes,

                  // word: rhyme.queryWord,
                  // rhymes: rhyme.words,
                  // onTap: () => _openSearchScreen(
                  //   context,
                  //   rhyme.queryWord,
                  // ),
                );
              },
            ),
          ),
          padding: EdgeInsets.all(2),
        ),
      ],
    );
  }
}
