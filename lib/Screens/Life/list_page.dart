// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:my_quote_app/utils/colorList.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_extend/share_extend.dart';
//
// import 'list_screen.dart';
// import 'dart:ui' as ui;
// import 'dart:io';
//
// class Life extends StatefulWidget {
//   const Life({super.key});
//
//   @override
//   State<Life> createState() => _LifeState();
// }
// GlobalKey imgKey = GlobalKey();
//
// class _LifeState extends State<Life> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Edit Page'),
//       ),
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 10,left: 3,right: 3),
//             child: RepaintBoundary(
//               key: imgKey,
//               child: Container(
//                 height: 300,
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   // child: Align(
//                   //   alignment: Alignment.center,
//                   //     child: Text(quoteModel!.quoteModelList[selectedIndex].quote!,style: const TextStyle(fontSize: 35),)),
//                 ),
//               ),
//             ),
//           ),
//
//           const Spacer(flex: 1,),
//           Container(
//             height: 70,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               // color: Colors.white,
//               borderRadius: BorderRadius.circular(25)
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 IconButton(onPressed: () async {
//                   RenderRepaintBoundary boundary = imgKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//
//                   ui.Image image = await boundary.toImage();
//
//                   ByteData? bytedata = await image.toByteData(format: ui.ImageByteFormat.png);
//
//                   Uint8List img = bytedata!.buffer.asUint8List();
//
//                   ImageGallerySaver.saveImage(img);
//
//                 }, icon: const Icon(Icons.save_alt_outlined,size: 50,color: Colors.white,),),
//
//                 IconButton(onPressed: () async {
//                   RenderRepaintBoundary boundary = imgKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//
//                   ui.Image image = await boundary.toImage();
//
//                   ByteData? bytedata = await image.toByteData(format: ui.ImageByteFormat.png);
//
//                   Uint8List img = bytedata!.buffer.asUint8List();
//
//                   final path = await getApplicationDocumentsDirectory();
//
//                   File file = File("${path.path}/img.png");
//                   file.writeAsBytes(img);
//
//                   ShareExtend.share(file.path, "image");
//
//                 }, icon: const Icon(Icons.share_outlined,size: 45,color: Colors.white,),),
//                 IconButton(onPressed: () async {
//                   RenderRepaintBoundary boundary = imgKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//
//                   ui.Image image = await boundary.toImage();
//
//                   ByteData? bytedata = await image.toByteData(format: ui.ImageByteFormat.png);
//
//                   Uint8List img = bytedata!.buffer.asUint8List();
//
//                   final path = await getApplicationDocumentsDirectory();
//
//                   File file = File("${path.path}/img.png");
//                   file.writeAsBytes(img);
//
//                   ShareExtend.share(file.path, "image");
//                   int location = WallpaperManager.BOTH_SCREEN; //can be Home/Lock Screen
//                   bool result = await WallpaperManager.setWallpaperFromFile(file.path, location); //provide image path
//
//                 }, icon: const Icon(Icons.wallpaper_outlined,size: 45,color: Colors.white,),),
//
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
