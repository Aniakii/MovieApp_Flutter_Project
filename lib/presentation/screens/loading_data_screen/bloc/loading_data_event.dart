part of 'loading_data_bloc.dart';

abstract class LoadingDataEvent {}

class ChangeLoadingStateEvent extends LoadingDataEvent {}

class FetchDataEvent extends LoadingDataEvent {}

class LoadDataEvent extends LoadingDataEvent {}
