import 'package:flutter/material.dart';

class WZRatingBar extends StatelessWidget {
  final int count;
  final double rating;
  final double score;
  final Widget selectedImage;
  final Widget unSelectedImage;
  final Color selectedColor;
  final Color unSelectedColor;

  WZRatingBar(this.rating,
      {this.count: 5,
      this.score: 10,
      this.selectedColor: Colors.red,
      this.unSelectedColor: Colors.grey,
      //细心体会初始化列表和普通参数列表的区别
      Widget selectedImage,
      Widget unSelectedImage})
      : selectedImage = selectedImage ?? _DefaultSelectedRating(selectedColor),
        unSelectedImage =
            unSelectedImage ?? _DefaultUnSelectedRating(unSelectedColor);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _WZUnSelectRating(count, unSelectedImage),
        _WZSelectRating(count, rating, score, selectedImage)
      ],
    );
  }
}

class _WZCustomRectClip extends CustomClipper<Rect> {
  final double clipWidth;

  _WZCustomRectClip(this.clipWidth);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, clipWidth * size.width, size.height);
  }

  @override
  bool shouldReclip(_WZCustomRectClip oldClipper) {
    return oldClipper.clipWidth != this.clipWidth;
  }
}

class _WZSelectRating extends StatelessWidget {
  final int count;
  final double rating;
  final double score;
  final Widget selectedRating;

  const _WZSelectRating(
      this.count, this.rating, this.score, this.selectedRating,
      {Key key})
      : super(key: key);

  List<Widget> _selectRating() {
    List<Widget> _ratings = [];

    int completeRating = (count * rating / score).floor();

    double leaveRating = (count * rating / score) - completeRating;

    print("complete start is $completeRating, leaveRating is $leaveRating");

    _ratings.addAll(List.generate(completeRating, (index) => selectedRating));

    if (leaveRating > 0) {
      _ratings.add(ClipRect(
        clipper: _WZCustomRectClip(leaveRating),
        child: selectedRating,
      ));
    }

    return _ratings;
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: _selectRating());
  }
}

class _WZUnSelectRating extends StatelessWidget {
  final int count;
  final Widget unSelectedRating;

  const _WZUnSelectRating(this.count, this.unSelectedRating, {Key key})
      : super(key: key);

  List<Widget> _unSelectedRating() {
    return List.generate(count, (index) => unSelectedRating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _unSelectedRating(),
    );
  }
}

class _DefaultSelectedRating extends StatelessWidget {
  final Color selectedColor;

  const _DefaultSelectedRating(this.selectedColor);

  build(context) => Icon(
        Icons.star,
        color: selectedColor,
      );
}

class _DefaultUnSelectedRating extends StatelessWidget {
  final Color unSelectedColor;

  const _DefaultUnSelectedRating(this.unSelectedColor);

  build(context) => Icon(
        Icons.star_border,
        color: unSelectedColor,
      );
}
