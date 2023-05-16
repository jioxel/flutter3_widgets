import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Look for food',
      'Reprehenderit nulla dolore eu id in eu cillum mollit laborum excepteur ex.',
      'assets/images/1.png'),
  SlideInfo(
      'Fast delivery',
      'Fugiat proident amet ut in commodo aliquip velit ad nulla ad dolore nostrud officia.',
      'assets/images/2.png'),
  SlideInfo(
      'Enjoy the food',
      'Dolore officia pariatur nostrud nostrud aliqua laboris excepteur quis veniam ut cupidatat consequat labore.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController = PageController();
  bool endReached = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0.0;
      if (page >= (slides.length - 1.5) && !endReached) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageViewController,
              physics: BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList()),
          Positioned(
              right: 20,
              height: 90,
              child: TextButton(
                child: Text(
                  'Skip',
                ),
                onPressed: () => context.pop(),
              )),
          Positioned(
              bottom: 30,
              right: 30,
              child: endReached
                  ? FadeInRight(
                      delay: const Duration(milliseconds: 500),
                      from: 15,
                      child: FilledButton(
                          child: Text('Start'),
                          onPressed: () {
                            context.pop();
                          }),
                    )
                  : SizedBox())
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(
      {super.key,
      required this.title,
      required this.caption,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    final captionStyles = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyles,
            )
          ],
        ),
      ),
    );
  }
}
