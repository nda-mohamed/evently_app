import 'package:evently_app/Ui/common/tab_bar_item.dart';
import 'package:evently_app/Ui/screens/home/tabs/fav_tab/fav_tab.dart';
import 'package:evently_app/Ui/screens/home/tabs/home_tab/home_tab.dart';
import 'package:evently_app/Ui/screens/home/tabs/map_tab/map_tab.dart';
import 'package:evently_app/Ui/screens/home/tabs/profile_tab/profile_tab.dart';
import 'package:evently_app/extensions/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../../routes.dart';
import '../../design/design.dart';
import '../../provider/AppAuthProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  int currentBottomNavIndex = 0;
  List<Widget> tabs = [HomeTab(), MapTab(), FavTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    AppAuthProvider provider = Provider.of<AppAuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    var user = provider.getUser();

    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 130,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                provider.logout();
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.LoginScreen.route,
                );
              },
              icon: Icon(Icons.logout, color: Colors.white,),
            ),
          ],
          backgroundColor: context.appColors.primary,
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (user?.name?.isEmpty == false) ...[
                Text(
                  "Welcome Back ✨",
                  style: context.appTextTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 14,
                  ),
                ),
                Text(
                  user?.name ?? "",
                  style: context.appTextTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/map.svg"),
                    Text(
                      "Cairo",
                      style: context.appTextTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ] else
                CircularProgressIndicator(),
            ],
          ),
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              TabBarItem(title: "All", icon: FontAwesome.compass, index: 0, currentIndex: currentTabIndex),
              TabBarItem(title: "Sports", icon: FontAwesome.bicycle_solid, index: 1, currentIndex: currentTabIndex),
              TabBarItem(title: "Birthday", icon: FontAwesome.cake_candles_solid, index: 2, currentIndex: currentTabIndex),
              TabBarItem(title: "Holiday", icon: FontAwesome.tree_solid, index: 3, currentIndex: currentTabIndex),
              TabBarItem(title: "Gaming", icon: FontAwesome.playstation_brand, index: 4, currentIndex: currentTabIndex),
              TabBarItem(title: "Eating", icon: FontAwesome.bowl_food_solid, index: 5, currentIndex: currentTabIndex),
              TabBarItem(title: "Meeting", icon: FontAwesome.person_chalkboard_solid, index: 6, currentIndex: currentTabIndex),
              TabBarItem(title: "Work Shop", icon: FontAwesome.toolbox_solid, index: 7, currentIndex: currentTabIndex),
              TabBarItem(title: "Book Club", icon: FontAwesome.book_bookmark_solid, index: 8, currentIndex: currentTabIndex),
              TabBarItem(title: "Exhibition", icon: FontAwesome.images_solid, index: 9, currentIndex: currentTabIndex),
            ],
          ),
        ),

        bottomNavigationBar: Theme(
          data: ThemeData(useMaterial3: false),
          child: BottomAppBar(
            color: context.appColors.primary,
            child: BottomNavigationBar(
              backgroundColor: context.appColors.primary,
              elevation: 0,
              currentIndex: currentBottomNavIndex,
              onTap: (index){
                setState(() {
                  currentBottomNavIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              items: [
                BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.home), label: 'Home', activeIcon: SvgPicture.asset(AppImages.homeFill)),
                BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.map), label: 'Map', activeIcon: SvgPicture.asset(AppImages.mapFill)),
                BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.heart), label: 'Love', activeIcon: SvgPicture.asset(AppImages.heartFill)),
                BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.user), label: 'Profile', activeIcon: SvgPicture.asset(AppImages.userFill)),
              ],
            ),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(360),
            side: BorderSide(color: Colors.white, width: 4),
          ),
          child: Icon(Icons.add),
        ) ,

        body: tabs[currentTabIndex],
      ),
    );
  }
}