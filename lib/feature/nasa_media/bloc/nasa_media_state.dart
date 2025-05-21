part of 'nasa_media_bloc.dart';

class NasaMediaState extends Equatable {
  final PageDataState<NasaMediaSearchModel> data;

  const NasaMediaState({this.data = const PageDataState()});

  NasaMediaState copyWith({PageDataState<NasaMediaSearchModel>? data}) {
    return NasaMediaState(data: data ?? this.data);
  }

  @override
  List<Object?> get props => [data];
}
