import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedRaiWidget extends StatelessWidget {
  final Widget child;

  const AnimatedRaiWidget({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation = NavigationRail.extendedAnimation(context);

    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
              height: 56,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: FloatingActionButton.extended(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text(
                                "ec2-userが他社のAppやWebサイトを横断してあなたのアクティビティの追跡することを許可しますか？"),
                            content: Text(
                                "ec2-userはより積雪で関連性の高い広告を表示するためにトラッキングを行います。"),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: Text("Appにトラッキングしないように要求", style: TextStyle(color: Colors.blue),),
                                isDestructiveAction: true,
                                onPressed: () => Navigator.pop(context),
                              ),
                              CupertinoDialogAction(
                                child: Text("許可"),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    label: child,
                    isExtended: animation.status != AnimationStatus.dismissed),
              ),
            ),
        child: child);
  }
}
