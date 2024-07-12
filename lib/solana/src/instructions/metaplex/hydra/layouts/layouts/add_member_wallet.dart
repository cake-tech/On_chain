import 'package:on_chain/solana/src/instructions/metaplex/hydra/layouts/instruction/instruction.dart';
import 'package:blockchain_utils/layout/layout.dart';

class MetaplexHydraAddMemberWalletLayout extends MetaplexHydraProgramLayout {
  final BigInt shares;
  const MetaplexHydraAddMemberWalletLayout({required this.shares});

  factory MetaplexHydraAddMemberWalletLayout.fromBuffer(List<int> data) {
    final decode = MetaplexHydraProgramLayout.decodeAndValidateStruct(
        layout: _layout,
        bytes: data,
        instruction:
            MetaplexHydraProgramInstruction.processAddMemberWallet.insturction);
    return MetaplexHydraAddMemberWalletLayout(shares: decode["shares"]);
  }

  static final StructLayout _layout = LayoutConst.struct([
    LayoutConst.blob(8, property: "instruction"),
    LayoutConst.u64(property: "shares"),
  ]);

  @override
  StructLayout get layout => _layout;

  @override
  List<int> get instruction =>
      MetaplexHydraProgramInstruction.processAddMemberWallet.insturction;

  @override
  Map<String, dynamic> serialize() {
    return {"shares": shares};
  }
}
