class QuoteModel {
  String? author; //// Nullable String, यह null हो सकता है
  int? id;
  String? quote;

  //constructor
  QuoteModel({
    required this.id,
    required this.quote,
    required this.author,
  });

  //map -> model ... it means api to model
  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['id'],
      quote: json['quote'],
      author: json['author'],
    );
  }
}
