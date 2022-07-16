import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project3/pages/cart/cart_history.dart';
import 'package:project3/pages/home/main_home_page.dart';
import 'package:project3/utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:project3/utils/dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;
  List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      Container(child: Center(child:Text("Next Page"))),
      CartHistory(),
      Container(child: Center(child: Text("Next next next Page"))),
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.mainGreen,
        inactiveColorPrimary: CupertinoColors.white,

      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox_fill),
        title: ("History"),
        activeColorPrimary:  AppColors.mainGreen,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: ("Cart"),

        activeColorPrimary: AppColors.mainGreen,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Me"),
        activeColorPrimary: AppColors.mainGreen,
        inactiveColorPrimary: CupertinoColors.white,
      ),
    ];
  }
  List pages = [
    MainFoodPage(),
    Container(child: Center(child:Text("Next Page"))),
    Container(child: Center(child: Text("Next next next Page"))),
    Container(child: Center(child: Text("Next next next Page"))),

  ];
  void onTapNav(int index){
  setState((){
    _selectedIndex = index;
  });
  }
  void initState()
  {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);

  }

  @override
  Widget build(BuildContext context) {
  return PersistentTabView(
  context,
  controller: _controller,
  navBarHeight: Dimensions.height15*5,
  screens: _buildScreens(),
  items: _navBarsItems(),
  confineInSafeArea: true,
  backgroundColor: AppColors.mainColor, // Default is Colors.white.
  handleAndroidBackButtonPress: true, // Default is true.
  resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
  stateManagement: true, // Default is true.
  hideNavigationBarWhenKeyboardShows: true,
    margin: EdgeInsets.only(top: Dimensions.height15*3,left: Dimensions.width15,right:Dimensions.width15,bottom: Dimensions.width15/2),
// Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
  decoration: NavBarDecoration(
  borderRadius: BorderRadius.only(
    bottomLeft:Radius.circular(Dimensions.width15*1.5),
    bottomRight:Radius.circular(Dimensions.width15*1.5),
    topRight: Radius.circular(Dimensions.width15*1.5),
    topLeft: Radius.circular(Dimensions.width15*1.5),
  ),

  colorBehindNavBar: Colors.white,
  ),
  popAllScreensOnTapOfSelectedTab: true,
  popActionScreens: PopActionScreensType.all,
  itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
  duration: Duration(milliseconds: 200),
  curve: Curves.ease,
  ),
  screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
  animateTabTransition: true,
  curve: Curves.ease,
  duration: Duration(milliseconds: 200),
  ),
  navBarStyle: NavBarStyle.style3

    , // Choose the nav bar style with this property.
  );
  }
  }
  /*
  style3
  style 13
  style 5


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          showSelectedLabels: false,
          currentIndex: _selectedIndex,
          showUnselectedLabels: false,
          onTap: onTapNav,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined,),
                label: "Home"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive,),
              label: "History"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,),
              label: "Cart"

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,),
              label: "Me"

          )


        ]
      ),

    );
  }

   */


