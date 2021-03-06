// class GraphQLData{
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

HttpLink httpLink = HttpLink(uri: 'https://api.graphql.jobs/');

ValueNotifier<GraphQLClient> client =
    ValueNotifier<GraphQLClient>(GraphQLClient(
  link: httpLink,
  cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
));
// }

GraphQLClient clientToQuery() {
  return GraphQLClient(
    cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    link: httpLink,
  );
}

String readRepositories = """
query Get_job_API {
  jobs {
    id
    title
    cities {
      id
      name
    }
    description
    commitment {
      title
      id
    }
    applyUrl
    locationNames
    company {
      name
    }
  }
}

                        """;

String addJob(String title, String applyUrl, String userEmail,
    String companyName, String locationNames, String description) {
  return """
mutation {
  postJob(
    input: {
      title: "$title"
      applyUrl: "$applyUrl"
      userEmail: "$userEmail"
      companyName: "$companyName"
      locationNames: "$locationNames"
      description: "$description"
      commitmentId: "cjtu8esth000z0824x00wtp1i"
    }
  ) {
    id
    description
  }
}  
     """;
}

String updateJob(String description, String id) {
  return """
mutation {
  updateJob(
    input:{
      description: "$description"
      id: "$id"
    }
    adminSecret: "My_key"
  ) {
    id
    description
  }
}
     """;
}
