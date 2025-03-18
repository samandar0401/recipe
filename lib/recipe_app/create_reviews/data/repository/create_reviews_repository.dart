import 'dart:io';
import 'package:categorylogin/core/client.dart';
import 'package:categorylogin/recipe_app/category_reviews/data/model/reviews_model.dart';
import 'package:categorylogin/recipe_app/create_reviews/data/model/create_reviews_model.dart';

class ReviewRepository {
  ReviewRepository({required this.client});

  final ApiClient client;

  Future<bool> createReview({
    required int recipeId,
    required int rating,
    required String comment,
    required bool recommend,
    File? photo,
  }) async {
    final reviewModel = CreateReviewModel(
      recipeId: recipeId,
      comment: comment,
      rating: rating,
      recommend: recommend,
      photo: photo,
    );
    final result = await client.createReview(reviewModel);
    return result;
  }

  Future<List<ReviewsModel>> fetchReviewsByRecipe(int recipeId) async {
    final rawReviews = await
    client.genericGetRequest<List<dynamic>>('/reviews/list?recipeId=$recipeId');
    return rawReviews.map((review) => ReviewsModel.fromJson(review)).toList();
  }
}
