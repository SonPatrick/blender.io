import 'dart:convert';

class Aminoacido {
  int? id;
  String? nome;
  String? info;
  Aminoacido({
    this.id,
    this.nome,
    this.info,
  });

  Aminoacido copyWith({
    int? id,
    String? nome,
    String? info,
  }) {
    return Aminoacido(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      info: info ?? this.info,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'info': info,
    };
  }

  factory Aminoacido.fromMap(Map<String, dynamic> map) {
    return Aminoacido(
      id: map['id']?.toInt(),
      nome: map['nome'],
      info: map['info'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Aminoacido.fromJson(String source) => Aminoacido.fromMap(json.decode(source));

  @override
  String toString() => 'Aminoacido(id: $id, nome: $nome, info: $info)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Aminoacido && other.id == id && other.nome == nome && other.info == info;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ info.hashCode;
}
