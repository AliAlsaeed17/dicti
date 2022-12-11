import 'package:dicti/model/word_response.dart';
import 'package:dicti/repo/word_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordSearchCubit extends Cubit<DictionaryState> {
  final WordRepository _repository;
  final TextEditingController _queryController = TextEditingController();

  WordSearchCubit(this._repository) : super(NoWordSearchedState());

  Future getWordSearched() async {
    emit(WordSearchingState());
    final words =
        await _repository.getWordsFromDictionary(_queryController.text);
    if (words == null) {
      emit(Errorstate());
    } else {
      emit(WordSearchedState(words));
    }
  }
}

abstract class DictionaryState {}

class NoWordSearchedState extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class WordSearchedState extends DictionaryState {
  final List<WordResponse> words;

  WordSearchedState(this.words);
}

class Errorstate extends DictionaryState {}
