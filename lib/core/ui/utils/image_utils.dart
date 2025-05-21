import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

class ImageUtils {
  ///Completer function to convert asset or file image to [ui.Image] before drawing on custompainter.
  static Future<ui.Image> convertImage(Uint8List img) async {
    final completer = Completer<ui.Image>();
    ui.decodeImageFromList(img, (image) {
      return completer.complete(image);
    });
    return completer.future;
  }
}

extension UiImageExt on ui.Image {
  Size get imageSize => Size(width.toDouble(), height.toDouble());
}
