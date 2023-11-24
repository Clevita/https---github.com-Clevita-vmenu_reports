// import 'dart:typed_data';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:get/get.dart';
// import 'package:image/image.dart' as IMG;

// Future<Uint8List?> imageResizer(Uint8List data, int iheight, int iwidth,
//     {int? quality}) async {
//   if (GetPlatform.isMobile || GetPlatform.isWeb) {
//     final result = await FlutterImageCompress.compressWithList(
//       data,
//       minHeight: iheight,
//       minWidth: iwidth,
//       quality: quality ?? 60,
//       // rotate: 270,
//       format: CompressFormat.webp,
//     );

//     return result;
//   } else {
//     Uint8List? resizedData = data;
//     IMG.Image? realimage = IMG.decodeImage(data);

//     IMG.Image resized = IMG.copyResize(realimage!,
//         width: iwidth.toInt(), height: iheight.toInt());
//     resizedData = IMG.encodeJpg(resized, quality: quality ?? 60) as Uint8List?;

//     return resizedData;
//   }
// }
