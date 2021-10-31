class PollItem {
  final int number;
  final String title;
  final String fullname;



  PollItem({
    required this.number,
    required this.title,
    required this.fullname,
  });

  factory PollItem.fromJson(Map<String, dynamic> json) {
    return PollItem(
      number: json['number'],
      title: json['title'],
      fullname: json['name'],
    );
  }

  PollItem.fromJson2(Map<String, dynamic> json)
      : number = json['number'],
        title = json['title'],
        fullname =  json['name'];

  @override
  String toString() {
    return '$number: $title  $fullname ';
  }
}