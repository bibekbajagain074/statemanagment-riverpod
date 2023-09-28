import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class User {
  final String name;
  final int age;

  const User({
    required this.age,
    required this.name,
  });
// generate data class

  usercopyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      age: map['age'],
    );
  }
  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
  @override
  String toString() => 'User(name: $name, age: $age)';
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);
  void upDatename(String n, ) {
    // state = User(age: state.age, name: n); doing this for all is complex so we use data class as above
    state = state.usercopyWith(name: n);
    
  }

  void upDateAge(int a) {
    // state = User(age: state.age, name: n); doing this for all is complex so we use data class as above

    state = state.usercopyWith(age: a);
  }
}
