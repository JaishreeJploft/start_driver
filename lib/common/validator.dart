class Validator {
  static final Validator validatorInstanace = Validator._internal();

  factory Validator() => validatorInstanace;

  Validator._internal();

  final List<String> _imageTypes = [
    "jpg",
    "JPG",
    "jpeg",
    "JPEG",
    "png",
    "PNG",
    "gif",
    "GIF"
  ];

  Future<bool> isImage(String val) async => _imageTypes.contains(val);

  Future<bool> isPostImage(String val) async =>
      _imageTypes.contains(val.split(".").last);

  bool isValidEmail(String text) => RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(text);

  bool isValidPassword(String text) => RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(text);

  bool isValidPhone(String text) =>
      RegExp(r'^\d{7,15}$').hasMatch(text);
}
