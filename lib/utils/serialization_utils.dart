import "dart:convert";
import "package:built_value/serializer.dart";
import "package:noheva_api/noheva_api.dart";

/// Serialization Utilities class
///
/// Provides static methods for serializing and deserializing objects generated from OpenAPI specification
class SerializationUtils {
  /// Serializes [object] of [specifiedType] to JSON string
  static dynamic serializeObject<T>(T object, Type specifiedType) => jsonEncode(
        standardSerializers.serialize(
          object,
          specifiedType: FullType(specifiedType),
        ),
      );

  /// Deserializes [object] of [specifiedType] to [T]
  static T deserializeObject<T>(dynamic object, Type specifiedType) =>
      standardSerializers.deserialize(
        object,
        specifiedType: FullType(specifiedType),
      ) as T;
}
