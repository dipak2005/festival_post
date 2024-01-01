import 'dart:ui';

class fmodal {
  String? name;
  List<promodal>? prolist;

  fmodal(this.name, this.prolist);

  factory fmodal.fromMap(Map<String, dynamic> map) {
    var prolist = (map["product"]as List).map((e) {
    return promodal.fromMap(e);
    }).toList();
    return fmodal(
      map["name"],
      prolist,
    );
  }
}

class promodal {
  String? img;

  promodal({this.img});

  factory promodal.fromMap(Map<String, dynamic> map) {
    return promodal(
      img: map["image"],

    );
  }
}
