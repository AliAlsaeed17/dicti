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
            title: Text(words[index].word!),
          );
        },
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        itemCount: words.length,
      ),
    );
  }
}
