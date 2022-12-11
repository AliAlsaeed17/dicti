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
                                "Definition: ${defenitions![index].definition!}" ??
                                    "",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Example: ${defenitions[index].example}" ?? "",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8),
                        itemCount: defenitions!.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 32),
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
