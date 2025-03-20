// import 'dart:io';
// import 'package:categorylogin/recipe_app/recipe_detail/data/repository/detail_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../category_reviews/presentation/view/create_reviews_event.dart';
// import '../../data/repository/create_reviews_repository.dart';
// import 'create_review_state.dart';
// import 'create_reviews_event.dart';
// class CreateReviewBloc extends Bloc<CreateReviewsEvent, CreateReviewState> {
//   CreateReviewBloc({
//     required RecipeRepository recipeRepo,
//     required ReviewRepository reviewRepo,
//   })  : _recipeRepo = recipeRepo,
//         _reviewRepo = reviewRepo,
//         super(CreateReviewState.initial()) {
//     on<CreateReviewBloc>(_onRate);
//     on<CreateReviewPickImage>(_onPickImage);
//     on<CreateReviewRecommendOrNot>(_onRecommendOrNot);
//     on<CreateReviewLoading>(_onLoad);
//     on<CreateReviewSubmit>(_onSubmit);
//   }
//
//   final RecipeRepository _recipeRepo;
//   final ReviewRepository _reviewRepo;
//   final reviewController = TextEditingController();
//
//   @override
//   Future<void> close() {
//     reviewController.dispose();
//     return super.close();
//   }
//
//   Future _onLoad(CreateReviewLoading event, Emitter<CreateReviewState> emit) async {
//     emit(state.copyWith(status: CreateReviewStatus.loading, recipeId: event.recipeId));
//     final recipe = await _recipeRepo.fetchRecipesByCategory(event.recipeId);
//     emit(state.copyWith(recipeModel: recipe, status: CreateReviewStatus.idle));
//   }
//
//   Future<void> _onRate(CreateReviewBloc event, Emitter<CreateReviewState> emit) async {
//     emit(state.copyWith(currentIndex: event.currentIndex));
//   }
//
//   Future<void> _onPickImage(CreateReviewPickImage event, Emitter<CreateReviewState> emit) async {
//     File? image;
//     final imagePicker = ImagePicker();
//     final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
//     if (pickedImage != null) {
//       image = File(pickedImage.path);
//       emit(state.copyWith(pickedImage: image));
//     }
//   }
//
//   Future<void> _onRecommendOrNot(CreateReviewRecommendOrNot event, Emitter<CreateReviewState> emit) async {
//     emit(state.copyWith(doesRecommend: event.value));
//   }
//
//   Future _onSubmit(CreateReviewSubmit event, Emitter<CreateReviewState> emit) async {
//     final successful = await _reviewRepo.createReview(
//       recipeId: state.recipeId!,
//       rating: state.currentIndex! + 1,
//       comment: reviewController.text,
//       recommend: state.doesRecommend!,
//       photo: state.pickedImage,
//     );
//     if (successful) {
//       emit(state.copyWith(status: CreateReviewStatus.submitted));
//     } else {
//       emit(state.copyWith(status: CreateReviewStatus.error));
//     }
//   }
// }
