import 'dart:ffi';
import 'dart:io';

import 'package:festival_post/views/detail_page.dart';
import 'package:festival_post/views/pro_modal.dart';
import 'package:festival_post/views/util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../main.dart';

class Home_page extends StatefulWidget {
  Map? data;

  Home_page({Key? key, this.data}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

bool isclick = false;
bool isdark = true;
String? filepath;

class _Home_pageState extends State<Home_page> {
  @override
  void initState() {
    getApplicationDocumentsDirectory().then(
      (value) {
        filepath = "${value.path}/${DateTime.now()}";
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Festival_Post",
          style: GoogleFonts.lobster(
            color: Colors.red,
            fontWeight: FontWeight.w600,
            fontSize: 25,
            decorationStyle: TextDecorationStyle.dotted,
            fontStyle: FontStyle.italic,
            letterSpacing: 1,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              isdark = !isdark;
              isdark ? ThemeData.dark : ThemeData.light;
              setState(() {});
            },
            icon: isdark
                ? Icon(
                    Icons.light_mode_outlined,
                    color: Colors.red,
                    size: 30,
                  )
                : Icon(
                    Icons.dark_mode_outlined,
                    color: Colors.red,
                    size: 30,
                  ),
          ),
          IconButton(
            onPressed: () {
              isclick = !isclick;
              setState(() {});
            },
            icon: isclick
                ? Icon(
                    Icons.list_alt_outlined,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.grid_view,
                    color: Colors.red,
                  ),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            children: toplist.map((e) {
              List<Map>? t = e["tlist"] as List<Map>?;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: (t ?? []).map((e) {
                    return top(
                      data: e,
                      map: e,
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: isclick
                ? ListView.builder(
                    itemCount: flist.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> fitems = flist[index];
                      fmodal fm = fmodal.fromMap(fitems);
                      print(flist[index]);
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            child: Center(
                              child: Text(
                                fm.name ?? "",
                                style: GoogleFonts.lobster(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                  decorationStyle: TextDecorationStyle.dotted,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 250,
                            child: ListView(
                              children: flist.map((e) {
                                List<Map>? product = e["product"] as List<Map>?;

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: isclick
                                      ? Column(
                                          children: (product ?? []).map((e) {
                                            return Listwidget(
                                              data: e,
                                              map: e,
                                            );
                                          }).toList(),
                                        )
                                      : Row(
                                          children: (product ?? []).map((e) {
                                            return Listwidget(
                                              data: e,
                                              map: e,
                                            );
                                          }).toList(),
                                        ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: flist.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> fitems = flist[index];
                      fmodal fm = fmodal.fromMap(fitems);
                      print(flist[index]);
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            child: Center(
                              child: Text(
                                fm.name ?? "",
                                style: GoogleFonts.lobster(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                  decorationStyle: TextDecorationStyle.dotted,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 250,
                            child: ListView(
                              children: flist.map((e) {
                                List<Map>? product = e["product"] as List<Map>?;

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: (product ?? []).map((e) {
                                      return Listwidget(
                                        data: e,
                                        map: e,
                                      );
                                    }).toList(),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class top extends StatefulWidget {
  Map? data;
  Map? map = {};

  top({Key? key, this.data, required this.map}) : super(key: key);

  @override
  State<top> createState() => _topState();
}

class _topState extends State<top> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "Detail_page",
                  arguments: widget.map);
            },
            child: Stack(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  height: 300,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                    ),
                  ),
                  // height: 300,
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "${widget.data?["image"]}",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 30,
                  child: IconButton(
                    onPressed: () {
                      Share.share(quote.first);
                      print(quote.first);
                    },
                    icon: Icon(
                      Icons.share,
                      color: Colors.black,
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

class Listwidget extends StatefulWidget {
  Map? data;
  Map? map = {};

  Listwidget({Key? key, this.data, required this.map}) : super(key: key);

  @override
  State<Listwidget> createState() => _ListwidgetState();
}

class _ListwidgetState extends State<Listwidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "Detail_page",
                    arguments: widget.map);
              },
              onDoubleTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Festival Quotes",
                            style: GoogleFonts.lobster(
                              backgroundColor: Colors.transparent,
                              letterSpacing: 2,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Icon(
                            Icons.festival_outlined,
                            color: Colors.red,
                            size: 40,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.2,
                width: MediaQuery.sizeOf(context).width * 0.4,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60)),
                  //
                ),
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  "${widget.data?["image"]}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
