import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar(this.anim, {Key? key}) : super(key: key);
  final Animation<double> anim;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime data = DateTime.now();

  late DateTime diaI;
  late DateTime ultimoDia;
  late DateTime primeiroDia;
  bool dia1Pronto = false;

  List<String> dias = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"];
  List<String> months = [
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ];

  late List week;
  List weeks = [];

  @override
  void initState() {
    super.initState();
    primeiroDia = DateTime(data.year, data.month, 1);
    ultimoDia = DateTime(primeiroDia.year, primeiroDia.month + 1, 0);
    diaI = primeiroDia;
    while (diaI.day <= ultimoDia.day) {
      weeks.add(List.generate(7, (index) {
        if (!dia1Pronto) {
          if (index == diaI.weekday) {
            dia1Pronto = true;
            return diaI;
          } else {
            return null;
          }
        } else {
          diaI = diaI.add(const Duration(days: 1));
          return diaI;
        }
      }));
      if (diaI.isAfter(ultimoDia)) {
        break;
      }
    }
    print(weeks);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            width: size.width - widget.anim.value,
            decoration: const BoxDecoration(
                color: Color(0xffACBDF5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Text("${months[data.month - 1]} - ${data.year.toString()}"),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Color(0xff252125),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              width: size.width - widget.anim.value,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: dias
                        .map((e) => Text(
                              e,
                              style: const TextStyle(color: Colors.white),
                            ))
                        .toList(),
                  ),
                  Expanded(
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          /* ...List.filled(data.weekday, Container()),
                          Text(data.day.toString()) */
                          ...weeks
                              .map((e) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ...e
                                            .map((f) => Container(
                                                alignment: Alignment.center,
                                                height:
                                                    (size.height - 80 - 80) /
                                                        weeks.length,
                                                width: (size.width -
                                                        widget.anim.value -
                                                        30 -
                                                        100) /
                                                    7,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: f != null
                                                        ? f.day == data.day
                                                            ? const Color(
                                                                0xffACBDF5)
                                                            : const Color(
                                                                0xff3C353C)
                                                        : Colors.transparent),
                                                child: f != null
                                                    ? Text(
                                                        f.day.toString(),
                                                        style: TextStyle(
                                                            color: f.isAfter(
                                                                    ultimoDia)
                                                                ? Colors.white24
                                                                : Colors.white,
                                                            fontSize: 40),
                                                      )
                                                    : Container()))
                                            .toList()
                                      ]))
                              .toList()
                        ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
