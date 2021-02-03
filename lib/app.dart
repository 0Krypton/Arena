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
import './Controllers/Proivders/UserState/userState.dart';
import 'Controllers/Proivders/StoreScreenState/storeScreenProvider.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FlareState>(
          create: (context) => FlareState(),
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
