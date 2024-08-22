import 'dart:io';

class ProxyHttpOverrides extends HttpOverrides {
  final String? _port;
  final String? _host;

  ProxyHttpOverrides(this._host, this._port);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return _host != null ? "PROXY $_host:$_port;" : 'DIRECT';
      }
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
