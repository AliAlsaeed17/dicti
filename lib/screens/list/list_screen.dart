import 'package:dicti/model/word_response.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  List<WordResponse> words;

  ListScreen(this.words);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${index + 1}. ${words[index].word!}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        itemCount: words.length,
      ),
    );
  }
}
