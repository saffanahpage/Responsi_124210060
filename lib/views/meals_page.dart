import 'package:flutter/material.dart';
import 'package:responsi_124210060/models/meals_model.dart';
import 'package:responsi_124210060/services/api_data_source.dart';
import 'package:responsi_124210060/views/detail_page.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({super.key, required this.Category});
  final String Category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Category, style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.brown[600],
      ),
      body: FutureBuilder(
          future: ApiDataSource.instance.LoadMealsByCategory(Category),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              MealsModel mealsModel = MealsModel.fromJson(snapshot.data!);
              return _buildMeals(mealsModel);
            }
            if (snapshot.hasError) {
              return Text("Error");
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Widget _buildMeals(MealsModel mealsModel) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: mealsModel.meals!.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailPage(
                          idMeal: mealsModel.meals![index].idMeal!)));
            },
            child: Card(
              child: Column(children: [
                Expanded(
                    child: Image.network(
                  mealsModel.meals![index].strMealThumb!,
                  fit: BoxFit.cover,
                )),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(mealsModel.meals![index].strMeal!),
                )
              ]),
            ),
          );
        });
  }
}
