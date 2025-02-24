import 'dart:io';

import 'package:gyw_base_ardent1/src/model/drawing_parts/icons.dart';
import 'package:test/test.dart';

void main() {
  group('Icons', () {
    test('path exits', () {
      List<GYWIcon> iconList = GYWIcon.values;
      for (var icon in iconList) {
        String localPath = '${Directory.current.path}/${icon.pathPng}';
        File(localPath).exists().then((result) {
          assert(result);
        });
      }
    });
  });
}
