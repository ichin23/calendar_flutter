import 'package:bottom/desktop/widgets/calendar.dart';
import 'package:bottom/desktop/widgets/leftBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> anim;
  late AnimationController animCont;

  @override
  void initState() {
    super.initState();
    animCont = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    anim = Tween<double>(begin: 50, end: 200)
        .animate(CurvedAnimation(parent: animCont, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(mainAxisSize: MainAxisSize.max, children: [
        LeftBar(anim, animCont),
        //RotatedBox(quarterTurns: 1, child: Divider())
        Expanded(child: Calendar(anim))
      ]),
    );
  }

  @override
  void dispose() {
    animCont.dispose();
    super.dispose();
  }
}
