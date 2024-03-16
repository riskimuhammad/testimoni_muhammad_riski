import 'package:flutter/material.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/widget/languages_button.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/widget/search_field.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _searchfield = SearchField();
    final _languagesButton = LanguagesButton();
    return Scaffold(
      appBar: AppBar(
        actions: [_languagesButton.languages(context)],
        flexibleSpace: _searchfield.search(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
