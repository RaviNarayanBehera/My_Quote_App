import 'dart:ui' as ui;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import '../../QuoteModel.dart';
import '../../utils/colorList.dart';
import '../../utils/quotes_lists.dart';
import 'list_screen.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

QuoteModel? quoteModel;
GlobalKey imgKey = GlobalKey();

class _EditState extends State<Edit> {
  @override
  void initState() {
    quoteModel = QuoteModel.toList(quoteListLife);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/life');
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Edit Page',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  RepaintBoundary(
                    key: imgKey,
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(selectTheme), fit: BoxFit.fill),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 250,
                            width: 270,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                quoteModel!
                                    .quoteModelList[selectedIndex].quote!,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: selectColor,
                                    fontFamily: selectedFontFamily),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () async {
                          RenderRepaintBoundary boundary =
                              imgKey.currentContext!.findRenderObject()
                                  as RenderRepaintBoundary;

                          ui.Image image = await boundary.toImage();

                          ByteData? byteData = await image.toByteData(
                              format: ui.ImageByteFormat.png);

                          Uint8List img = byteData!.buffer.asUint8List();

                          ImageGallerySaver.saveImage(img);
                        },
                        icon: const Icon(
                          Icons.save_alt_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          RenderRepaintBoundary boundary =
                              imgKey.currentContext!.findRenderObject()
                                  as RenderRepaintBoundary;

                          ui.Image image = await boundary.toImage();

                          ByteData? byteData = await image.toByteData(
                              format: ui.ImageByteFormat.png);

                          Uint8List img = byteData!.buffer.asUint8List();

                          final path = await getApplicationDocumentsDirectory();

                          File file = File("${path.path}/img.png");
                          file.writeAsBytes(img);

                          ShareExtend.share(file.path, "image");
                        },
                        icon: const Icon(
                          Icons.share_outlined,
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          RenderRepaintBoundary boundary =
                              imgKey.currentContext!.findRenderObject()
                                  as RenderRepaintBoundary;

                          ui.Image image = await boundary.toImage();

                          ByteData? byteData = await image.toByteData(
                              format: ui.ImageByteFormat.png);

                          Uint8List img = byteData!.buffer.asUint8List();

                          final path = await getApplicationDocumentsDirectory();

                          File file = File("${path.path}/img.png");
                          file.writeAsBytes(img);

                          ShareExtend.share(file.path, "image");
                          int location = WallpaperManager
                              .BOTH_SCREEN; //can be Home/Lock Screen
                          bool result =
                              await WallpaperManager.setWallpaperFromFile(
                                  file.path, location); //provide image path
                        },
                        icon: const Icon(
                          Icons.wallpaper_outlined,
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Font Colour',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 24),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                colorList.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectColor = colorList[index];
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: colorList[index],
                                      border: Border.all(
                                        color: selectColor == colorList[index]
                                            ? Colors.blue
                                            : Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Font Style',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 24),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                fontFamily.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedFontFamily = fontFamily[index];
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: selectedFontFamily ==
                                                  fontFamily[index]
                                              ? Colors.blue
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Text(
                                          '${fontFamily[index]}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily:
                                                  '${fontFamily[index]}'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Theme',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 24),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                themeList.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectTheme = themeList[index];
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                '${themeList[index]}'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String selectedFontFamily = 'Roboto';
Color selectColor = Colors.black;
var selectTheme = 'assets/images/bg1.jpg';
