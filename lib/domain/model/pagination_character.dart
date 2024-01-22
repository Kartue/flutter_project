import 'character.dart';

class PaginationCharacter {
  final Info info;
  final List<Character> result;

  PaginationCharacter({
    required this.info,
    required this.result,
  });

  Map<String, dynamic> toJson() {
    return {
      'info': info.toJson(),
      'result': result.map((element) => element.toJson()).toList(),
    };
  }

  static PaginationCharacter fromJson(Map<String, dynamic> json) {
    final List<dynamic> result = json['results'];
    return PaginationCharacter(
      info: Info.fromJson(json['info']),
      result: result.map((e) => Character.fromJson(e)).toList(),
    );
  }
}

class Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  Info({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }

  static Info fromJson(Map<String, dynamic> json) {
    return Info(
      pages: json['pages'],
      count: json['count'],
      next: json['next'],
      prev: json['prev'],
    );
  }
}
