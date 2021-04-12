part '../extension/image_extension.dart';

class ImageConstants {
  static ImageConstants _instance;

  static ImageConstants get instance {
    if (_instance != null) return _instance;
    _instance = ImageConstants._init();
    return _instance;
  }

  ImageConstants._init();

  final logo = 'logo'.toPng;
}
