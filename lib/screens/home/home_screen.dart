import 'package:flutter/material.dart';
import 'package:myproject/models/post_model.dart';
import 'package:myproject/screens/auth/signin.dart';
import 'package:myproject/screens/home/detail_screen.dart';
import 'package:myproject/widgets/buttons.dart';

import '../../constansts/color_const.dart';
import '../../services/data_handeler/data_handeler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Post>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = DataHandeler().fetchhotelpost();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "List View",
            style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w700),
          ),
        ),
        elevation: 0,
        backgroundColor: kprimaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "John Doe",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  "demo@gmail.com",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: size.width * 0.045,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: size.width * 0.5,
                    child: Genaralbutton(
                      onpress: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SigninPage();
                            },
                          ),
                        );
                      },
                      text: "Logout",
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Post> data = snapshot.data as List<Post>;

                  if (data.isNotEmpty) {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, indext) {
                          var item = data[indext];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailsScreen(model: item);
                                  },
                                ),
                              );
                            },
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://ichef.bbci.co.uk/news/976/cpsprodpb/C17B/production/_126313594_gettyimages-1217576289.jpg"),
                                  radius: 30,
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text(
                                  data[indext].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: kdefualtfontcolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.037),
                                ),
                                subtitle: Text(item.address,
                                    style: TextStyle(
                                        color: kdefualtfontcolor
                                            .withOpacity(0.7))),
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Text("No data");
                  }
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default show a loading spinner.
                return const Center(
                  child: const CircularProgressIndicator(),
                );

                //  Center(
                //     child: Lottie.asset("assets/animation/loading4.json",
                //         width: size.height * 0.12));
              },
            ),
          ),
        ],
      ),
    );
  }
}
