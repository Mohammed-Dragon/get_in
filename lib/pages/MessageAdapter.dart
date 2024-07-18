import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:hive/hive.dart';

class MessageAdapter extends TypeAdapter<Message> {
  @override
  final int typeId = 0; // Unique identifier for this adapter

  /* @override
  Message read(BinaryReader reader) {
    // Implement logic to deserialize the message
    // This method is called when reading from Hive
    // Example: return Message(reader.readString());
  }*/

  @override
  void write(BinaryWriter writer, Message obj) {
    // Implement logic to serialize the message
    // This method is called when writing to Hive
    // Example: writer.writeString(obj.text);
  }

  @override
  Message read(BinaryReader reader) {
    // TODO: implement read
    throw UnimplementedError();
  }
}
