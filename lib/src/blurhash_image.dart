import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

const _DEFAULT_SIZE = 32;

class BlurHashImage extends ImageProvider<BlurHashImage> {
  /// Creates an object that decodes a [blurHash] as an image.
  ///
  /// The arguments must not be null.
  const BlurHashImage(this.blurHash,
      {this.decodingWidth = _DEFAULT_SIZE,
      this.decodingHeight = _DEFAULT_SIZE,
      this.scale = 1.0});

  /// The bytes to decode into an image.
  final String blurHash;

  /// The scale to place in the [ImageInfo] object of the image.
  final double scale;

  /// Decoding definition
  final int decodingWidth;

  /// Decoding definition
  final int decodingHeight;

  @override
  Future<BlurHashImage> obtainKey(ImageConfiguration configuration) =>
      SynchronousFuture<BlurHashImage>(this);

  @override
  bool operator ==(Object other) => other.runtimeType != runtimeType
      ? false
      : other is BlurHashImage &&
          other.blurHash == blurHash &&
          other.scale == scale;

  @override
  int get hashCode => hashValues(blurHash.hashCode, scale);

  @override
  String toString() => '$runtimeType($blurHash, scale: $scale)';
}
