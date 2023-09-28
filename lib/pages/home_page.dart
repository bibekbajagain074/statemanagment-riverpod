import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../my_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  onSubmit(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).upDatename(value);
  }

  onSubmitAge(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).upDateAge(int.parse(value));
  }

  // int counter = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            onSubmitted: (value) => onSubmit(ref, value),
          ),
          TextField(
            onSubmitted: (value) => onSubmitAge(ref, value),
          ),
          Text(user.age.toString()),
        ]),
      ),
    );
  }
}
