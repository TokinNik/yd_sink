import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' show get;
import 'package:path_provider/path_provider.dart';
import 'package:template_app/core/singletons/loggers/log.dart';

const String ANDROID_DOWNLOADS_PATH = "/storage/emulated/0/Download";

class FileUtils {
  static Future<String> getPlatformStoragePath() async {
    var path = "";

    try {
      if (Platform.isAndroid) {
        // path = ANDROID_DOWNLOADS_PATH;
        path = (await getApplicationDocumentsDirectory()).path;
      } else {
        path = (await getApplicationDocumentsDirectory()).path;
      }
    } catch (e) {
      logE("getPlatformStoragePath Error: ${e.toString()}");
    }

    return path;
  }

  static Future<File> imageToFile(
      {required String imagePath, String imageName = 'temp'}) async {
    var bytes = await rootBundle.load(imagePath);

    String tempPath =
        (await getDownloadsDirectory() ?? await getApplicationCacheDirectory())
            .path;

    File file = File('$tempPath/$imageName.png');

    await file.writeAsBytes(
      bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
    );

    logE("Created file from image: $file");

    return file;
  }

  static String getNameFromPath(String path) => path.split('/').last;

  static Future<String> getCachePathFromUrl(String url) async {
    var cavhePath = await getPlatformStoragePath();
    return "$cavhePath/${getNameFromPath(url)}";
  }

  // todo rework
  // static Future<List<DefectPhotoModel>> savePhotosInCache(
  //   List<String> pathList,
  //   List<String> remoteIds,
  // ) async {
  //   var cachePath = await getPlatformStoragePath();
  //   List<DefectPhotoModel> uploadedPhotos = [];
  //
  //   for (var i = 0; i < remoteIds.length; i++) {
  //     var file = File(pathList[i]);
  //     var newPath = "$cachePath/${getNameFromPath(remoteIds[i])}.jpg";
  //     await file.copy(newPath);
  //     uploadedPhotos.add(DefectPhotoModel(
  //       uploadedId: remoteIds[i],
  //       cachedPath: newPath,
  //     ));
  //     logD("FileUtils: savePhotosInCache: copy ${pathList[i]} to $newPath");
  //   }
  //
  //   return uploadedPhotos;
  // }

  static Future<String> savePhotoInCacheFromSystemPath(
    String systemPath,
  ) async {
    var cachePath = await getPlatformStoragePath();
    var newPath = "$cachePath/${getNameFromPath(systemPath)}";
    var file = File(systemPath);
    await file.copy(newPath);
    logD(
        "FileUtils:savePhotoInCacheFromSystemPath: copy $systemPath to $newPath");
    return newPath;
  }

  static Future<File> savePhotoInCacheFromUrl(
    String url,
  ) async {
    var response = await get(Uri.parse(url));

    var cachePath = await getPlatformStoragePath();

    var newPath = "$cachePath/${getNameFromPath(url)}";
    var file = File(newPath);
    file.writeAsBytesSync(response.bodyBytes);

    logD("FileUtils: savePhotoInCache: to $newPath");

    return file;
  }
}
