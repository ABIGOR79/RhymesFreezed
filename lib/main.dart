import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:poem/api/api.dart';
import 'package:poem/router/app_router.dart';
import 'package:poem/ui/test_page/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final apiClient = RhymerApiClient.create(apiUrl: dotenv.env['API_URL']);
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: PoemApp()));
}

class PoemApp extends StatefulWidget {
  const PoemApp({super.key});

  @override
  State<PoemApp> createState() => _PoemAppState();
}

class _PoemAppState extends State<PoemApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color.fromARGB(255, 226, 13, 88);
    return MaterialApp.router(
      title: 'Poem',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        scaffoldBackgroundColor: Colors.grey,
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}




// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             backgroundColor: const Color.fromARGB(255, 87, 224, 239),
//             snap: true,
//             floating: true,
//             expandedHeight: 70, // Нужно место для текстового поля
//             flexibleSpace: FlexibleSpaceBar(
//               background: Padding(
//                 padding: const EdgeInsets.only(
//                     top: kToolbarHeight), // Отступ под AppBar
//                 child: Container(
//                   margin: const EdgeInsets.all(16.0),
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   height: 50, // Фиксированная высота
//                   decoration: BoxDecoration(
//                     color: theme.colorScheme.surface,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.search_rounded, color: Colors.black54),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: TextField(
//                           controller: textController,
//                           decoration: const InputDecoration(
//                             hintText: 'Search',
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.only(top: 8),
//             sliver: SliverList.separated(
//               itemBuilder: (context, index) {
//                 return Container(
//                   width: double.infinity,
//                   height: 40,
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   alignment: Alignment.centerLeft,
//                   decoration: BoxDecoration(
//                     color: theme.colorScheme.surfaceVariant,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Text(
//                     "Item ${index + 1}",
//                     style: theme.textTheme.bodyLarge,
//                   ),
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) {
//                 return const Divider(height: 4);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }