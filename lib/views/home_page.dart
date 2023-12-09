import 'package:flutter/material.dart';
import 'package:responsi_124210060/models/categories_model.dart';
import 'package:responsi_124210060/services/api_data_source.dart';
import 'package:responsi_124210060/views/meals_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Meal Categories",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.brown[600],
        ),
        body: FutureBuilder(
            future: ApiDataSource.instance.LoadCategory(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                CategoriesModel categoriesModel =
                    CategoriesModel.fromJson(snapshot.data!);
                return _buildCategories(categoriesModel);
              }
              if (snapshot.hasError) {
                return Text('Error');
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }

  Widget _buildCategories(CategoriesModel categoriesModel) {
    return ListView.builder(
        itemCount: categoriesModel.categories!.length,
        itemBuilder: (context, index) {
          var item = categoriesModel.categories![index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MealsPage(Category: item.strCategory!)));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(item.strCategoryThumb!),
                  title: Text(
                    item.strCategory!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(item.strCategoryDescription!),
                ),
              ),
            ),
          );
        });
  }
}
