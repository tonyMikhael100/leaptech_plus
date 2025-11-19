// home_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:leaptech_plus/features/home/data/models/event_model.dart';
import 'package:leaptech_plus/features/home/data/models/quote_model.dart';
import 'package:leaptech_plus/features/home/data/repo/home_repo_impl.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepoImpl _homeRepo;

  // ---------------------------
  // Quote of the day
  // ---------------------------
  Future<void> getQuoteOfTheDay() async {
    if (isClosed) return;
    emit(HomeQuoteLoading());

    try {
      final response = await _homeRepo.getQuoteOfTheDay();
      if (isClosed) return;

      response.fold(
        (failure) => emit(HomeQuoteFailure(failure.errorMessage)),
        (quote) => emit(HomeQuoteSuccess(quote)),
      );
    } catch (e) {
      if (!isClosed) emit(HomeQuoteFailure(e.toString()));
    }
  }

  // ---------------------------
  // Create event
  // ---------------------------
  Future<void> createEvent({required EventModel event}) async {
    if (isClosed) return;
    emit(HomeEventLoading());

    try {
      final response = await _homeRepo.createEvent(event: event);
      if (isClosed) return;

      response.fold(
        (failure) => emit(HomeEventFailure(failure.errorMessage)),
        (_) => emit(HomeEventCreated()),
      );
    } catch (e) {
      if (!isClosed) emit(HomeEventFailure(e.toString()));
    }
  }

  // ---------------------------
  // Get all events
  // ---------------------------
  Future<void> getAllEvents() async {
    if (isClosed) return;
    emit(HomeEventLoading());

    try {
      final response = await _homeRepo.getAllEvents();
      if (isClosed) return;

      response.fold(
        (failure) => emit(HomeEventFailure(failure.errorMessage)),
        (events) => emit(HomeEventSuccess(events)),
      );
    } catch (e) {
      if (!isClosed) emit(HomeEventFailure(e.toString()));
    }
  }

  // ---------------------------
  // Delete event
  // ---------------------------
  Future<void> deleteEvent({required int eventId}) async {
    if (isClosed) return;
    emit(HomeEventLoading());

    try {
      final response = await _homeRepo.deleteEvent(eventId: eventId);
      if (isClosed) return;

      response.fold(
        (failure) => emit(HomeEventFailure(failure.errorMessage)),
        (_) => emit(HomeEventDeleted()),
      );
    } catch (e) {
      if (!isClosed) emit(HomeEventFailure(e.toString()));
    }
  }
}
