import 'package:blog/constant/route_constant.dart';
import '../ui/binding/blog_binding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ui/screenns/home_screen.dart';


List<GetPage> getPages = [
  GetPage(
      name: RouteConstant.homeScreen,
      page: () =>  HomeScreen(),
      middlewares:  [
        // Add here
        // AuthGuard(),
      ],
      binding: HomeScreenBinding()),
];