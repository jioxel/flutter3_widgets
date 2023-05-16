import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infiniteScroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      // scrollController.position.pixels  -----> posicion actual
      // scrollController.position.maxScrollExtent  --------> posicion final
      final amountPixelesUntilReachingEnd =
          scrollController.position.maxScrollExtent -
              scrollController.position.pixels;
      if (amountPixelesUntilReachingEnd < 300) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  //
  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    moveScrollToBottom();
    setState(() {});
    await Future.delayed(Duration(seconds: 3));
    addFiveImages();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: Duration(microseconds: 300), curve: Curves.fastOutSlowIn);
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 3));

    if (!isMounted) return;
    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    print(imagesIds);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
              controller: scrollController,
              itemCount: imagesIds.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder: AssetImage('assets/images/jar-loading.gif'),
                    image:
                        NetworkImage('http://picsum.photos/id/$index/500/300'));
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: !isLoading
            ? FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined))
            : SpinPerfect(
                child: Icon(Icons.refresh_rounded),
                infinite: true,
              ),
      ),
    );
  }
}
