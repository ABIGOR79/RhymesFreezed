import 'package:json_annotation/json_annotation.dart';

part 'rhymes.g.dart';

@JsonSerializable()
class Rhymes {
  const Rhymes({required this.word});

  factory Rhymes.fromJson(Map<String, dynamic> json) => _$RhymesFromJson(json);

  final String word;

  Map<String, dynamic> toJson() => _$RhymesToJson(this);
}
