import 'package:flutter/material.dart';

class LeftBarItem extends StatefulWidget {
  const LeftBarItem(this.width, this.icon, this.label, {Key? key})
      : super(key: key);
  final double width;
  final String label;
  final Icon icon;
  @override
  State<LeftBarItem> createState() => _LeftBarItemState();
}

class _LeftBarItemState extends State<LeftBarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      alignment: Alignment.centerLeft,
      child: widget.width < 150
          ? widget.icon
          : Row(
              children: [
                widget.icon,
                Text(
                  widget.label,
                  style:
                      const TextStyle(color: Color(0xffACBDF5), fontSize: 30),
                )
              ],
            ),
    );
  }
}
