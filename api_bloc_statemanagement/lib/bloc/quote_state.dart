import 'package:api_bloc_statemanagement/models/quote_model.dart';

abstract class QuoteState {}

// following 4th state is common also
class QuoteInitialState extends QuoteState {}

class QuoteLoadingState extends QuoteState {}

class QuoteLoadedState extends QuoteState {
  //reference milega datamodel ka
  DataModel resData;
  QuoteLoadedState({required this.resData});
}

class QuoteErrorState extends QuoteState {
  String errorMsg;
  QuoteErrorState({required this.errorMsg});
}
