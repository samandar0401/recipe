// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../../../../core/utils.dart';
// import '../../../../category_reviews/presentation/view/create_reviews_bloc.dart';
// import '../../../../category_reviews/presentation/view/create_reviews_event.dart';
// import '../../view/create_review_state.dart';
//
//
// class CreateReviewRatingSection extends StatelessWidget {
//   const CreateReviewRatingSection({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CreateReviewBloc, CreateReviewState>(
//       builder: (context, state) => Column(
//         spacing: 3,
//         children: [
//           Row(
//             spacing: 10,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               5,
//                   (index) {
//                 return GestureDetector(
//                   onTap: () => context.read<CreateReviewBloc>().add(CreateReviewRate(currentIndex: index)),
//                   child: SizedBox(
//                     width: 29,
//                     height: 29,
//                     child: SvgPicture.asset(
//                       "assets/icons/star-${index <= (state.currentIndex ?? -1) ? 'filled' : 'empty'}.svg",
//                       colorFilter: ColorFilter.mode(AppColors.redpinkmain, BlendMode.srcIn),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Text(
//             "Your overall rating",
//             style: TextStyle(fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }
// }
