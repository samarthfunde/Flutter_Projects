import 'package:bloc/bloc.dart';
import 'package:wallpaper_app/data/repository/wallpaper_repository.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';

// Import home_state.dart
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final WallpaperRepository wallpaperRepository;

  HomeCubit({required this.wallpaperRepository}) : super(HomeInitialState());

  void getTrendingWallpaper() async {
    emit(HomeLoadingState());
    try {
      // Await the result of the repository call
      var data = await wallpaperRepository.getTrendingWallpapers();

      // Correct the variable naming and method
      var wallpaperModel = WallpaperDataModel.fromJson(data);

      // Emit loaded state with the fetched photos
      emit(HomeLoadedState(listPhotos: wallpaperModel.photos!));
    } catch (e) {
      // Emit error state in case of exception
      emit(HomeErrorState(errorMsg: e.toString()));
    }
  }
}
