import 'package:flutter/material.dart';
import 'package:tech_news_app/backend/functions.dart';
import 'package:tech_news_app/components/appbar.dart';
import 'package:tech_news_app/components/newsbox.dart';
import 'package:tech_news_app/components/searchbar.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List> news;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: appBar(),
      body: Column(
        children: [
          searchBar(),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder<List>(
                future: fetchnews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return newsBox(
                          imageurl:
                              snapshot.data![index]['urlToImage'] != null
                                  ? snapshot.data![index]['urlToImage']
                                  : constants.imageurl,
                          title: snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                          description:
                              snapshot.data![index]['description'].toString(),
                          url: snapshot.data![index]['url'],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
