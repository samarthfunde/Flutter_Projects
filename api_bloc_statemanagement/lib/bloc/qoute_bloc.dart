import 'package:api_bloc_statemanagement/api_helper.dart';
import 'package:api_bloc_statemanagement/app_exceptions.dart';
import 'package:api_bloc_statemanagement/bloc/quote_event.dart';
import 'package:api_bloc_statemanagement/bloc/quote_state.dart';
import 'package:api_bloc_statemanagement/models/quote_model.dart';
import 'package:api_bloc_statemanagement/urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  ApiHelper apiHelper;
  QuoteBloc({required this.apiHelper}) : super(QuoteInitialState()) {
    on<GetQuoteEvent>((event, emit) async {
      emit(QuoteLoadingState());

      try {
        var resJson = await apiHelper.getAPI(url: Urls.getQuotesUrl);
        if (resJson != null) {
          var mResData = DataModel.fromJson(resJson);
          emit(QuoteLoadedState(resData: mResData));
        } else {
          emit(QuoteErrorState(errorMsg: "uhh... No!!, Error Occured."));
        }
      } catch (e) {
        emit(QuoteErrorState(errorMsg: "${(e as AppExceptions).toErrorMsg()}"));
      }
    });
  }
}
