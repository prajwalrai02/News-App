import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/services/newsServices.dart';

class NewsApp extends StatefulWidget {
  const NewsApp();

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  NewsServices newsServices = NewsServices();

  List<Article> article = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<List<Article>> future = newsServices.getArticle();
    future.then((List<Article> artilce) {
      this.article = artilce;
    }).catchError((err) => print("Error is $err"));
  }

  @override
  Widget build(BuildContext context) {
    const newsurl =
        "https://media4.s-nbcnews.com/i/newscms/2019_01/2705191/nbc-social-default_b6fa4fef0d31ca7e8bc7ff6d117ca9f4.png";
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(222, 80, 82, 228),
            title: Text("Home"),
            bottom: TabBar(
              isScrollable: true,
              indicatorWeight: 1,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              tabs: [
                Tab(
                  child: Text('For you'),
                ),
                Tab(
                  child: Text('Trending'),
                ),
                Tab(
                  child: Text('Gaming'),
                ),
                Tab(
                  child: Text('Science'),
                ),
                Tab(
                  child: Text(' More'),
                )
              ],
            ),
            actions: const [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                  color: Colors.white70,
                ),
              ),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ))
            ],
            shadowColor: Colors.blueGrey,
          ),
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              children: [
                // SizedBox(height: 10),
                Expanded(
                    child: FutureBuilder<List<Article>>(
                  future: NewsServices().getArticle(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              snapshot.data![index].title,
                              maxLines: 3,
                            ),
                            leading: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          snapshot.data![index].urlToImage))),
                            ),
                          );
                        },
                      );
                    }
                  },
                ))
              ],
            ),
          ))),
    );
  }
}
