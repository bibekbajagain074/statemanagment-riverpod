import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/person.dart';

final personProvider =
    StateNotifierProvider<PersonNotifier, List<PersonModel>>((ref) {
  return PersonNotifier(PersonModel(address: "", age: 0, job: "", name: ''));
});

class PersonNotifier extends StateNotifier<List<PersonModel>> {
  PersonNotifier(PersonModel personModel) : super([]);

  void addPerson(PersonModel personModel) {
    state = [...state, personModel];
  }
}
