import 'package:categorylogin/core/client.dart';
import 'package:categorylogin/recipe_app/top_chef/data/model/chef_model.dart';

class ChefRepository {
  ChefRepository({required this.client});

  final ApiClient client;

  List<TopChefModel> topChefsHomePage = [];

  List<TopChefModel> mostViewedChefs = [];
  List<TopChefModel> mostLikedChefs = [];
  List<TopChefModel> newChefs = [];

  Future<List<TopChefModel>> fetchMostViewedChefs() async {
    var rawMostViewedChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list', queryParams: {"Order": "Date", "Limit": 2},
    );
    mostLikedChefs =
        rawMostViewedChefs.map((chef) => TopChefModel.fromJson(chef)).toList();
    return mostLikedChefs;
  }

  Future<List<TopChefModel>> fetchNewChefs() async {
    var rawNewChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list',
      queryParams: {"Order":"Dare","Limit": 2},
    );
    newChefs = rawNewChefs.map((chef)=> TopChefModel.fromJson(chef)).toList();
    return newChefs;
  }
}