import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poem/ui/features/search_screen.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          title: Text('Settings'),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
            child: SettingsCard(
          title: 'Dark Theme',
          isChanged: true,
          onChanged: (isChanged) {},
        )),
        SliverToBoxAdapter(
            child: SettingsCard(
          title: 'Notification',
          isChanged: true,
          onChanged: (isChanged) {},
        )),
        SliverToBoxAdapter(
            child: SettingsCard(
          title: 'Allow analitics',
          isChanged: false,
          onChanged: (isChanged) {},
        )),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
            child: SettingsActionCard(
          title: 'Delete history',
          onTap: () {},
          iconData: Icons.delete,
        )),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
            child: SettingsActionCard(
          title: 'Support',
          onTap: () {},
          iconData: Icons.support,
        )),
      ],
    );
  }
}

class SettingsActionCard extends StatelessWidget {
  const SettingsActionCard({
    super.key,
    required this.title,
    this.onTap,
    this.iconData,
  });
  final String title;
  final VoidCallback? onTap;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BaseContainer(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                iconData,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.title,
    required this.isChanged,
    this.onChanged,
  });

  final String title;
  final bool isChanged;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BaseContainer(
        height: 16,
        width: double.infinity,
        margin: const EdgeInsets.all(2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
              CupertinoSwitch(value: isChanged, onChanged: onChanged)
            ],
          ),
        ),
      ),
    );
  }
}
