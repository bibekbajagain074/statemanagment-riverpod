import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../my_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  // int counter = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(counter_Provider);

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(name)]),
      ),
    );
  }
}
