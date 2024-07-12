import 'package:on_chain/solana/src/instructions/stake/layouts/instruction/instruction.dart';
import 'package:blockchain_utils/layout/layout.dart';
import 'package:on_chain/solana/src/borsh_serialization/program_layout.dart';

class StakeMergeLayout extends StakeProgramLayout {
  const StakeMergeLayout();

  factory StakeMergeLayout.fromBuffer(List<int> data) {
    ProgramLayout.decodeAndValidateStruct(
        layout: _layout,
        bytes: data,
        instruction: StakeProgramInstruction.merge.insturction);
    return const StakeMergeLayout();
  }
  static final StructLayout _layout =
      LayoutConst.struct([LayoutConst.u32(property: "instruction")]);

  @override
  StructLayout get layout => _layout;

  @override
  int get instruction => StakeProgramInstruction.merge.insturction;

  @override
  Map<String, dynamic> serialize() {
    return {};
  }
}
