import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myproject/services/data_handeler/data_handeler.dart';

class Test1 extends StatelessWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final data = await DataHandeler().fetchhotelpost();
        data.forEach((element) {
          print(element.toMap());
        });
      }),
    );
  }
}
