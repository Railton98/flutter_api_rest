import 'package:flutter/material.dart';
import 'package:flutter_api_rest/src/pages/home/home_bloc.dart';
import 'package:flutter_api_rest/src/pages/home/home_module.dart';
import 'package:flutter_api_rest/src/pages/home/subpages/create/create_page.dart';
import 'package:flutter_api_rest/src/pages/update/update_page.dart';
import 'package:flutter_api_rest/src/shared/models/post_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  void initState() {
    bloc.getPosts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<PostModel>>(
          stream: bloc.responseOut,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            if (snapshot.hasData) {
              return Column(
                children: snapshot.data
                    .map(
                      (item) => ListTile(
                        title: Text(item.title),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdatePage(
                                snapshot: item,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePage(
                onSuccess: bloc.getPosts,
              ),
            ),
          );
        },
      ),
    );
  }
}
