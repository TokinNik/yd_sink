///При добавление изображений обязательно конвертируем их в webp
///при помощи скрипта webp_convert.sh, лн находится в папке scripts

class AppImages {
  AppImages._();

  static String _getImage(String name) => 'assets/images/$name.webp';

  static String _getGif(String name) => 'assets/gif/$name.gif';

  static String _getPng(String name) => 'assets/images/$name.png';

  static String _getJpg(String name) => 'assets/images/$name.jpg';

  static String picture = _getPng("picture");
  static String plan = _getPng("plan");
  static String cat = _getJpg("cat");
  static String tempLogo = _getPng("tempLogo");

}
