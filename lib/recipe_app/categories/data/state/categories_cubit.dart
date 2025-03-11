import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/categories_repository.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required CategoryRepository catRepo})
      :_catRepo = catRepo,
       super(CategoriesState(categories: [], mainCategory: null, status: CategoriesStatus.loading)){
    load();
  }

  final CategoryRepository _catRepo;

  Future<void> load()async{
    final allCategories = await _catRepo.fetchCategories();
    emit(
      CategoriesState(
          categories: allCategories.where((category) => !category.main).toList(),
          mainCategory:allCategories.firstWhere((category)=> category.main),
        status: CategoriesStatus.idle,
      ),
    );
  }
}