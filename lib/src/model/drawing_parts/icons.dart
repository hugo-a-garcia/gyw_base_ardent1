/// The icons supported by aRdent smart glasses
// ignore_for_file: constant_identifier_names
enum GYWIcon {
  blank("Blank", "blank", 48, 48),
  build("Build", "build", 48, 48),
  camera("Camera", "camera", 48, 48),
  chat("Chat", "chat", 48, 48),
  checkbox("Checkbox checked", "check", 48, 48),
  checkboxEmpty("Checkbox empty", "uncheck", 48, 48),
  cloud_backup("Cloud backup", "cloud_backup", 48, 48),
  cloud_done("Cloud done", "cloud_done", 48, 48),
  done("Done", "done", 48, 48),
  down("Down", "down", 48, 48),
  edit("Edit", "edit", 48, 48),
  file("File", "file", 48, 48),
  folder("Folder", "folder", 48, 48),
  gyw("GYW", "GYW", 121, 48),
  help("Help", "help", 48, 48),
  info("Information", "info", 48, 48),
  left("Left", "left", 48, 48),
  location("Location", "location", 48, 48),
  next("Next", "next", 48, 48),
  nfc("NFC", "nfc", 48, 48),
  person("Person", "person", 48, 48),
  previous("Previous", "prev", 48, 48),
  rename("Rename", "rename", 48, 48),
  right("Right", "right", 48, 48),
  settings("Settings", "settings", 48, 48),
  up("Up", "up", 48, 48),
  warning("Warning", "warning", 48, 48),
  wifi("Wi-Fi", "wifi", 48, 48),
  wifi_off("Wi-Fi off", "wifi_off", 48, 48),
  key_0("Key 0", "key_0", 48, 48),
  key_1("Key 1", "key_1", 48, 48),
  key_2("Key 2", "key_2", 48, 48),
  key_3("Key 3", "key_3", 48, 48),
  key_4("Key 4", "key_4", 48, 48),
  key_5("Key 5", "key_5", 48, 48),
  key_6("Key 6", "key_6", 48, 48),
  key_7("Key 7", "key_7", 48, 48),
  key_8("Key 8", "key_8", 48, 48),
  key_9("Key 9", "key_9", 48, 48),
  key_A("Key A", "key_A", 48, 48),
  key_B("Key B", "key_B", 48, 48),
  key_C("Key C", "key_C", 48, 48),
  key_D("Key D", "key_D", 48, 48),
  key_star("Key *", "key_star", 48, 48),
  key_num("Key #", "key_#", 48, 48);

  /// The name of the icon
  final String name;

  /// The filename on the GYW device
  final String filename;

  /// The width (in pixels) of the icon
  final double width;

  /// The height (in pixels) of the icon
  final double height;

  const GYWIcon(this.name, this.filename, this.width, this.height);

  /// The path of the associated file in the assets folder
  @Deprecated("Use pathPng instead")
  String get path => "assets/icons/$filename.png";

  /// The path of the associated PNG file in the assets folder
  String get pathPng => "assets/icons/$filename.png";

  /// The path of the associated SVG file in the assets folder
  String get pathSvg => "assets/icons/$filename.svg";
}
