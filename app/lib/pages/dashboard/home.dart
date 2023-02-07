
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/ThemeUi.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(  const MaterialApp(
    home: Main(),
  ),);
}
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        color: ThemeUi.background,
        home: Scaffold(
          backgroundColor: ThemeUi.background,
          body:null,
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: const FloatingActionButton(
            onPressed:null,
            child:  Icon(Icons.add),
            // backgroundColor: ThemeUi.nearlyDarkBlue,
            backgroundColor: ThemeUi.nearlyDarkBlue,
          ),
          bottomNavigationBar: BottomAppBar(),
        )
    );
  }

}

