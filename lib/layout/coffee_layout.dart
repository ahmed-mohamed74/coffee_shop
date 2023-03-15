import 'package:animations/animations.dart';
import 'package:coffee_shop/cubit/cubit.dart';
import 'package:coffee_shop/cubit/states.dart';
import 'package:coffee_shop/modules/login_page.dart';
import 'package:coffee_shop/modules/screens/cart_screen.dart';
import 'package:coffee_shop/shared/components/componenets.dart';
import 'package:coffee_shop/shared/network/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CoffeeLayout extends StatelessWidget {
  const CoffeeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var user = FirebaseAuth.instance.currentUser;
          var cubit = AppCubit.get(context);
          return SafeArea(
            child: ZoomDrawer(
              menuScreen: Scaffold(
                backgroundColor: Colors.white,
                body: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: spColor),
                      accountName: Text(
                        "${user!.displayName}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      accountEmail: Text(
                        "${user.email}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      currentAccountPicture: CircleAvatar(
                        child: Image.asset('assets/images/new/userimage.png'),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                      ),
                      title: const Text('Home Page'),
                      onTap: () {
                        // an error should be edited ------------------------------------- imp. -----------
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CoffeeLayout(),
                            ));
                        cubit.changeCurrentIndex(0);
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.shopping_cart,
                      ),
                      title: const Text('My Cart'),
                      onTap: () {
                        // ZoomDrawer.of(context)!.toggle();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ));
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.logout,
                      ),
                      title: const Text('Logout'),
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: ((context) => LoginPage()),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              mainScreen: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(
                          Icons.menu_open,
                          color: Colors.grey,
                          size: 35, // Changing Drawer Icon Size
                        ),
                        onPressed: () {
                          // Scaffold.of(context).openDrawer();
                          ZoomDrawer.of(context)!.toggle();
                        },
                        // tooltip: MaterialLocalizations.of(context)
                        //     .openAppDrawerTooltip,
                      );
                    },
                  ),
                  actions: [
                    OpenContainer(
                      openColor: Colors.black,
                      closedColor: Colors.black,
                      middleColor: Colors.black,
                      transitionDuration: const Duration(milliseconds: 1500),
                      // transitionType: transitionType,
                      closedBuilder:
                          (BuildContext context, VoidCallback openContainer) =>
                              InkWell(
                        onTap: openContainer,
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.shopping_basket,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      openBuilder: (BuildContext context,
                              void Function({Object? returnValue}) action) =>
                          const CartScreen(),
                    ),
                  ],
                ),
                body: cubit.screens[cubit.currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  elevation: 3,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedFontSize: 25,
                  selectedIconTheme: const IconThemeData(size: 25),
                  unselectedIconTheme: const IconThemeData(size: 20),
                  selectedItemColor: spColor,
                  backgroundColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeCurrentIndex(index);
                  },
                  items: cubit.bottomItems,
                ),
                // drawer: Drawer(
                //   child: ListView(
                //     padding: EdgeInsets.zero,
                //     children: [
                //       UserAccountsDrawerHeader(
                //         decoration: BoxDecoration(color: spColor),
                //         accountName: Text(
                //           "${user!.displayName}",
                //           style: const TextStyle(
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         accountEmail: Text(
                //           "${user.email}",
                //           style: const TextStyle(
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         currentAccountPicture: CircleAvatar(
                //           child: Image.asset('assets/images/new/userimage.png'),
                //         ),
                //       ),
                //       ListTile(
                //         leading: const Icon(
                //           Icons.home,
                //         ),
                //         title: const Text('Home Page'),
                //         onTap: () {
                //           Navigator.pop(context);
                //           cubit.changeCurrentIndex(0);
                //         },
                //       ),
                //       ListTile(
                //         leading: const Icon(
                //           Icons.shopping_cart,
                //         ),
                //         title: const Text('My Cart'),
                //         onTap: () {
                //           Navigator.pop(context);
                //           Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => const CartScreen(),
                //           ));
                //         },
                //       ),
                //       ListTile(
                //         leading: const Icon(
                //           Icons.logout,
                //         ),
                //         title: const Text('Logout'),
                //         onTap: () async {
                //           await FirebaseAuth.instance.signOut();
                //           Navigator.of(context).pushReplacement(
                //             MaterialPageRoute(
                //               builder: ((context) => LoginPage()),
                //             ),
                //           );
                //         },
                //       ),
                //     ],
                //   ),
                // ),
              ),
              angle: -12,
              duration: const Duration(milliseconds: 600),
            ),
          );
        },
      ),
    );
  }
}
