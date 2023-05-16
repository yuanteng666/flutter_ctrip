import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<String> imgs = [
    'https://tse1-mm.cn.bing.net/th/id/OIP-C.2lrdtxf0nX8RMD0ZoQz4hwHaE8?w=257&h=180&c=7&r=0&o=5&dpr=2&pid=1.7',
    'https://tse1-mm.cn.bing.net/th/id/OIP-C.2lrdtxf0nX8RMD0ZoQz4hwHaE8?w=257&h=180&c=7&r=0&o=5&dpr=2&pid=1.7',
    'https://tse1-mm.cn.bing.net/th/id/OIP-C.2lrdtxf0nX8RMD0ZoQz4hwHaE8?w=257&h=180&c=7&r=0&o=5&dpr=2&pid=1.7',
    'https://tse1-mm.cn.bing.net/th/id/OIP-C.2lrdtxf0nX8RMD0ZoQz4hwHaE8?w=257&h=180&c=7&r=0&o=5&dpr=2&pid=1.7'
  ];

  double _opacity = 0;

  _onScroll(double offset) {
    double opacity = offset / APPBAR_SCROLL_OFFSET;
    if (_opacity > 1) {
      opacity = 1;
    }
    if (_opacity < 0) {
      opacity = 0;
    }
    setState(() {
      _opacity = opacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(
          children: [
            NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  //滚动且是列表滚动的时候
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return false;
              },
              child: ListView(
                children: [
                  SizedBox(
                    height: 160,
                    child: Swiper(
                      itemCount: imgs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(imgs[index], fit: BoxFit.fill);
                      },
                      pagination: const SwiperPagination(),
                    ),
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: _opacity,
              child: const SizedBox(
                height: 80,
                child: Text("我是测试头部"),
              ),
            )
          ],
        ));
  }
}
