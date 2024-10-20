import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/app_widgets/wallpaper_bg_widget.dart';
import 'package:wallpaper_app/constants/app_constants.dart';
import 'package:wallpaper_app/screens/home/cubit/home_cubit.dart';
import 'package:wallpaper_app/utils/util_helper.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context)
        .getTrendingWallpaper(); // Fetch the trending wallpapers
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarylightColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // Empty container to create spacing
          Container(
            height: 200,
          ),

          // Search Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search_sharp,
                  color: Colors.grey.shade300,
                ),
                filled: true,
                fillColor: AppColors.secondaryLightColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                hintText: 'Search wallpapers...',
                hintStyle: mTextStyle12(mColor: Colors.grey.shade400),
              ),
            ),
          ),
          SizedBox(
            height: 11,
          ),

          // Best of Month Section - Horizontal List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Best of Month',
              style: mTextStyle16(mFontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is HomeErrorState) {
                  return Center(child: Text('${state.errorMsg}'));
                } else if (state is HomeLoadedState) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.listPhotos.length,
                    itemBuilder: (context, index) {
                      var eachPhoto = state.listPhotos[index];

                      return Padding(
                        padding: EdgeInsets.only(
                          left: 11.0,
                          right: index == state.listPhotos.length - 1 ? 11 : 0,
                        ),
                        child: WallpaperBgWidget(
                          imgUrl: eachPhoto.src!.portrait!,
                        ),
                      );
                    },
                  );
                }
                return Container(); // Default state before loading
              },
            ),
          ),

          // Color Tones Section
          SizedBox(height: 11),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Color Tones',
              style: mTextStyle16(mFontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AppConstants.mColors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 11.0,
                    right: index == AppConstants.mColors.length - 1 ? 11 : 0,
                  ),
                  child: getColorToneWidget(AppConstants.mColors[index]),
                );
              },
            ),
          ),
          SizedBox(height: 11),

          // Grid View Section for Categories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Images',
              style: mTextStyle16(mFontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: SizedBox(
              // Adjusted height
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in grid
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 11,
                  childAspectRatio: 3 / 2, // Adjusted aspect ratio to 3:1
                ),
                itemCount: AppConstants.mCategories.length,
                itemBuilder: (context, index) {
                  return getCategoryWidget(
                    AppConstants.mCategories[index]['image'],
                    AppConstants.mCategories[index]['title'],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget to show a colored tone box
  Widget getColorToneWidget(Color mColor) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: mColor,
        borderRadius: BorderRadius.circular(11),
      ),
    );
  }

  // Widget to show a category image and title
  Widget getCategoryWidget(String imgUrl, String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover, // Adjust image fit for better display
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: mTextStyle14(mColor: Colors.white), // Ensure this style exists
        ),
      ),
    );
  }
}
