import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:swipe_stack/swipe_stack.dart';

class SetCardMode extends StatefulWidget {
  SetCardMode();

  @override
  _SetCardModeState createState() => _SetCardModeState();
}

class _SetCardModeState extends State<SetCardMode>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final GlobalKey<SwipeStackState> _swipeKey = GlobalKey<SwipeStackState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Material(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Title'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ],
            ),
            body: SafeArea(
                child: new Stack(children: [
              SwipeStack(
                key: _swipeKey,
                children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((int index) {
                  return SwiperItem(
                      builder: (SwiperPosition position, double progress) {
                    return Material(
                        elevation: 4,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: Text('test')));
                  });
                }).toList(),
                visibleCount: 11,
                stackFrom: StackFrom.Top,
                translationInterval: 6,
                scaleInterval: 0.03,
                onEnd: () => debugPrint("onEnd"),
                onSwipe: (int index, SwiperPosition position) =>
                    debugPrint("onSwipe $index $position"),
                onRewind: (int index, SwiperPosition position) =>
                    debugPrint("onRewind $index $position"),
              ),
              FlatButton(
                onPressed: () {
                  _swipeKey.currentState.swipeRight();
                },
                child: new Text('Next'),
              )
            ]))));
  }

  @override
  bool get wantKeepAlive => true;
}
