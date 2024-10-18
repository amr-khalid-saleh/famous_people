import 'package:flutter/material.dart';
import 'package:t1/data/cubits/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t1/presentation/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(238, 238, 238, 3),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(48, 100, 103, 20),
          title: Center(
              child: Text(
            "Popular List",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          )),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state is HomeLoading
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.builder(
                        itemCount: BlocProvider.of<HomeCubit>(context)
                            .homeScreenModel
                            ?.results
                            ?.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => DetailsScreen(
                                          id: BlocProvider.of<HomeCubit>(
                                                  context)
                                              .homeScreenModel!
                                              .results![index]
                                              .id!)));
                            },
                            child: Container(
                              height: 100,
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Color.fromRGBO(10, 15, 30, 80)),
                                  color: Color.fromRGBO(50, 120, 150, 70),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    child: Text(
                                      BlocProvider.of<HomeCubit>(context)
                                              .homeScreenModel
                                              ?.results?[index]
                                              .name ??
                                          "11",
                                      style: TextStyle(
                                          fontSize: 26,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 10)),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      BlocProvider.of<HomeCubit>(context)
                                              .homeScreenModel
                                              ?.results?[index]
                                              .knownForDepartment ??
                                          "11",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 10)),
                                    ),
                                  ),
                                ],
                              ),
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
