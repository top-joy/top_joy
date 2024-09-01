import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/pages/home_screen.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0); 
  final List<Widget> pages = const [
    HomeScreen(),
    Placeholder(),
    Placeholder(),
  ];

  void updateIndex(int index) {
    emit(index);
  }
}
