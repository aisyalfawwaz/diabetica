import 'package:flutter/material.dart';
import 'package:diabetica/models/News.dart';
import 'package:diabetica/services/NewsServices.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HorizontalListView extends StatefulWidget {
  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  late Future<List<News>> _newsData;
  final NewsService _newsService = NewsService();
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _newsData = _newsService.fetchNews();
    _pageController = PageController(viewportFraction: 0.85);
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: _newsData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return Column(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: 200, // Set height sesuai kebutuhan
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: snapshot.data!.length > 5
                        ? 5 // Menampilkan maksimal 5 item
                        : snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final news = snapshot.data![index];
                      return AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          double value = 1;
                          if (_pageController.position.haveDimensions) {
                            value = _pageController.page! - index;
                            value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                          }
                          return Center(
                            child: SizedBox(
                              height: Curves.easeOut.transform(value) * 200,
                              width: Curves.easeOut.transform(value) * 400,
                              child: child,
                            ),
                          );
                        },
                        child: Card(
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                child: AspectRatio(
                                  aspectRatio:
                                      1, // Ganti dengan aspek rasio yang sesuai
                                  child: Image.network(
                                    news.urlToImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.all(4.0),
                              //   // child: Text(
                              //   //   news.title,
                              //   //   maxLines: 2,
                              //   //   overflow: TextOverflow.ellipsis,
                              //   //   style: TextStyle(
                              //   //     fontWeight: FontWeight.bold,
                              //   //   ),
                              //   // ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              DotsIndicator(
                dotsCount: snapshot.data!.length > 5
                    ? 5 // Jumlah titik maksimal 5
                    : snapshot.data!.length,
                position: _currentIndex.toDouble(),
                decorator: DotsDecorator(
                  color: Colors.grey, // Warna titik tidak aktif
                  activeColor: Colors.blue, // Warna titik aktif
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
