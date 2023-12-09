import 'package:flutter/material.dart';
import 'package:responsi_124210060/models/detail_model.dart';
import 'package:responsi_124210060/services/api_data_source.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.idMeal});
  final String idMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Meal Detail",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.brown[600],
        ),
        body: FutureBuilder(
            future: ApiDataSource.instance.LoadDetailMeal(idMeal),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                DetailModel detailModel = DetailModel.fromJson(snapshot.data!);
                return _buildDetail(detailModel);
              }
              if (snapshot.hasError) {
                return Text(
                  "Error",
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }

  Widget _buildDetail(DetailModel detailModel) {
    return ListView.builder(
        itemCount: detailModel.meals!.length,
        itemBuilder: (context, index) {
          var item = detailModel.meals![index];
          return Column(
            children: [
              Image.network(item.strMealThumb!),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            item.strMeal!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Category: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(item.strCategory!),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Area: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(item.strArea!),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Ingredients",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    item.strIngredient1!,
                                  ),
                                  Text(
                                    item.strIngredient2!,
                                  ),
                                  Text(
                                    item.strIngredient3!,
                                  ),
                                  Text(
                                    item.strIngredient4!,
                                  ),
                                  Text(
                                    item.strIngredient5!,
                                  ),
                                  Text(
                                    item.strIngredient6!,
                                  ),
                                  Text(
                                    item.strIngredient7!,
                                  ),
                                  Text(
                                    item.strIngredient8!,
                                  ),
                                  Text(
                                    item.strIngredient9!,
                                  ),
                                  Text(
                                    item.strIngredient10!,
                                  ),
                                  Text(
                                    item.strIngredient11!,
                                  ),
                                  Text(
                                    item.strIngredient12!,
                                  ),
                                  Text(
                                    item.strIngredient13!,
                                  ),
                                  Text(
                                    item.strIngredient14!,
                                  ),
                                  Text(
                                    item.strIngredient15!,
                                  ),
                                  Text(
                                    item.strIngredient16!,
                                  ),
                                  Text(
                                    item.strIngredient17!,
                                  ),
                                  Text(
                                    item.strIngredient18!,
                                  ),
                                  Text(
                                    item.strIngredient19!,
                                  ),
                                  Text(
                                    item.strIngredient20!,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    Text(
                      "Intructions",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(item.strInstructions!),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        await launchUrl(Uri.parse(item.strYoutube!));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.brown[600]),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.brown[100],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Watch Tutorial",
                                style: TextStyle(color: Colors.brown[100]),
                              )
                            ],
                          )),
                    )
                  ]),
                ),
              )
            ],
          );
        });
  }
}
