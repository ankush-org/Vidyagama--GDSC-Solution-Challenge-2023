import 'package:flutter_riverpod/flutter_riverpod.dart';

//Auth
final userEmail = StateProvider((ref) => 'null');
final userPassword = StateProvider((ref) => 'null');
final userName = StateProvider((ref) => 'null');
final user = StateProvider((ref) => "");

//Provider for handling the index of bottom navigation bar
final bottomBarindexProvider = StateProvider((ref) => 0);

//Home
final resumeVideo = StateProvider((ref) => '0');

//Test
//Question String
final mcqQuestion = StateProvider((ref) => 'Processing Question');
