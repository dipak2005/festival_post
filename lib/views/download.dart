import 'dart:io';

import 'package:festival_post/views/util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'home_page.dart';

class Down_load extends StatefulWidget {
  const Down_load({super.key});

  @override
  State<Down_load> createState() => _Down_loadState();
}

class _Down_loadState extends State<Down_load> {
  String? filepath;

  @override
  void initState() {
    getApplicationDocumentsDirectory().then(
      (value) {
        filepath = "${value.path}/${flist.length}.jpeg";
        print(filepath);
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
          "Download",
          style: GoogleFonts.lobster(
              color: Colors.red,
              fontSize: 25,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onDoubleTap: () async {
              await Share.shareXFiles(
                [
                  XFile(
                    filepath ?? "",
                  ),
                ],
              );
              setState(() {});
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: MediaQuery.sizeOf(context).width,
              child: Image.file(File(filepath ?? "")),
            ),
          ),
        ],
      ),
    );
  }
}

mixin value {}
