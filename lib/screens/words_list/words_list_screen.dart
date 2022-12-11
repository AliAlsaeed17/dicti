import 'package:dicti/model/word_response.dart';
import 'package:dicti/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class WordsListScreen extends StatelessWidget {
  List<WordResponse> words;

  WordsListScreen(this.words);

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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(words[index]),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        itemCount: words.length,
      ),
    );
  }
}