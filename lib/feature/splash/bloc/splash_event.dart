part of 'splash_bloc.dart';

class SplashScreenEvent {
  SplashScreenEvent._();

  factory SplashScreenEvent.didLoad() => SplashScreenDidLoad();
}

class SplashScreenDidLoad extends SplashScreenEvent {
  SplashScreenDidLoad() : super._();
}
