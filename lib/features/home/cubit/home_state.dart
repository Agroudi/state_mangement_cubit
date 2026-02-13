part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class IncrementState extends HomeState {}
final class DecrementState extends HomeState {}
final class ResetState extends HomeState {}
final class ChangeActiveIndexState extends HomeState {}