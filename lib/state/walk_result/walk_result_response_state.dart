// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/walk_record.dart';

part 'walk_result_response_state.freezed.dart';

@freezed
class WalkResultResponseState with _$WalkResultResponseState {
  const factory WalkResultResponseState({
    @Default(AsyncValue<List<WalkRecord>>.loading()) AsyncValue<List<WalkRecord>> walkRecordList,
    @Default(AsyncValue<Map<String, WalkRecord>>.loading()) AsyncValue<Map<String, WalkRecord>> walkRecordMap,
  }) = _WalkResultResponseState;
}
