import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onbills/screens/home.screen.dart';
import 'package:onbills/screens/bills.screen.dart';
import 'package:onbills/screens/plan.screen.dart';
import 'package:onbills/screens/settings.screen.dart';
import 'package:onbills/utils/global.dart';


class OBBottomBar extends StatefulWidget {
  @override
  _OBBottomBarState createState() => _OBBottomBarState();
}

class _OBBottomBarState extends State<OBBottomBar> {

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Rodou build() em ' + this.toString());
    return BottomNavigationBar(
      currentIndex: Global.selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        //setState(() {
          Global.selectedIndex = index;
          print("Indice do elemento selecionado: $index");
        //});
          switch (index) {
          case 0: { 
            Get.off(HomeScreen(subtitle: 'Principal'), duration: Duration.zero);
            break;
          }
          case 1: {
            Get.off(BillsScreen(), duration: Duration.zero);
            break;
          }
          case 2: {
            Get.off(PlanScreen(), duration: Duration.zero);
            break;
          }
          case 3: {
            Get.off(SettingsScreen(), duration: Duration.zero);
            break;
          }
        }
        
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done_outline),
          title: Text('Contas'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          title: Text('Plano'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Ajustes'),
        ),
      ],
    );
  }
}
