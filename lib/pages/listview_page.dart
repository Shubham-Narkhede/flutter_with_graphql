import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vesatogo_task/common/back_function.dart';
import 'package:vesatogo_task/common/color_helper.dart';
import 'package:vesatogo_task/network/graphql_data.dart';
import 'package:vesatogo_task/pages/description_page.dart';
import 'package:vesatogo_task/pages/drawe_page.dart';
import 'package:vesatogo_task/widget/listview_card.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _selectionScreen();
  }
}

class _selectionScreen extends State<ListViewPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: DrawerPage(),
      // backgroundColor: LightColor.black,
      appBar: AppBar(
        title: Text("Fetch Data"),
        centerTitle: true,
        backgroundColor: LightColor.black,
      ),
      body: Query(
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          // print("================>>${result.data}");
          // print("================>>===>>${result.exception}");
          if (result.exception != null) {
            return Center(
                child: Text(
              result.exception.toString(),
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ));
          }
          if (result.loading) {
            return Center(child: CircularProgressIndicator());
          }
          List jobs_data = result.data['jobs'];
          return ListView.builder(
            itemCount: jobs_data.length,
            itemBuilder: (context, index) {
              // print(
              //     "================>>===>>===>>${jobs_data[index]}");
              final repository = jobs_data[index];
              return Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, bottom: 8, right: 10),
                  child: InkWell(
                    child: ListViewCarf(
                      title: repository['title'],
                      description: repository['description'],
                    ),
                    onTap: () {
                      BackFunction.commonNavigator(
                          context,
                          DescriptionPage(
                            description: repository['description'].toString(),
                            title: repository['title'].toString(),
                            applyUrl: repository['applyUrl'].toString(),
                            companyName:
                                repository['company']['name'].toString(),
                            locationName:
                                repository['locationNames'].toString(),
                            id: repository['id'].toString(),
                          ));
                    },
                  ));
            },
          );
        },
        options: QueryOptions(document: readRepositories),
      ),
    );
  }
}
