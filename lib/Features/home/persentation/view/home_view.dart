
import 'package:book_app/Features/home/persentation/view/widget/home_view_body.dart';
import 'package:book_app/core/utils/api_sevice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/assets.dart';
import '../../../search/presention/manger/search_book_cubit/search_book_cubit.dart';
import '../../../search/presention/view/view_widget/search_view_body.dart';
import '../../data/repos/home_repo_impl.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();

}
final _searchTextController = TextEditingController();
bool _isSearching = false;
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leadingWidth: 20,
        leading:Container(),
        title: _isSearching ? _buildSearchFiled()
            : _buildAppBarTitle(),
        actions: [_buildAppBarActions()],
      ),
      body: _isSearching ? const Searching() : const HomeViewBody(),
    );
  }

  _buildAppBarTitle() {
    return Image.asset(AssetsData.logo, height: 18);
  }

  _buildSearchFiled() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: 'Search a Book',
        border: InputBorder.none,
      ),
      onChanged: (newtext) {
        BlocProvider.of<SearchBooksCubit>(context)
            .searchBooks(query: newtext.trim());


      },
    );
  }

  _buildAppBarActions() {
    return _isSearching
        ? IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        _clearSearchField();
        Navigator.pop(context);
      },
    )
        : IconButton(
      icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
      onPressed:
      _startSearch,
    );
  }

  _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() => _isSearching = true);
  }

  _stopSearch() {
    _clearSearchField();
    setState(() => _isSearching = false);
  }

  _clearSearchField() {
    setState(() => _searchTextController.clear());
  }
}
