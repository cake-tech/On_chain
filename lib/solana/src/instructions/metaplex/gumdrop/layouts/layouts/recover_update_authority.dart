import 'package:on_chain/solana/src/instructions/metaplex/gumdrop/layouts/instruction/instruction.dart';
import 'package:blockchain_utils/layout/layout.dart';

class MetaplexGumdropRecoverUpdateAuthorityLayout
    extends MetaplexGumdropProgramLayout {
  final int walletBump;
  final int bump;
  const MetaplexGumdropRecoverUpdateAuthorityLayout(
      {required this.walletBump, required this.bump});

  factory MetaplexGumdropRecoverUpdateAuthorityLayout.fromBuffer(
      List<int> data) {
    final decode = MetaplexGumdropProgramLayout.decodeAndValidateStruct(
        layout: _layout,
        bytes: data,
        instruction: MetaplexGumdropProgramInstruction
            .recoverUpdateAuthority.insturction);
    return MetaplexGumdropRecoverUpdateAuthorityLayout(
        walletBump: decode["walletBump"], bump: decode["bump"]);
  }

  static final StructLayout _layout = LayoutConst.struct([
    LayoutConst.blob(8, property: "instruction"),
    LayoutConst.u8(property: "bump"),
    LayoutConst.u8(property: "walletBump"),
  ]);

  @override
  StructLayout get layout => _layout;

  @override
  List<int> get instruction =>
      MetaplexGumdropProgramInstruction.recoverUpdateAuthority.insturction;

  @override
  Map<String, dynamic> serialize() {
    return {"bump": bump, "walletBump": walletBump};
  }
}
