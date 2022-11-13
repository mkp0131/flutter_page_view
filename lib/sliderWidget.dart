import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  // 타이머
  Timer? timer;

  // 페이지뷰 컨트롤러
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 타이머
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if (currentPage >= 2) {
        nextPage = 0;
      }

      // 페이지 이동
      controller.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return PageView(
      controller: controller, // 컨트롤러 삽입
      children: [1, 2, 3]
          .map((number) => Image.asset(
                'assets/images/img_$number.webp',
                fit: BoxFit.cover,
              ))
          .toList(),
    );
  }
}
