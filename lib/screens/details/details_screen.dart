import 'package:dicti/model/word_response.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final WordResponse wordResponse;

  DetailsScreen(this.wordResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        padding: EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "${wordResponse.word}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final meanings = wordResponse.meanings![index];
                  final defenitions = meanings.definitions;
                  return Column(
                    children: [
                      Text(
                        meanings.partOfSpeech!,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      ListView.separated(
                        itemBuilder: (context, index) => Column(
                          children: [
                            Text("Definition: " +
                                defenitions![index].definition!),
                            SizedBox(height: 8),
                            Text("Example: " + defenitions[index].example!),
                          ],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8),
                        itemCount: defenitions!.length,
                        shrinkWrap: true,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 32),
                itemCount: wordResponse.meanings!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
