import 'package:dicti/bloc/word_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[900],
      body: getDictionaryFormWidget(context),
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
          SizedBox(height: 32),
          TextField(
            controller: cubit.queryController,
            decoration: InputDecoration(
              hintText: "Search a word",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: Icon(Icons.search),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                cubit.getWordSearched();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,
                padding: EdgeInsets.all(16),
              ),
              child: Text("Search"),
            ),
          ),
        ],
      ),
    );
  }

  getLoadingWidget() {
    return Center(child: CircularProgressIndicator());
  }

  getErrorWidget(message) {
    return Center(
      child: Text(message),
    );
  }
}
