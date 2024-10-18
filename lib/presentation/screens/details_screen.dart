import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t1/data/cubits/image_cubit/image_cubit.dart';
import 'package:t1/data/cubits/info_cubit/info_cubit.dart';
import 'package:t1/presentation/screens/home_screen.dart';
import 'package:t1/presentation/screens/image_page.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  num id;

  DetailsScreen({super.key, required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<InfoCubit>(context).getinfo(id: widget.id);
    BlocProvider.of<ImageCubit>(context).getimage(id: widget.id);
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Icon(Icons.arrow_back_outlined),
            ),
            Center(
              child: Text(
                "info",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ),
        body: BlocBuilder<InfoCubit, InfoState>(
          builder: (context, state) {
            return state is InfoLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color:
                                        const Color.fromRGBO(10, 15, 30, 80)),
                                color: const Color.fromRGBO(50, 120, 150, 70),
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    BlocProvider.of<InfoCubit>(context)
                                            .infoModel
                                            .name ??
                                        "11",
                                    style: const TextStyle(
                                        fontSize: 32,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 10)),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    BlocProvider.of<InfoCubit>(context)
                                            .infoModel
                                            .biography ??
                                        "11",
                                    style: const TextStyle(
                                        fontSize: 22,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 10)),
                                  ),
                                ),
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ImagePage(
                                                  id: widget.id,
                                                  image:
                                                      "https://image.tmdb.org/t/p/w500/${ImageCubit.get(context).imageModel.profiles![index].filePath!}")));
                                    },
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500/${ImageCubit.get(context).imageModel.profiles![index].filePath!}",
                                      width: 300,
                                      height: 300,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  );
          },
        ),
      ),
    );
  }
}
