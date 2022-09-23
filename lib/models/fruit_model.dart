import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'aminoacido_model.dart';
import 'vitamina_model.dart';

class FruitModel {
  int? id;
  String? nome;
  List<Vitamina>? vitaminas;
  List<Aminoacido>? aminoacidos;
  FruitModel({
    this.id,
    this.nome,
    this.vitaminas,
    this.aminoacidos,
  });

  FruitModel copyWith({
    int? id,
    String? nome,
    List<Vitamina>? vitaminas,
    List<Aminoacido>? aminoacidos,
  }) {
    return FruitModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      vitaminas: vitaminas ?? this.vitaminas,
      aminoacidos: aminoacidos ?? this.aminoacidos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'vitaminas': vitaminas?.map((x) => x.toMap()).toList(),
      'aminoacidos': aminoacidos?.map((x) => x.toMap()).toList(),
    };
  }

  factory FruitModel.fromMap(Map<String, dynamic> map) {
    return FruitModel(
      id: map['id']?.toInt(),
      nome: map['nome'],
      vitaminas: map['vitaminas'] != null
          ? List<Vitamina>.from(map['vitaminas']?.map((x) => Vitamina.fromMap(x)))
          : null,
      aminoacidos: map['aminoacidos'] != null
          ? List<Aminoacido>.from(map['aminoacidos']?.map((x) => Aminoacido.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FruitModel.fromJson(String source) => FruitModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FruitModel(id: $id, nome: $nome, vitaminas: $vitaminas, aminoacidos: $aminoacidos)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FruitModel &&
        other.id == id &&
        other.nome == nome &&
        listEquals(other.vitaminas, vitaminas) &&
        listEquals(other.aminoacidos, aminoacidos);
  }

  @override
  int get hashCode {
    return id.hashCode ^ nome.hashCode ^ vitaminas.hashCode ^ aminoacidos.hashCode;
  }
}
