import "dart:convert";
import "package:drift/drift.dart";
import "package:noheva_visitor_ui/utils/serialization_utils.dart";

/// Drift Type Converter for converting List<T> to String and vice versa
class ListConverter<T> extends TypeConverter<List<T>, String> {
  const ListConverter();

  @override
  List<T> fromSql(String fromDb) => (jsonDecode(fromDb) as List<dynamic>)
      .map((element) =>
          SerializationUtils.deserializeObject<T>(jsonDecode(element), T))
      .toList();

  @override
  String toSql(List<T> value) => jsonEncode(value
      .map((element) => SerializationUtils.serializeObject(element, T))
      .toList());
}
