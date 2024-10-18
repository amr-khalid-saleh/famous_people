import 'package:flutter/material.dart';
import 'package:t1/presentation/screens/details_screen.dart';
import 'dart:core';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:dio/dio.dart';

// ignore: must_be_immutable
class ImagePage extends StatefulWidget {
  num id;
  String image;

  ImagePage({super.key, required this.image, required this.id});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(48, 100, 103, 20),
          title: Row(children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(id: widget.id)));
              },
              child: Icon(Icons.arrow_back_outlined),
            ),
            Text(
              "image",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: InteractiveViewer(
                      maxScale:7.0 ,
                  child: Image.network(
                    widget.image,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: ()async{
                    final tempDir = await getTemporaryDirectory();
                    final Path = '${tempDir.path}/myfile.jpg';
                    await Dio().download(widget.image, Path);
                    await GallerySaver.saveImage(widget.image,toDcim: true,);

                  },
                  child: Text("save image"))
            ],
          ),
        ),
      ),
    );
  }
}
/*
var response = await http.get(Uri.parse(widget.image));
Directory? externalStorageDirectory = await getExternalStorageDirectory();
File file = new File(path.join(externalStorageDirectory!.path,path.basename(widget.image)));
await file.writeAsBytes(response.bodyBytes);
showDialog(
context: context,
builder: (BuildContext context) => AlertDialog(
title: Text("image save sucsessfully!"),
content: Image.file(file),
)
);*/
