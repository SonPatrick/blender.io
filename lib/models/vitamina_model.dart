import 'dart:convert';

class Vitamina {
  int? id;
  String? nome;
  String? info;
  Vitamina({
    this.id,
    this.nome,
    this.info,
  });

  Vitamina copyWith({
    int? id,
    String? nome,
    String? info,
  }) {
    return Vitamina(
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

  factory Vitamina.fromMap(Map<String, dynamic> map) {
    return Vitamina(
      id: map['id']?.toInt(),
      nome: map['nome'],
      info: map['info'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Vitamina.fromJson(String source) => Vitamina.fromMap(json.decode(source));

  @override
  String toString() => 'Vitamina(id: $id, nome: $nome, info: $info)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Vitamina && other.id == id && other.nome == nome && other.info == info;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ info.hashCode;
}
