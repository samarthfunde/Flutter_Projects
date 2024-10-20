import 'package:wallpaper_app/data/remote/api_helper.dart';
import 'package:wallpaper_app/data/remote/urls.dart';

class WallpaperRepository {
  ApiHelper apiHelper;
  WallpaperRepository({required this.apiHelper});

  Future<dynamic> getTrendingWallpapers() async {
    try {
      return await apiHelper.getAPI(url: AppUrls.TRENDING_WALL_URL);
    } catch (e) {
      throw (e);
    }
  }
}
