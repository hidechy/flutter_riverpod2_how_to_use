import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../model/walk_record.dart';

part 'walk_record.g.dart';

@riverpod
Future<List<WalkRecord>> walkRecord(WalkRecordRef ref) async {
  List<WalkRecord> list = [];

  await HttpClient().post(path: APIPath.getWalkRecord2).then((value) {
    for (var i = 0; i < value.length.toString().toInt(); i++) {
      list.add(WalkRecord.fromJson(value[i] as Map<String, dynamic>));
    }
  });

  return list;
}
