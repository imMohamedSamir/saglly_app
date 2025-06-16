import 'dart:developer';
import 'dart:io';

import 'package:share_plus/share_plus.dart';

final SharePlus sharePlus = SharePlus.instance;

abstract class ShareService {
  static void share(String text) async {
    final result = await sharePlus.share(ShareParams(text: text));
    log(result.status.toString());
    // Share text
  }

  static Future<bool> shareFile({
    required File file,
    required String filename,
  }) async {
    final xfile = XFile(file.path);
    final result = await sharePlus.share(
      ShareParams(files: [xfile], text: filename),
    );

    if (result.status == ShareResultStatus.success) {
      return true;
    } else {
      return false;
    }
  }
}
