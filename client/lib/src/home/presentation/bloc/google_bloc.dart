import 'package:bloc/bloc.dart';
import 'package:client/src/home/domain/entities/google_entity.dart';
import 'package:client/src/home/domain/usecases/get_google_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'google_event.dart';
part 'google_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  final IGetGoogleUsecase getGoogleUsecase;

  GoogleBloc({
    required this.getGoogleUsecase,
  }) : super(GoogleStateEmpty()) {
    on<GetGoogle>(
      _onGetGoogle,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onGetGoogle(GetGoogle event, Emitter<GoogleState> emit) async {
    if (event.search.isEmpty) return emit(GoogleStateEmpty());

    emit(GoogleStateLoading());

    try {
      final result = await getGoogleUsecase(search: event.search);
      result.fold(
        (l) => emit(
          GoogleStateError(error: l.toString()),
        ),
        (r) => emit(GoogleStateSuccess(entity: r)),
      );
    } catch (e) {
      emit(
        GoogleStateError(error: e.toString()),
      );
    }
  }
}
