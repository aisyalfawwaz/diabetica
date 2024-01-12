import 'package:flutter/material.dart';
import 'package:diabetica/services/DiabeticaCareServices.dart';

class DiabeticaCareListView extends StatefulWidget {
  @override
  _DiabeticaCareListViewState createState() => _DiabeticaCareListViewState();
}

class _DiabeticaCareListViewState extends State<DiabeticaCareListView> {
  late List<String> imageUrls = []; // Initialize with an empty list

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  Future<void> fetchImages() async {
    final service = DiabeticaCareService();
    final urls = await service.fetchImages();

    setState(() {
      imageUrls = urls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls
            .length, // Removed null check, as imageUrls is no longer nullable
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Card(
              elevation: 2.0,
              margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
