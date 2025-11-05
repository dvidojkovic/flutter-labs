class Exam {
  int id;
  String name;
  DateTime date;
  List<String> labs;

  Exam({required this.id, required this.name, required this.date, required this.labs});

  Exam.fromJson(Map<String, dynamic> data)
    : id = data['id'],
      name = data['name'],
      date = DateTime.parse(data['date']),
      labs = List<String>.from(data['labs']);
  
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'date': date.toIso8601String(), 'labs': labs};
}