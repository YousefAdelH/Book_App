import 'package:book_app/Features/search/presention/view/view_widget/search_list_view.dart';
import 'package:flutter/material.dart';

class Searching extends StatelessWidget {
  const Searching({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(

      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SearchedListView(),
          ),
        ),
      ],
    );
  }
}
