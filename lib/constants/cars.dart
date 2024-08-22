class Cars{
  final String codigo;
  final String nome;
  Cars({required  this.nome, required  this.codigo});
  factory Cars.fromJson(Map<String, dynamic> json) {
    return Cars(
      codigo:  json['codigo'] as String,
      nome:  json['nome'] as String,
    );
  }
  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'nome': nome,
    };
  }
}