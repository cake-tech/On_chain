import 'package:blockchain_utils/binary/utils.dart';
import 'package:blockchain_utils/compare/compare.dart';
import 'package:blockchain_utils/exception/exceptions.dart';
import 'package:blockchain_utils/layout/layout.dart';
import 'package:on_chain/solana/src/borsh_serialization/program_layout.dart';

abstract class MetaplexBubblegumProgramLayout extends ProgramLayout {
  const MetaplexBubblegumProgramLayout();
  @override
  abstract final List<int> instruction;

  static ProgramLayout fromBytes(List<int> data) {
    return UnknownProgramLayout(data);
  }

  static Map<String, dynamic> decodeAndValidateStruct({
    required StructLayout layout,
    required List<int> bytes,
    required List<int> instruction,
  }) {
    final decode = layout.deserialize(bytes).value;
    final instcutionData = decode["instruction"];
    if (!bytesEqual(instcutionData, instruction)) {
      throw MessageException("invalid instruction bytes", details: {
        "expected": BytesUtils.toHexString(instruction),
        "instruction": BytesUtils.toBinary(instcutionData)
      });
    }

    return decode;
  }
}
