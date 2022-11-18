import 'package:dlovera_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';

class CustomPaginationWidget extends StatelessWidget {
  const CustomPaginationWidget(
      {Key? key,
      required this.currentPage,
      required this.totalPage,
      required this.onPageChange})
      : super(key: key);

  final int currentPage;
  final int? totalPage;
  final Function(int) onPageChange;

  @override
  Widget build(BuildContext context) {
    print('pages $totalPage');
    return Center(
      child: Pagination(
        width: MediaQuery.of(context).size.width * .6,
        // this prop is optional
        paginateButtonStyles:
            PaginateButtonStyles(backgroundColor: AppColor.primaryColorDark),
        prevButtonStyles: PaginateSkipButton(
            buttonBackgroundColor: AppColor.primaryColorDark,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
        nextButtonStyles: PaginateSkipButton(
            buttonBackgroundColor: AppColor.primaryColorDark,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
        onPageChange: onPageChange,
        useGroup: true,
        totalPage: totalPage ?? 1,
        show: (totalPage ?? 0) <= 4 ? (totalPage ?? 0) - 1 : 4,
        currentPage: currentPage,
      ),
    );
  }
}
