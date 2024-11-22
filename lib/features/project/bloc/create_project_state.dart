import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CreateProjectState extends Equatable {
  final Map<String, dynamic>? selectedColor;
  final bool isFavorite;

  const CreateProjectState({
    this.selectedColor,
    this.isFavorite = false,
  });

  CreateProjectState copyWith({
    Map<String, dynamic>? selectedColor,
    bool? isFavorite,
  }) {
    return CreateProjectState(
      selectedColor: selectedColor ?? this.selectedColor,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [selectedColor, isFavorite];
}
