import 'package:flutter/material.dart';
import 'package:myproject/constansts/color_const.dart';
import 'package:myproject/models/post_model.dart';
import 'package:myproject/screens/home/map_screen.dart';

//details page
class DetailsScreen extends StatelessWidget {
  final Post model;
  const DetailsScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: kdefualtfontcolor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.place,
              color: kdefualtfontcolor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MapScreen(
                      model: model,
                    );
                  },
                ),
              );
            },
          ),
        ],
        title: Center(
          child: Text(
            "Details Page",
            style: TextStyle(
                color: kdefualtfontcolor.withOpacity(0.8),
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w700),
          ),
        ),
        elevation: 0,
        backgroundColor: kprimaryColor,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://ichef.bbci.co.uk/news/976/cpsprodpb/C17B/production/_126313594_gettyimages-1217576289.jpg",
                width: size.width * 0.6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: kdefualtfontcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.056),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(model.description,
                    style: TextStyle(
                        color: kdefualtfontcolor.withOpacity(0.7),
                        fontSize: size.width * 0.04)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
