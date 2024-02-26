import 'package:scids/screens/home.dart';
import 'package:scids/screens/profile.dart';
import 'package:scids/screens/search.dart';

final List bottomNavBarItems = [
  {
    "icon": 'assets/home.svg',
    "active_icon": 'assets/home.svg',
    "view": const HomeView(),
  },
  {
    "icon": 'assets/search.svg',
    "active_icon": 'assets/search.svg',
    "view": const SearchView(),
  },
  {
    "icon": 'assets/profile.svg',
    "active_icon": 'assets/profile.svg',
    "view": const ProfileView(),
  },
];
