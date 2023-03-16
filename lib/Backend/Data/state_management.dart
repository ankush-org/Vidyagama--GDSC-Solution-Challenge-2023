import 'package:flutter_riverpod/flutter_riverpod.dart';

//Provider for handling the index of bottom navigation bar
final bottomBarindexProvider = StateProvider((ref) => 0);

//Question String
final mcqQuestion = StateProvider((ref) => 'Processing Question');
