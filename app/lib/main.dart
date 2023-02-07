
import 'package:flutter/material.dart';
import 'config/ThemeUi.dart';

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
          body: null,
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: const FloatingActionButton(
            onPressed: null,
            child:  Icon(Icons.add),
            // backgroundColor: ThemeUi.nearlyDarkBlue,
            backgroundColor: ThemeUi.nearlyDarkBlue,
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: ThemeUi.nearlyWhite,
            child:IconTheme(
                data: const IconThemeData(
                    color: ThemeUi.darkText
                ),
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      IconButton(onPressed: null, icon: Icon(Icons.storefront)),
                      IconButton(onPressed: null, icon: Icon(Icons.fastfood)),
                      SizedBox(width: 24),
                      IconButton(onPressed: null, icon: Icon(Icons.receipt)),
                      IconButton(onPressed: null, icon: Icon(Icons.person))
                    ],
                  ),
                )),
          ),
        )
    );
  }

}

