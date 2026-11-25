import 'dart:io';

class AppFile {
  final AppFileType type;
  final File content;

  AppFile({
    required String type,
    required String path
  }) :
    content = File(path),
    type = AppFileType.fromString(type);
}

enum AppFileType {
  image, video;

  static AppFileType fromString(String value) =>
    switch (value.toLowerCase()) {
      'image' => AppFileType.image,
      _ => AppFileType.video
    };
}