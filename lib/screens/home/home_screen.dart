import 'package:dicti/bloc/word_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../words_list/words_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<WordSearchCubit>();
    return BlocListener(
      listener: (context, state) {
        if (state is WordSearchedState && state.words != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WordsListScreen(state.words),
            ),
          );
        }
      },
      bloc: cubit,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: cubit.state is WordSearchingState
            ? getLoadingWidget()
            : cubit.state is Errorstate
                ? getErrorWidget("Error in getting data")
                : cubit.state is NoWordSearchedState
                    ? getDictionaryFormWidget(context)
                    : Container(),
      ),
    );
  }

  getDictionaryFormWidget(BuildContext context) {
    final cubit = context.watch<WordSearchCubit>();
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Spacer(),
          Text(
            "Dicti App",
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Search any ward you want quickly",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 35),
          TextField(
            controller: cubit.queryController,
            decoration: InputDecoration(
              hintText: "Search a word",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              fillColor: Colors.grey.shade300,
              filled: true,
              prefixIcon: Icon(Icons.search),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              onPressed: () {
                cubit.getWordSearched();
                //Navigator.push(context, MaterialPageRoute(builder: (context) => WordsListScreen(words) ));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  padding: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: Text("Search"),
            ),
          ),
        ],
      ),
    );
  }

  getLoadingWidget() {
    return Center(
        child: CircularProgressIndicator(
      color: Colors.deepOrangeAccent,
    ));
  }

  getErrorWidget(message) {
    return Center(
      child: Text(message),
    );
  }
}
