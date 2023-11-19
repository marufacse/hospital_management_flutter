class NoteModel {
  String date;
  String note;

  NoteModel({required this.date, required this.note});

  Map<String, dynamic> toMap() {
    // used when inserting data to the database

    return <String, dynamic>{"date": date, "note": note};
  }
}
