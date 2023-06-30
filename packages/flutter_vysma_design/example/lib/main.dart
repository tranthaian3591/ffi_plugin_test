import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vysma_design/flutter_vysma_design.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get a copy of the index.
  final instance = await VysmaDesign.defaultInstance;
  final index = instance.getIndex('default');

  final a = await index.helloWorld();

  print(a);

  // Finally, run our application.
  runApp(ProviderScope(
    overrides: [indexProvider.overrideWith((_) => index)],
    child: MaterialApp(
      title: 'Vysma Design Demo',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const Body(),
    ),
  ));
}

// The providers needed for this example.
final indexProvider =
    Provider<VysmaDesignIndex>((_) => throw UnimplementedError());
final queryProvider = StateProvider((_) => '');

class Body extends HookConsumerWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Vysma Design Demo'),
          actions: [
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: () => {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: TextField(
                controller: textController,
                onChanged: (q) => ref.read(queryProvider.notifier).state = q,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      textController.text = '';
                      ref.read(queryProvider.notifier).state = '';
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        body: const Text("len hinh"));
  }
}
