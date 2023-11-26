import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../model/walk_record.dart';

import 'walk_result_response_state.dart';

part 'walk_result.g.dart';

@riverpod
Future<WalkResultResponseState> walkResult(WalkResultRef ref) async {
  List<WalkRecord> list = [];
  Map<String, WalkRecord> map = {};

  await HttpClient().post(path: APIPath.getWalkRecord2).then((value) {
    for (var i = 0; i < value.length.toString().toInt(); i++) {
      var val = WalkRecord.fromJson(value[i] as Map<String, dynamic>);

      list.add(WalkRecord.fromJson(value[i] as Map<String, dynamic>));
      map[val.date.yyyymmdd] = val;
    }
  });

  return WalkResultResponseState(walkRecordList: AsyncValue.data(list), walkRecordMap: AsyncValue.data(map));
}
