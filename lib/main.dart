import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/walk_result/walk_result.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walkResult = ref.watch(walkResultProvider);

    return Scaffold(
      body: SafeArea(
        child: (walkResult.value == null || walkResult.value!.walkRecordMap.value == null)
            ? Container()
            : walkResult.value!.walkRecordMap.when(
                data: (data) {
                  return SingleChildScrollView(
                    child: Column(
                      children: data.entries.map((e) {
                        return Text(e.value.distance.toString());
                      }).toList(),
                    ),
                  );
                },
                error: (e, s) => const Center(child: Text('error')),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),

        // child: (walkResult.value == null || walkResult.value!.walkRecordList.value == null)
        //     ? Container()
        //     : walkResult.value!.walkRecordList.when(
        //         data: (data) {
        //           return ListView.builder(
        //             itemCount: data.length,
        //             itemBuilder: (context, index) {
        //               return Text(data[index].step.toString());
        //             },
        //           );
        //         },
        //         error: (e, s) => const Center(child: Text('error')),
        //         loading: () => const Center(child: CircularProgressIndicator()),
        //       ),

        // child: walkRecord.when(
        //   data: (data) {
        //     return ListView.builder(
        //       itemCount: data.length,
        //       itemBuilder: (context, index) {
        //         return Text(data[index].date.yyyymmdd);
        //       },
        //     );
        //   },
        //   error: (e, s) => const Center(child: Text('error')),
        //   loading: () => const Center(child: CircularProgressIndicator()),
        // ),
      ),
    );
  }
}
