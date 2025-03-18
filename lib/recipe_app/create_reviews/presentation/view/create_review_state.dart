import 'dart:io';

import 'package:categorylogin/recipe_app/create_reviews/data/model/reviews_model.dart';
import 'package:equatable/equatable.dart';


enum CreateReviewStatus { idle, loading, error, submitted }

class CreateReviewState extends Equatable {
  final int? recipeId;
  final int? currentIndex;
  final CreateReviewStatus? status;
  final bool? doesRecommend;

  final File? pickedImage;

  final ReviewRecipeModel? recipeModel;

  const CreateReviewState({
    required this.recipeId,
    required this.currentIndex,
    required this.status,
    required this.pickedImage,
    required this.doesRecommend,
    required this.recipeModel,
  });

  factory CreateReviewState.initial() {
    return CreateReviewState(
      recipeId: null,
      currentIndex: null,
      pickedImage: null,
      status: CreateReviewStatus.loading,
      doesRecommend: null,
      recipeModel: null,
    );
  }

  CreateReviewState copyWith({
    int? recipeId,
    int? currentIndex,
    CreateReviewStatus? status,
    File? pickedImage,
    bool? doesRecommend,
    ReviewRecipeModel? recipeModel,
  }) {
    return CreateReviewState(
      recipeId: recipeId ?? this.recipeId,
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
      pickedImage: pickedImage ?? this.pickedImage,
      doesRecommend: doesRecommend ?? this.doesRecommend,
      recipeModel: recipeModel ?? this.recipeModel,
    );
  }

  @override
  List<Object?> get props => [recipeId, currentIndex, pickedImage, status, doesRecommend, recipeModel];
}
