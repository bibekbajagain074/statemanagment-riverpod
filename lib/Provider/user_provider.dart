import 'package:countapp/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider < UserNotifier, User>
   ((ref) => UserNotifier(const User(age: 0, name: "")));
