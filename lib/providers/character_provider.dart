import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickandmortyapp/model/models.dart';
import 'package:rickandmortyapp/providers/dio_provider.dart';

final characterProvider = FutureProvider<Model>((ref) async {
  final data = ref.read(dioProvider).get('/character');
  return Model.fromJson((await data).data);
});
