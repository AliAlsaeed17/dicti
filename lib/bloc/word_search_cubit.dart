import 'package:dicti/model/word_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordSearchCubit extends Cubit<DictionaryState> {
  WordSearchCubit() : super(NoWordSearchedState());
}

abstract class DictionaryState {}

class NoWordSearchedState extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class WordSearchedState extends DictionaryState {
  final List<WordResponse> words;

  WordSearchedState(this.words);
}

class Errorstate extends DictionaryState {}
