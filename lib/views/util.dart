import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Map<String, dynamic>> flist = [
  {
    "name": "Indian Festival",
    "product": [
      {
        "image": "assets/n1.jpg",
      },
      {
        "image": "assets/n2.jpg",
      },
      {
        "image": "assets/n3.jpg",
      },
      {
        "image": "assets/n4.jpg",
      },
      {
        "product": [
          {
            "image": "assets/d1.jpg",
          },
          {
            "image": "assets/d2.jpg",
          },
          {
            "image": "assets/d3.jpg",
          },
          {
            "image": "assets/d4.jpg",
          },
          {
            "image": "assets/d5.jpg",
          },
        ],
      },
      {
        "image": "assets/h2.jpg",
      },
      {
        "image": "assets/h3.jpg",
      },
      {
        "image": "assets/h4.jpg",
      },
      {
        "image": "assets/h5.jpg",
      },
      {
        "image": "assets/ds.jpg",
      },
      {
        "image": "assets/ds1.jpg",
      },
      {
        "image": "assets/ds2.jpg",
      },
      {
        "image": "assets/ds3.jpg",
      },
      {
        "image": "assets/ds4.jpg",
      },
      {
        "image": "assets/ds5.jpg",
      },
      {
        "image": "assets/j1.jpg",
      },
      {
        "image": "assets/j2.jpg",
      },
      {
        "image": "assets/j3.jpg",
      },
      {
        "image": "assets/j4.jpg",
      },
      {
        "image": "assets/j5.jpg",
      },
      {
        "image": "assets/r1.jpg",
      },
      {
        "image": "assets/r2.jpg",
      },
      {
        "image": "assets/r3.jpg",
      },
      {
        "image": "assets/r4.jpg",
      },
      {
        "image": "assets/r5.jpg",
      },
      {
        "image": "assets/r.jpg",
      },
      {
        "image": "assets/rm1.jpg",
      },
      {
        "image": "assets/rm2.jpg",
      },
      {
        "image": "assets/rm3.jpg",
      },
      {
        "image": "assets/rm4.jpg",
      },
      {
        "image": "assets/rm.jpg",
      },
    ]
  },
  // {
  //   "name": "Diwali",
  //   "product1": [

  //   ],
  // },
  // {
  //   "name": "Holi",
  //   "product2": [

  //   ]
  // },
  // {
  //   "name":"Dashera",
  //   "product3":[

  //   ]
  // },
  // {
  //   "name":"Janmashtmi",
  //   "product4":[

  //   ],
  // },
  // {
  //   "name":"Raksha Bandhan",
  //   "product5":[

  //   ]
  // },
  // {
  //   "name":"Ram Navmi",
  //   "product6":[

  //
  //   ]
  // }
];
List<Map<String, dynamic>> toplist = [
  {
    "tlist": [
      {
        "image": "assets/nbanner.jpg",
        "width": 400,
      },
      {
        "image": "assets/dbanner.jpg",
        "width": 400,
      },
      {
        "image": "assets/dsbanner.jpg",
        "width": 400,
      },
      {
        "image": "assets/hbanner.jpg",
        "width": 400,
      },
      {
        "image": "assets/jbanner.jpg",
        "width": 400,
      },
      {
        "image": "assets/rbanner.jpg",
        "width": 400,
      },
      {
        "image": "assets/rmbanner.jpg",
        "width": 400,
      },
    ]
  },
];

List<Uint8List> list = [];
List<Color> fcolor = [
  Colors.green,
  Colors.pinkAccent,
  Colors.pink,
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.cyan,
  Colors.blueAccent,
  Colors.amber,
  Colors.deepPurple,
  Colors.black,
  Colors.black12,
  Colors.white,
  Colors.orange,
  Colors.orangeAccent,
];

List<TextStyle> fstyle = [
  GoogleFonts.playfair(fontSize: 15, fontWeight: FontWeight.w600),
  GoogleFonts.notoSerifSinhala(fontSize: 15, fontWeight: FontWeight.w600),
  GoogleFonts.agdasima(fontSize: 15, fontWeight: FontWeight.w600),
  GoogleFonts.yujiHentaiganaAkari(fontSize: 15, fontWeight: FontWeight.w600),
  GoogleFonts.teko(fontSize: 15, fontWeight: FontWeight.w600),
  GoogleFonts.bebasNeue(fontSize: 15, fontWeight: FontWeight.w600),
  GoogleFonts.dancingScript(fontSize: 15, fontWeight: FontWeight.w600),
  GoogleFonts.lobster(fontSize: 15, fontWeight: FontWeight.w600),
  GoogleFonts.caveat(fontSize: 15, fontWeight: FontWeight.w600),
  GoogleFonts.chakraPetch(fontSize: 15, fontWeight: FontWeight.w600),
];

List<String> dimage = [
  "assets/n1.jpg",
  "assets/n2.jpg",
  "assets/n3.jpg",
  "assets/n4.jpg",
];
List<String> quote = [
  '''दोस्तों हम सभी किसी ना किसी पर्व, उत्सव,
   जश्न आदि को हम सभी एक दुसरे के साथ मनाते हैं.
   खुशियों को मनाने के लिए हमारे पास बहुत से बहाने हैं.
    अपनी खुशियों को दूसरों के साथ बाटना ही एक उत्सव हैं. 
  िसके जरिए हम अपनी खुशियों को एक दुसरे के साथ साँझा करते हैं. 
     और Celebrate करते हैं एक साथ मिलकर. ''',
  '''"उत्सव आप पर निवास करने वाले किसी पर दुखवादी प्रभाव डालने का कार्य है❗"''',
  '''"मैं जीवन का उत्सव मनाऊंगा। कभी-कभी जब आप कुछ खो देते हैं,
          तो आप उसके मूल्य को उस समय से अधिक समझते है
     ं       जब आपके पास था। वही जीवन के लिए सत्य है❗"''',
  '''"अनुशासन का जीवन जिएं और उत्सव का जीवन जिएं❗"''',
  '''"उत्सव भजन और पवित्र नृत्य है❗"''',
  ''''"इस सृष्टि में सब कुछ उत्सव का प्रतीक है❗"
 44- Everything in this creation is a sign of celebrat''',



];
