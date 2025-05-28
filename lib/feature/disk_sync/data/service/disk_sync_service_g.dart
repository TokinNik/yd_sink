// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disk_sync_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _DiskSyncService implements DiskSyncService {
  _DiskSyncService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<Resource> getFolder({
    required String folder,
    int? limit = 40,
    int? offset = 0,
    String? sort = '-modified',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'limit': limit, r'offset': offset, r'sort': sort};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Resource>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(_dio.options, '/disk/resources?path=${folder}', queryParameters: queryParameters, data: _data)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Resource _value;
    try {
      _value = Resource.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<bool> downloadFile({required String fileUrl, required String filePath}) async {
    print('!!!DEBUG: _DiskSyncService:downloadFile: fileUrl = $fileUrl ');
    print('!!!DEBUG: _DiskSyncService:downloadFile: filePath = $filePath ');
    var lastProgress = 0;
    final result = await _dio.download(
      fileUrl,
      filePath,
      onReceiveProgress: (progress, max) {
        var percentage = (progress / max * 100).ceil();
        if (lastProgress + 10 <= percentage) {
          lastProgress = percentage;
          print('!!!DEBUG: downloadFile [${(progress / max * 100).ceil()}%] ($fileUrl) progress = $progress / $max');
        }
      },
    );

    print('!!!DEBUG: _DiskSyncService:downloadFile: ${result.data}');
    print('!!!DEBUG: _DiskSyncService:downloadFile: ${File(filePath).existsSync()}');

    return result.statusCode == 200;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes || requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
