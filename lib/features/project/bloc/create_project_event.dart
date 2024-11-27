import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CreateProjectEvent extends Equatable {
  const CreateProjectEvent();

  @override
  List<Object?> get props => [];
}

class SelectColorEvent extends CreateProjectEvent {
  final Map<String, dynamic> selectedColor;

  const SelectColorEvent(this.selectedColor);

  @override
  List<Object?> get props => [selectedColor];
}

class ToggleFavoriteEvent extends CreateProjectEvent {
  final bool isFavorite;

  const ToggleFavoriteEvent(this.isFavorite);

  @override
  List<Object?> get props => [isFavorite];
}
