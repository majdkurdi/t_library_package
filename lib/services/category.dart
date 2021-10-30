import './http_service.dart' as http;
import '../models/category.dart';

class CategoryService {
  Future<List<Category>> getCategories() async {
    try {
      final response = await http.get('/category');
      print(response.body);
      return categoriesFromJson(response.body);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
