import 'package:api_integratin/model/quote_model.dart';

class DataModel {
  int? limit;
  int? skip;
  int? total;
  List<QuoteModel>? quotes;

  DataModel({
    required this.limit,
    required this.skip,
    required this.total,
    required this.quotes,
  });

  //map to model
  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<QuoteModel> mQuotes = [];
    for (Map<String, dynamic> eachQuote in json['quotes']) {
      QuoteModel model = QuoteModel.fromJson(eachQuote);
      mQuotes.add(model);
    }
    return DataModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        quotes: mQuotes);
  }
}
