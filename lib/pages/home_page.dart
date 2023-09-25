import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../my_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  // int counter = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counter_Provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(counter_Provider.notifier)
                          .update((state) => state + 1);
                    },
                    child: Text("+")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(counter_Provider.notifier)
                          .update((state) => state - 1);
                    },
                    child: Text("-")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
