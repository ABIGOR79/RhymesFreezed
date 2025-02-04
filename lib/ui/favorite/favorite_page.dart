import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:poem/ui/features/search_screen.dart';

@RoutePage()
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          title: Text('Favorite'),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverList.separated(
          itemBuilder: (context, index) {
            return RhymeContainer(
              rhyme: "Rhyme",
              isFavorite: true,
              sourceWord: 'Word',
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 2);
          },
        )
      ],
    );
  }
}
