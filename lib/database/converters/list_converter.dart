import "dart:convert";
import "package:drift/drift.dart";
import "package:noheva_api/noheva_api.dart";

/// List Type Converter for Drift
///
/// Serializes and deserializes a list of [T] to and from a JSON string.
class ListConverter<T> extends TypeConverter<List<T>, String> {
  const ListConverter();

  @override
  List<T> fromSql(String fromDb) => jsonDecode(fromDb);

  @override
  String toSql(List<T> value) => jsonEncode(
        value.map(
          (e) {
            if (e is ExhibitionPageResource) {
              e.toJson();
            }
          },
        ).toList(),
      );
}

extension ToJson on ExhibitionPageResource {
  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "mode": mode,
        "data": data,
      };
}

extension FromJson on ExhibitionPageResource {
  static ExhibitionPageResource fromJson(Map<String, dynamic> json) =>
      ExhibitionPageResource((builder) {
        builder.id = json["id"];
        builder.type = json["type"];
        builder.mode = json["mode"];
        builder.data = json["data"];
      });
}
