// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:minia_web_project/comman/colors.dart';

// # Table head
class TableHead extends StatelessWidget {
  const TableHead({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.boxborder),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Table head",
                  style: TextStyle(
                    fontSize: 15.4,
                    fontWeight: FontWeight.w600,
                    color: AppColor.dark,
                  ),
                ),
                Container(height: 6),
                Text(
                  'For basic styling—light padding and only horizontal dividers—add the base class',
                  style: TextStyle(
                    color: AppColor.lightdark,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Tabless(),
        ),
      ],
    );
  }
}

// # Striped rows

class StripedRows extends StatelessWidget {
  const StripedRows({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.boxborder),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Striped rows",
                  style: TextStyle(
                    fontSize: 15.4,
                    fontWeight: FontWeight.w600,
                    color: AppColor.dark,
                  ),
                ),
                Container(height: 6),
                RichText(
                  text: TextSpan(
                    text: 'Use',
                    style: TextStyle(
                      color: AppColor.lightdark,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' .table-striped',
                        style: TextStyle(
                          color: AppColor.darkpink,
                          fontSize: 11.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text:
                            '  to add zebra-striping to any table row within the',
                        style: TextStyle(
                          color: AppColor.lightdark,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '  <tbody>.',
                        style: TextStyle(
                          color: AppColor.darkpink,
                          fontSize: 11.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Lights(),
        ),
      ],
    );
  }
}

// table head
class Tabless extends StatelessWidget {
  const Tabless({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: AppColor.boxborder,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: BasicTexts(
                      text: "#",
                      textAlign: TextAlign.center,
                      size: 15,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: BasicTexts(
                      text: "First Name",
                      size: 15,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: BasicTexts(
                      text: "Last Name",
                      size: 15,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: BasicTexts(
                      text: "Username",
                      size: 15,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: BasicTexts(
                  text: "1",
                  textAlign: TextAlign.center,
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "Mark",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "Otto",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "@mdo",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: BasicTexts(
                  text: "2",
                  textAlign: TextAlign.center,
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "Jacob",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "Thornton",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "@fat",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: BasicTexts(
                  text: "3",
                  textAlign: TextAlign.center,
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "Larry",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "the Bird",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "@twitter",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

// colors 1 &  3

class Lights extends StatelessWidget {
  const Lights({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: BasicTexts(
                  text: "#",
                  textAlign: TextAlign.center,
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "First Name",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "Last Name",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "Username",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Divider(),
          Container(
            color: AppColor.boxborder,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: BasicTexts(
                      text: "1",
                      textAlign: TextAlign.center,
                      size: 15,
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: BasicTexts(
                      text: "Mark",
                      size: 15,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: BasicTexts(
                      text: "Otto",
                      size: 15,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: BasicTexts(
                      text: "@mdo",
                      size: 15,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: BasicTexts(
                  text: "2",
                  textAlign: TextAlign.center,
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "Jacob",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "Thornton",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                flex: 2,
                child: BasicTexts(
                  text: "@fat",
                  size: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Container(
            color: AppColor.boxborder,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: BasicTexts(
                      text: "3",
                      textAlign: TextAlign.center,
                      size: 15,
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: BasicTexts(
                      text: "Larry",
                      size: 15,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: BasicTexts(
                      text: "the Bird",
                      size: 15,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: BasicTexts(
                      text: "@twitter",
                      size: 15,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class BasicTexts extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  const BasicTexts({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    required this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
