import 'package:bottom/desktop/widgets/leftBarItem.dart';
import 'package:flutter/material.dart';

class LeftBar extends StatefulWidget {
  const LeftBar(this.anim, this.animCont, {Key? key}) : super(key: key);
  final Animation<double> anim;
  final AnimationController animCont;
  @override
  State<LeftBar> createState() => _LeftBarState();
}

class _LeftBarState extends State<LeftBar> {
  @override
  Widget build(BuildContext context) {
    var animCont = widget.animCont;
    var anim = widget.anim;
    var size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (ev) {
        animCont.forward();
      },
      onExit: (ev) {
        animCont.reverse();
      },
      child: Material(
        elevation: 5,
        child: SizedBox(
          height: size.height,
          width: anim.value,
          child: ListView(
            children: [
              LeftBarItem(
                  anim.value,
                  const Icon(
                    Icons.home,
                    size: 40,
                    color: Color(0xffACBDF5),
                  ),
                  "Home"),
            ],
          ),
        ),
      ),
    );
  }
}
