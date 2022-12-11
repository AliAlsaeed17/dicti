import 'package:dicti/model/word_response.dart';
import 'package:flutter/material.dart';

class WordDetailsScreen extends StatelessWidget {
  final WordResponse wordResponse;

  WordDetailsScreen(this.wordResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        height: 1500,
        width: double.infinity,
        padding: EdgeInsets.all(40),
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
              flex: 2,
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${index + 1}. Definition: ${defenitions![index].definition!}" ??
                                    "",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              defenitions[index].example != null
                                  ? "    Example: ${defenitions[index].example}"
                                  : "",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 12),
                          ],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 13),
                        itemCount: defenitions!.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: wordResponse.meanings!.length,
                //physics: ScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
