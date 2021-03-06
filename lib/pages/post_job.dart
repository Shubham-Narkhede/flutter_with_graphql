import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vesatogo_task/common/back_function.dart';
import 'package:vesatogo_task/common/color_helper.dart';
import 'package:vesatogo_task/common/controller_data.dart';
import 'package:vesatogo_task/common/validation_data.dart';
import 'package:vesatogo_task/network/graphql_data.dart';
import 'package:vesatogo_task/pages/drawe_page.dart';
import 'package:vesatogo_task/pages/listview_page.dart';
import 'package:vesatogo_task/widget/button_page.dart';
import 'package:vesatogo_task/widget/custom_textinputdata.dart';

class PostJobs extends StatefulWidget {
  var fromPage;

  PostJobs({@required this.fromPage});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _selectionScreen();
  }
}

class _selectionScreen extends State<PostJobs> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool postjobautoValidate = false;
  final GlobalKey<FormState> postjobformKeyValidate = GlobalKey<FormState>();
  final postjobscaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: postjobscaffoldKey,
        drawer: DrawerPage(),
        body: SafeArea(
            child: Form(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height * .1,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(80)),
                        gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple.shade900,
                              Colors.deepPurple,
                              Colors.deepPurple.shade300
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: Center(
                      child: Text(
                        "Post Jobs",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          postjobscaffoldKey.currentState.openDrawer();
                        }),
                    right: 10,
                    top: 10,
                  )
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      child: CustomTextInputData(
                        onChanged: () {},
                        title: "Job Title:",
                        hintText: "Job Title",
                        textEditingController: AllControllers.nameController,
                        formFieldValidator: ValidationData.nameValidator,
                        textInputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        obsecureText: false,
                        filledColor: LightColor.grey,
                        fill: false,
                        enabledborderColor: Colors.black12,
                        input_text_color: Colors.black,
                        titleColor: Colors.black,
                        hint_text_color: Colors.black45,
                        error_text_color: Colors.black54,
                        content_padding: 15,
                        borderColor: Colors.black,
                        blurRadius: 2,
                        spreadRadius: 2,
                        right: 20,
                        left: 20,
                        dy: 2,
                        dx: 2,
                        maxline: 1,
                      ),
                      padding: EdgeInsets.only(left: 7, right: 7, top: 9),
                    ),
                    Padding(
                      child: CustomTextInputData(
                        onChanged: () {},
                        title: "Apply Url:",
                        hintText: "Apply Url",
                        textEditingController: AllControllers.urlController,
                        formFieldValidator: ValidationData.urlValidator,
                        textInputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        obsecureText: false,
                        filledColor: LightColor.grey,
                        fill: false,
                        enabledborderColor: Colors.black12,
                        input_text_color: Colors.black,
                        titleColor: Colors.black,
                        hint_text_color: Colors.black45,
                        error_text_color: Colors.black54,
                        content_padding: 15,
                        borderColor: Colors.black,
                        blurRadius: 2,
                        spreadRadius: 2,
                        right: 20,
                        left: 20,
                        dy: 2,
                        dx: 2,
                        maxline: 1,
                      ),
                      padding: EdgeInsets.only(left: 7, right: 7, top: 9),
                    ),
                    Padding(
                      child: CustomTextInputData(
                        onChanged: () {},
                        title: "Email:",
                        hintText: "Email",
                        textEditingController: AllControllers.emailController,
                        formFieldValidator: ValidationData.emailValidator,
                        textInputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        obsecureText: false,
                        filledColor: LightColor.grey,
                        fill: false,
                        enabledborderColor: Colors.black12,
                        input_text_color: Colors.black,
                        titleColor: Colors.black,
                        hint_text_color: Colors.black45,
                        error_text_color: Colors.black54,
                        content_padding: 15,
                        borderColor: Colors.black,
                        blurRadius: 2,
                        spreadRadius: 2,
                        right: 20,
                        left: 20,
                        dy: 2,
                        dx: 2,
                        maxline: 1,
                      ),
                      padding: EdgeInsets.only(left: 7, right: 7, top: 9),
                    ),
                    Padding(
                      child: CustomTextInputData(
                        onChanged: () {},
                        title: "Company Name:",
                        hintText: "Company Name",
                        textEditingController:
                            AllControllers.companynameController,
                        formFieldValidator: ValidationData.nameValidator,
                        textInputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        obsecureText: false,
                        filledColor: LightColor.grey,
                        fill: false,
                        enabledborderColor: Colors.black12,
                        input_text_color: Colors.black,
                        titleColor: Colors.black,
                        hint_text_color: Colors.black45,
                        error_text_color: Colors.black54,
                        content_padding: 15,
                        borderColor: Colors.black,
                        blurRadius: 2,
                        spreadRadius: 2,
                        right: 20,
                        left: 20,
                        dy: 2,
                        dx: 2,
                        maxline: 1,
                      ),
                      padding: EdgeInsets.only(left: 7, right: 7, top: 9),
                    ),
                    Padding(
                      child: CustomTextInputData(
                        onChanged: () {},
                        title: "Address:",
                        hintText: "Address",
                        textEditingController: AllControllers.addressController,
                        formFieldValidator: ValidationData.addressValidator,
                        textInputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        obsecureText: false,
                        filledColor: LightColor.grey,
                        fill: false,
                        enabledborderColor: Colors.black12,
                        input_text_color: Colors.black,
                        titleColor: Colors.black,
                        hint_text_color: Colors.black45,
                        error_text_color: Colors.black54,
                        content_padding: 15,
                        borderColor: Colors.black,
                        blurRadius: 2,
                        spreadRadius: 2,
                        right: 20,
                        left: 20,
                        dy: 2,
                        dx: 2,
                        maxline: 1,
                      ),
                      padding: EdgeInsets.only(left: 7, right: 7, top: 9),
                    ),
                    Padding(
                      child: CustomTextInputData(
                        onChanged: () {},
                        title: "Description:",
                        hintText: "Description",
                        textEditingController:
                            AllControllers.profileDescController,
                        formFieldValidator: ValidationData.descValidator,
                        textInputType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        obsecureText: false,
                        filledColor: LightColor.grey,
                        fill: false,
                        enabledborderColor: Colors.black12,
                        input_text_color: Colors.black,
                        titleColor: Colors.black,
                        hint_text_color: Colors.black45,
                        error_text_color: Colors.black54,
                        content_padding: 15,
                        borderColor: Colors.black,
                        blurRadius: 2,
                        spreadRadius: 2,
                        right: 20,
                        left: 20,
                        dy: 2,
                        dx: 2,
                        maxline: 3,
                      ),
                      padding: EdgeInsets.only(left: 7, right: 7, top: 9),
                    ),
                    Container(
                      height: height * .05,
                    ),
                    MaterialButtonClassPage(
                      height: height * .06,
                      radius: BorderRadius.circular(05),
                      buttonName: "Submit",
                      onPress: () {
                        validateInputs();
                        showSnakbar();
                      },
                      color: Colors.purpleAccent.shade700,
                      minwidth: width,
                      fontSize: 14,
                      left: 25,
                      right: 25,
                    ),
                    Container(
                      height: height * .05,
                    ),
                  ],
                ),
              ))
            ],
          ),
          autovalidate: postjobautoValidate,
          key: postjobformKeyValidate,
        )));
  }

  void validateInputs() {
    if (postjobformKeyValidate.currentState.validate()) {
      setState(() {
        postjobformKeyValidate.currentState.save();
        addJobData();
      });
    } else {
      setState(() {
        postjobautoValidate = true;
        hideSnakbar();
      });
    }
  }

  Future addJobData() async {
    GraphQLClient client = clientToQuery();
    QueryResult result = await client.mutate(
      MutationOptions(
        document: addJob(
            AllControllers.nameController.text.toString(),
            AllControllers.urlController.text.toString(),
            AllControllers.emailController.text.toString(),
            AllControllers.companynameController.text.toString(),
            AllControllers.addressController.text.toString(),
            AllControllers.profileDescController.text.toString()),
      ),
    );
    if (result.exception == null) {
      ValidationData.customToast(
          "Success!", Colors.white, Colors.black, ToastGravity.CENTER);
      AllControllers.nameController.clear();
      AllControllers.urlController.clear();
      AllControllers.emailController.clear();
      AllControllers.companynameController.clear();
      AllControllers.addressController.clear();
      AllControllers.profileDescController.clear();
      hideSnakbar();
    } else {
      hideSnakbar();
      ValidationData.customToast(result.exception.toString(), Colors.red,
          Colors.white, ToastGravity.CENTER);
    }
  }

  showSnakbar() {
    postjobscaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: Colors.black26,
        content: Row(
          children: [
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: Colors.black87,
            ),
            SizedBox(
              height: 0,
              width: 20,
            ),
            Text(
              "Validating Data...",
              style: GoogleFonts.roboto(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        )));
  }

  hideSnakbar() {
    postjobscaffoldKey.currentState.hideCurrentSnackBar();
  }
}
