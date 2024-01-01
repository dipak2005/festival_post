import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:festival_post/views/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'home_page.dart';

class Detail_page extends StatefulWidget {
  Map? data;
  Map? map = {};

  // String? img;

  Detail_page({Key? key, this.data, required this.map}) : super(key: key);

  @override
  State<Detail_page> createState() => _Detail_pageState();
}

String greeting = "";

class _Detail_pageState extends State<Detail_page> {
  int pindex = 0;
  int? cindex;
  int sindex = 0;
  int findex = 0;
  bool isbold = false;
  double rotate = 0;
  double offset = 0;
  double offset1 = 0;
  Alignment position = Alignment(0, 0);
  double xalign = -1;
  double yalign = -1;
  double? selectalign;
  bool ischeck = false;
  GoogleFonts? fonts;
  Color? selectfcolor;
  TextStyle? selectfstyle;
  double selectsize = 25;
  bool isswitch = false;
  bool iszoom = false;
  double zoomin = 5;
  double zoomout = 1;

  double isize = 30;

  GlobalKey key = GlobalKey();
  TextEditingController namecontroller = TextEditingController();

  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    widget.map = arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FestivalPost Detail",
          style: GoogleFonts.lobster(
            color: Colors.red,
            fontWeight: FontWeight.w600,
            fontSize: 25,
            decorationStyle: TextDecorationStyle.dotted,
            fontStyle: FontStyle.italic,
            letterSpacing: 1,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Exit"),
                    content: Text(
                      "Are you sure want to Exit",
                      style: GoogleFonts.lobster(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: GoogleFonts.lobster(
                            color: Colors.red,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: Text(
                          "Yes",
                          style: GoogleFonts.lobster(
                            color: Colors.red,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.red,
            )),
        actions: [
          IconButton(
            onPressed: () {
              selectsize = 20;
              selectfcolor = null;
              selectfstyle = null;
              greeting = "";
              iszoom = false;
              setState(() {});
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.red,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {
              Share.shareXFiles([XFile(filepath ?? "")]);
            },
            icon: Icon(
              Icons.share,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () async {
              RenderRepaintBoundary renderRepaintboundry = key.currentContext
                  ?.findRenderObject() as RenderRepaintBoundary;
              var image = await renderRepaintboundry.toImage();
              ByteData? byteData =
                  await image.toByteData(format: ImageByteFormat.png);
              Uint8List? data = byteData?.buffer.asUint8List();
              print(">${data?.length}");
              Directory applicationDocumentsDirectory =
                  await getApplicationDocumentsDirectory();
              isclick = !isclick;
              String filepath =
                  "${applicationDocumentsDirectory.path}/${flist.length}.jpeg";

              print("${filepath}");
              File file = File(filepath);
              await file.writeAsBytes(data?.toList() ?? []);

              print("Download successfully");

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Column(
                    children: [
                      Text(
                        "Download Successfully",
                        style: GoogleFonts.lobster(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                          letterSpacing: 1,
                        ),
                      )
                    ],
                  ),
                ),
              );
              Navigator.pushNamed(context, "Down_load");
            },
            icon: Icon(
              Icons.download,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          RepaintBoundary(
            key: key,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: MediaQuery.sizeOf(context).width,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                ),
              ),
              child: Stack(
                children: [
                  Transform.scale(
                    transformHitTests: true,
                    scale: iszoom ? zoomin : zoomout,
                    child: Image.asset(
                      widget.map?["image"] ?? "",
                      fit: BoxFit.fitWidth,
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  ),
                  Transform.rotate(
                    angle: rotate,
                    child: Align(
                      alignment: position,
                      child: Transform.translate(
                        offset: Offset(offset, offset1),
                        transformHitTests: true,
                        child: SelectableText(
                          greeting,
                          style: selectfstyle?.copyWith(
                                  color: selectfcolor, fontSize: selectsize) ??
                              TextStyle(
                                  color: selectfcolor,
                                  fontSize: selectsize,
                                  fontWeight: isbold
                                      ? FontWeight.w900
                                      : FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.9, 0.9),
                          blurRadius: 10)
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          "-> Create festival post",
                          style: GoogleFonts.lobster(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: Switch(
                          autofocus: true,
                          value: isswitch,
                          activeColor: Colors.red,
                          thumbIcon: MaterialStatePropertyAll(
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          thumbColor: MaterialStatePropertyAll(Colors.red),
                          onChanged: (value) {
                            isswitch = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (isswitch)
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.9, 0.9),
                                blurRadius: 10)
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              IndexedStack(
                                index: pindex,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(30),
                                    child: TextField(
                                      onChanged: (value) {
                                        greeting = value;
                                        setState(() {});
                                      },
                                      // controller: namecontroller,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.note_alt_sharp,
                                          color: Colors.red,
                                        ),
                                        icon: Icon(Icons.paste),
                                        filled: true,
                                        fillColor: Colors.red.shade100,
                                        enabled: true,
                                        hintText: "Enter Text",
                                        label: Text(
                                          "Write hear",
                                          style: GoogleFonts.lobster(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.15,
                                    width: MediaQuery.sizeOf(context).width,
                                    child: ListView.builder(
                                      itemCount: fcolor.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            // print(fcolor[index]);
                                            selectfcolor = fcolor[index];
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.1,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.3,
                                            decoration: BoxDecoration(
                                                color: fcolor[index],
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(30),
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(0.9, 0.9),
                                                      blurRadius: 10)
                                                ]),
                                            margin: EdgeInsets.all(10),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    child: ListView.builder(
                                      itemCount: fstyle.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            print(fstyle[index]);
                                            selectfstyle = fstyle[index];
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 10,
                                                    offset: Offset(0.9, 0.9),
                                                  )
                                                ],
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(30),
                                                    bottomLeft:
                                                        Radius.circular(30))),
                                            margin: EdgeInsets.all(10),
                                            child: Center(
                                              child: Text(
                                                "Dipak",
                                                style: fstyle[index].copyWith(
                                                    color: Colors.red,
                                                    fontSize: 25),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: Slider(
                                          value: offset,
                                          min: -1,
                                          max: 1,
                                          autofocus: true,
                                          activeColor: Colors.red,
                                          thumbColor: Colors.red.shade100,
                                          onChanged: (value) {
                                            offset = value;
                                            position = Alignment(offset, 0);
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: Slider(
                                          value: offset1,
                                          min: -1,
                                          max: 1,
                                          autofocus: true,
                                          activeColor: Colors.red,
                                          thumbColor: Colors.red.shade100,
                                          onChanged: (value) {
                                            offset1 = value;
                                            position = Alignment(0, offset1);
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              selectsize++;
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.text_increase,
                                              color: Colors.red,
                                              size: 40,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              selectsize--;
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.text_decrease,
                                              color: Colors.red,
                                              size: 40,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              isbold = !isbold;
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.format_bold_sharp,
                                              color: Colors.red,
                                              size: 40,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              iszoom = !iszoom;
                                              setState(() {});
                                            },
                                            icon: iszoom
                                                ? Icon(
                                                    Icons.zoom_out,
                                                    color: Colors.red,
                                                    size: 40,
                                                  )
                                                : Icon(
                                                    Icons.zoom_in_outlined,
                                                    color: Colors.red,
                                                    size: 40,
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Slider(
                                          value: rotate,
                                          min: 0,
                                          thumbColor: Colors.red.shade100,
                                          max: 6.3,
                                          activeColor: Colors.red,
                                          onChanged: (value) {
                                            rotate = value;
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.14,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0.9, 0.9),
                                              blurRadius: 10)
                                        ],
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          pindex = 0;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.abc,
                                          color: Colors.red,
                                          size: 60,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.14,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0.9, 0.9),
                                              blurRadius: 10)
                                        ],
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          pindex = 1;
                                          selectfcolor = fcolor[cindex ?? 0];
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.format_color_text_rounded,
                                          color: Colors.red,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.14,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0.9, 0.9),
                                              blurRadius: 10)
                                        ],
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          pindex = 2;
                                          selectfstyle = fstyle[findex];
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.font_download_rounded,
                                          color: Colors.red,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.14,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0.9, 0.9),
                                              blurRadius: 10)
                                        ],
                                      ),
                                      child: IconButton(
                                          onPressed: () {
                                            selectsize++;

                                            selectalign = yalign;
                                            pindex = 3;
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Icons.close_fullscreen,
                                            color: Colors.red,
                                            size: 40,
                                          )),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.14,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0.9, 0.9),
                                              blurRadius: 10)
                                        ],
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          pindex = 4;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.rotate_90_degrees_ccw,
                                          color: Colors.red,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
    );
  }
}
