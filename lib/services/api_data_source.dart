import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> LoadCategory() {
    return BaseNetwork.get("categories.php");
  }
    Future<Map<String, dynamic>> LoadMealsByCategory(String category) {
    return BaseNetwork.get("filter.php?c=$category");
  }
    Future<Map<String, dynamic>> LoadDetailMeal(String idMeal) {
    return BaseNetwork.get("lookup.php?i=$idMeal");
  }
}