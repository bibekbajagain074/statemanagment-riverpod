// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../my_provider.dart';

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});
//   onSubmit(WidgetRef ref, String value) {
//     ref.read(userProvider.notifier).upDatename(value);
//   }

//   onSubmitAge(WidgetRef ref, String value) {
//     ref.read(userProvider.notifier).upDateAge(int.parse(value));
//   }

//   // int counter = 0;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final user = ref.watch(userProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(user.name),
//       ),
//       body: Center(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           TextField(
//             onSubmitted: (value) => onSubmit(ref, value),
//           ),
//           TextField(
//             onSubmitted: (value) => onSubmitAge(ref, value),
//           ),
//           Text(user.age.toString()),
//         ]),
//       ),
//     );
//   }
// }

import 'package:countapp/model/person.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Provider/person_provider.dart';

class HomePage2 extends ConsumerWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PersonModel> person = ref.watch(personProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'State Notifier Provider Example',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Add Person',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 13,
                  ),
                  child:  Column(
                    children: [
                      Text(
                        "Name is ${person[index].name}",
                        
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Age is${person[index].age} ",
                        style: TextStyle(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Job is ${person[index].job} ",
                      ),
                    ],
                  )),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
           ElevatedButton(
            onPressed: () {
              ref.read(personProvider.notifier).addPerson(
                    PersonModel(
                      name: 'Sherlock',
                      address: '221B Baker Street',
                      age: 27,
                      job: 'Detective Consultant',
                    ),
                  );
            },
            child: const Text('Add Person'),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
