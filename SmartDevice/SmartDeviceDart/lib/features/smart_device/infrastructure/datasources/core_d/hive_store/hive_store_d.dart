import 'package:firedart/firedart.dart';
import 'package:hive/hive.dart';

/// Stores tokens using a Hive store.
/// Depends on the Hive plugin: https://pub.dev/packages/hive
class HiveStore extends TokenStore {
  static const keyToken = 'auth_token';

  static Future<HiveStore> create() async {
    // Make sure you call both:
    Hive.init('/home/guy/Documents/hiveStore');
    Hive.registerAdapter(TokenAdapter());

    var box = await Hive.openBox('auth_store',
        compactionStrategy: (entries, deletedEntries) => deletedEntries > 50);
    return HiveStore._internal(box);
  }

  final Box _box;

  HiveStore._internal(this._box);

  @override
  Token read() => _box.get(keyToken);

  @override
  void write(Token token) => _box.put(keyToken, token);

  @override
  void delete() => _box.delete(keyToken);
}

class TokenAdapter extends TypeAdapter<Token> {
  @override
  void write(BinaryWriter writer, Token token) =>
      writer.writeMap(token.toMap());

  @override
  Token read(BinaryReader reader) => Token.fromMap(reader.readMap());

  @override
  int get typeId => 1;
}
