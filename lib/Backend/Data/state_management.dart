import 'package:flutter_riverpod/flutter_riverpod.dart';

//Auth
final userEmail = StateProvider((ref) => 'null');
final userPassword = StateProvider((ref) => 'null');

//Provider for handling the index of bottom navigation bar
final bottomBarindexProvider = StateProvider((ref) => 0);

//Question String
final mcqQuestion = StateProvider((ref) => 'Processing Question');
