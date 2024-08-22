part of 'temp_list_bloc.dart';

class TempListScreenState extends Equatable {
  final bool isLoading;
  final List<NIVLDataModel> listOfElements;

  const TempListScreenState({
    this.isLoading = false,
    this.listOfElements = const [],
  });

  TempListScreenState copyWith({
    bool? isLoading,
    List<NIVLDataModel>? listOfElements,
  }) {
    return TempListScreenState(
      isLoading: isLoading ?? this.isLoading,
      listOfElements: listOfElements ?? this.listOfElements,
    );
  }

  @override
  List<Object> get props => [
    isLoading,
    listOfElements,
  ];
}
