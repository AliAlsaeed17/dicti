import 'package:dicti/extensions/string_casing_extension.dart';
import 'package:dicti/model/word_response.dart';
import 'package:dicti/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class WordsListScreen extends StatelessWidget {
  List<WordResponse> words;

  WordsListScreen(this.words);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        padding: EdgeInsets.all(25),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                "${index + 1}. ${words[index].word!.toCapitalized()}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              trailing: Text(
                words[index].meanings![0].partOfSpeech != null
                    ? "${words[index].meanings![0].partOfSpeech}"
                    : "",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
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
      ),
    );
  }
}
