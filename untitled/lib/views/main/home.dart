import 'package:flutter/material.dart';
import 'package:untitled/config/themeUi.dart';
import '../widget/NavigationDrawer.dart';
import '../widget/SimpleBarChart.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumo'),
        backgroundColor: ThemeUi.primary,

      ),
      drawer: const NavigationDrawer(),
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
         _buildM(context)
        ],
      ),
    );
  }

  // WidgetS
  Widget _buildVendasPorCategoriaCard(){
    return Container(

      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        color: ThemeUi.white,
        border: Border(
          left: BorderSide( //                   <--- left side
            color: ThemeUi.border_color,
            width:2.0,
          ),
          top: BorderSide( //                   <--- left side
            color: ThemeUi.border_color,
            width:2.0,
          ),
          bottom: BorderSide( //                   <--- left side
            color: ThemeUi.border_color,
            width:2.0,
          ),
          right: BorderSide( //                   <--- left side
            color: ThemeUi.border_color,
            width:2.0,
          ),

        ),
      ),
      child:       Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Ola mundo"),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
  Widget _buildBalanceYearly(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'TOTAL MENSAL',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 10.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          '50.000,00',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
          ),
        ),

      ],
    );
  }
  Widget _buildBalanceMonthly(){
    return Container (
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide( //                   <--- left side
              color: Colors.white,
              width: 1.0,
            ),

          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Text(
              'TOTAL ANUAL',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 10.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              '50.000,00',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),

          ],
        )
    );
  }
  Widget _buildBalanceDaily(){
    return Column(
      children: [
        Text(
          'TOTAL DIÁRIO',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          '50.000,00',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
  Widget _buildBalanceCard(){
    return  SizedBox(
      height: 200,
      child:   Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: ThemeUi.primary,
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            padding: EdgeInsets.all(30.0),
            child:   SizedBox(
              height: double.infinity,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildBalanceDaily(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: _buildBalanceYearly(),
                      ),
                      Expanded(
                        flex: 5,
                        child: _buildBalanceMonthly(),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
  Widget _buildM(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      color: ThemeUi.background,
      home: Scaffold(
        backgroundColor: ThemeUi.background,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildBalanceCard(),
                SizedBox(
                  height: 10.0,
                ),
                _buildVendasPorCategoriaCard(),
                SimpleBarChart(animate: false,)
              ],
            ),
          ),
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloatingActionButton(
          onPressed:null,
          child:  Icon(Icons.add),
          // backgroundColor: ThemeUi.nearlyDarkBlue,
          backgroundColor: ThemeUi.primary,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: ThemeUi.white,
          notchMargin: 6,
          child: IconTheme(
            data: const IconThemeData(color: ThemeUi.white), child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                IconButton(onPressed: null, icon: Icon(Icons.home)),
                IconButton(onPressed: null, icon: Icon(Icons.home)),
                const SizedBox(width: 24),
                IconButton(onPressed: null, icon: Icon(Icons.home)),
                IconButton(onPressed: null, icon: Icon(Icons.home))
              ],
            ),
          ),
          ),


        ),

      ),
    );

  }


}
