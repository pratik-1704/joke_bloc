import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_bloc/data/respository/joke_respository.dart';

import '../data/model/joke_model.dart';

part 'joke_events.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState>{
 final JokeRepository _jokeRepository;
 JokeBloc(this._jokeRepository) : super(JokeLoadingState()){
    on<LoadJokeEvent> ((event, emit) async {
      emit(JokeLoadingState());
      try {
        final joke = await _jokeRepository.getJoke();
        emit(JokeLoadedState(joke));
      }
      catch (e){
        emit (JokeErrorState(e.toString()));
      }
    });
 }
}