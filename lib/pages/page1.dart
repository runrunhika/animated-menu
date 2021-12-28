import 'package:animated_menu_sample/pages/page1a.dart';
import 'package:animated_menu_sample/pages/page1b.dart';
import 'package:animated_menu_sample/pages/page1c.dart';
import 'package:animated_menu_sample/pages/page1d.dart';
import 'package:animated_menu_sample/widget/animated_rai_widget.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int index = 0;
  final selectectedColor = Colors.white;
  final unselectedeColor = Colors.white60;
  final labelStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
  bool isExtended = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('NavigatoionRail')),
      ),
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Colors.blueAccent,
            selectedIndex: index,
            extended: isExtended,
            //groupAlignment: 0,
            //labelType: NavigationRailLabelType.all,
            selectedLabelTextStyle:
                labelStyle.copyWith(color: selectectedColor),
            unselectedLabelTextStyle:
                labelStyle.copyWith(color: unselectedeColor),

            selectedIconTheme: IconThemeData(color: Colors.white, size: 50),
            unselectedIconTheme: IconThemeData(
              color: Colors.white.withOpacity(.8),
            ),
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            leading: Material(
              clipBehavior: Clip.hardEdge,
              shape: CircleBorder(),
              child: Ink.image(
                width: 62,
                height: 62,
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                    'https://lh3.googleusercontent.com/0z0cB4ggAhVusCXSUzeJdL-JVxV-9_mUibbzp_4n8_ADOksYsM27L0AEblC7N4lr4nCx1JW8Ai8WpwhdJxPI7_93wnkxfw=s520-c'),
                child: InkWell(
                  onTap: () => setState(() => isExtended = !isExtended),
                ),
              ),
            ),
            trailing: AnimatedRaiWidget(
              child: isExtended
                  ? Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 28,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    )
                  : Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
            ),
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.switch_account), label: Text('1a')),
              NavigationRailDestination(
                  icon: Icon(Icons.favorite_border), label: Text('1b')),
              NavigationRailDestination(
                  icon: Icon(Icons.face), label: Text('1c')),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('1d'),
              ),
            ],
          ),
          Expanded(child: buildPages()),
        ],
      ),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return Page1a();
      case 1:
        return Page1b();
      case 2:
        return Page1c();
      case 3:
        return Page1d();

      default:
        return Page1a();
    }
  }
}
