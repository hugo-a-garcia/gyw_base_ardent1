import 'dart:typed_data';
import 'dart:ui';

/// Converts a int32 into bytes
Uint8List int32Bytes(
  int value, {
  Endian endian = Endian.little,
}) =>
    Uint8List(4)..buffer.asByteData().setInt32(0, value, endian);

/// Converts a int8 into bytes
Uint8List int8Bytes(
  int value,
) =>
    Uint8List(1)..buffer.asByteData().setInt8(0, value);

/// Converts a uint8 into bytes
Uint8List uint8Bytes(
  int value,
) =>
    Uint8List(1)..buffer.asByteData().setUint8(0, value);

/// Converts a uint16 into bytes
Uint8List uint16Bytes(
  int value, {
  Endian endian = Endian.little,
}) =>
    Uint8List(2)..buffer.asByteData().setUint16(0, value, endian);

/// Converts a uint32 into bytes
Uint8List uint32Bytes(
  int value, {
  Endian endian = Endian.little,
}) =>
    Uint8List(4)..buffer.asByteData().setUint32(0, value, endian);

/// Converts a Color to an RGBA8888 bytes array
Uint8List rgba8888BytesFromColor(Color? color) {
  if (color == null) {
    return Uint8List(4);
  }
  return Uint8List.fromList([color.red, color.green, color.blue, color.alpha]);
}

/// Allows to compare Comparable object using inequality signs
extension Compare<T> on Comparable<T> {
  bool operator >(T other) => compareTo(other) > 0;

  bool operator <(T other) => compareTo(other) < 0;

  bool operator >=(T other) => compareTo(other) >= 0;

  bool operator <=(T other) => compareTo(other) <= 0;
}

List<int> byteFromScale(double scale) {
  scale = scale.clamp(0.01, 13.7);
  int scaleByte;
  if (scale >= 1.0) {
    // min: 1.0 -> 0.0 -> 0
    // max: 13.7 -> 12.7 -> 127
    scaleByte = ((scale - 1.0) * 10.0).round();
  } else {
    // min: 0.01 -> -1
    // max: 0.99 -> -99
    scaleByte = (-scale * 100.0).round();
  }
  assert(-99 <= scaleByte && scaleByte <= 127);
  return int8Bytes(scaleByte);
}

/// Converts an hexadecimal string of length 8 into a Flutter color
Color? colorFromHex(String? value) {
  if ((value?.length ?? 0) != 8) {
    return null;
  }

  final int? colorValue = int.tryParse(value!, radix: 16);
  if (colorValue == null || colorValue > 0xffffffff) {
    return null;
  }

  return Color(colorValue);
}

String hexFromColor(Color color) {
  return [color.alpha, color.red, color.green, color.blue]
      .map((channel) => channel.toRadixString(16).padLeft(2, "0"))
      .join();
}
