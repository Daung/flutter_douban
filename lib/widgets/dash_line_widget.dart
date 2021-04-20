import 'package:flutter/material.dart';

class WZDashedLine extends StatelessWidget {
  final Axis axis;
  final int count;
  final Color color;
  final double width;
  final double height;

  WZDashedLine(
      {this.axis: Axis.horizontal,
      @required this.count,
      this.color: Colors.red,
      this.width: 1,
      this.height: 1});

  build(context) => Flex(
        direction: axis,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            count,
            //如果不使用参数列表， 可以使用下划线代替 放在括号里面(_)
            (_) => SizedBox(
                  width: width,
                  height: height,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(5)),
                  ),
                )),
      );
}
