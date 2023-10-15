import 'package:book_app/Features/home/persentation/view/widget/best_seller_list_item.dart';
import 'package:book_app/Features/home/persentation/view/widget/best_seller_listview.dart';
import 'package:book_app/Features/home/persentation/view/widget/listbookitem.dart';
import 'package:flutter/material.dart';


import '../../../../../core/utils/styles.dart';
import 'custom_app_bar.dart';
import 'custom_book_image.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ListBookItem(),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Best seller',
                  style: Styles.textStyle30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: BestSellerListview(),
        )
      ],
    );
  }
}
