//importing packages
import 'package:ArenaScrims/Screens/SplashScreen/splashScreenLoggedIn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//importing Screens
import 'Screens/SplashScreen/splashScreenNotLoggedIn.dart';

//importing controllers
import './Controllers/Proivders/earthFlareState.dart';
import './Controllers/Proivders/AuthProvider/auth.dart';
import './Controllers/Proivders/ExploreScreenState/exploreScreenProvider.dart';
import './Controllers/Proivders/ExploreScreenState/tourListProvider.dart';
import './Controllers/Proivders/UserState/userState.dart';
import './Controllers/Proivders/StoreScreenState/storeScreenProvider.dart';
import './Controllers/Proivders/AuthProvider/registerScreenState.dart';
import './Controllers/Proivders/MainScreenProvider/mainScreenState.dart';
import './Controllers/Proivders/HomeScreenState/tourGetReadyProvider.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FlareState>(
          create: (context) => FlareState(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterScreenState(),
        ),
        ChangeNotifierProvider<ShopScreenProvider>(
          create: (context) => ShopScreenProvider(),
        ),
        ChangeNotifierProvider<Auth>(
          create: (_) => Auth(),
        ),
        ChangeNotifierProvider<ExploreScreenProvider>(
          create: (_) => ExploreScreenProvider(),
        ),
        ChangeNotifierProvider<TourListProvider>(
          create: (_) => TourListProvider(),
        ),
        ChangeNotifierProvider<MainScreenState>(
          create: (_) => MainScreenState(),
        ),
        ChangeNotifierProvider<TourGetReadyProvider>(
          create: (_) => TourGetReadyProvider(),
        ),
        // ProxyProvider<Auth,UserState>(update: (_ , auth , previousUserState)=> UserState(auth:auth),),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, child) => MaterialApp(
          title: 'Arena',
          home: auth.isLoggedIn
              ? SplashScreenLogedIn()
              : SplashScreenNotLogedIn(),
        ),
      ),
    );
  }
}
