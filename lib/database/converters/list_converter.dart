import "dart:convert";
import "package:drift/drift.dart";

/// List Type Converter for Drift
///
/// Serializes and deserializes a list of [T] to and from a JSON string.
class ListConverter<T> extends TypeConverter<List<T>, String> {
  const ListConverter();

  @override
  List<T> fromSql(String fromDb) => jsonDecode(fromDb);

  @override
  String toSql(List<T> value) => jsonEncode(value);
}
