class AllTickets {
  String? code;
  String? message;
  Data? data;

  AllTickets({this.code, this.message, this.data});

  AllTickets.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  Dist? dist;

  Data({this.dist});

  Data.fromJson(Map<String, dynamic> json) {
    dist = json['dist'] != null ? Dist.fromJson(json['dist']) : null;
  }
}

class Dist {
  List<Day>? day;
  List<Week>? week;
  List<Month>? month;
  List<Year>? year;

  Dist({this.day, this.week, this.month, this.year});

  Dist.fromJson(Map<String, dynamic> json) {
    if (json['day'] != null) {
      day = <Day>[];
      json['day'].forEach((v) {
        day!.add(Day.fromJson(v));
      });
    }
    if (json['week'] != null) {
      week = <Week>[];
      json['week'].forEach((v) {
        week!.add(Week.fromJson(v));
      });
    }
    if (json['month'] != null) {
      month = <Month>[];
      json['month'].forEach((v) {
        month!.add(Month.fromJson(v));
      });
    }
    if (json['year'] != null) {
      year = <Year>[];
      json['year'].forEach((v) {
        year!.add(Year.fromJson(v));
      });
    }
  }
}

class Day {
  String? label;
  dynamic value;

  Day({this.label, this.value});

  Day.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'] ?? "";
  }
}

class Week {
  String? label;
  String? value;

  Week({this.label, this.value});

  Week.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }
}

class Month {
  String? label;
  String? value;

  Month({this.label, this.value});

  Month.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }
}

class Year {
  String? label;
  String? value;

  Year({this.label, this.value});

  Year.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }
}
