import '../models/category_model.dart';

enum CategoriesStatus {idle,loading, error}

class CategoriesState {
   CategoriesState({
     required this.categories,
     required this.mainCategory,
     required this.status,
});
   final CategoriesStatus status;

   final List<CategoryModel> categories;
   final CategoryModel? mainCategory;
}
