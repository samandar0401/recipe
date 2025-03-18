// part 'create_review_bloc.dart';

sealed class CreateReviewsEvent{}

final class CreateReviewLoading extends CreateReviewsEvent {
  final int recipeId;

  CreateReviewLoading({required this.recipeId});
}

final class CreateReviewLoad extends CreateReviewsEvent {
  final int recipeId;

  CreateReviewLoad({required this.recipeId});
}

final class CreateReviewRate extends CreateReviewsEvent {
  final int currentIndex;

  CreateReviewRate({required this.currentIndex});
}

final class CreateReviewPickImage extends CreateReviewsEvent {}

final class CreateReviewRecommendOrNot extends CreateReviewsEvent {
  final bool value;

  CreateReviewRecommendOrNot({required this.value});
}

final class CreateReviewSubmit extends CreateReviewsEvent {}
