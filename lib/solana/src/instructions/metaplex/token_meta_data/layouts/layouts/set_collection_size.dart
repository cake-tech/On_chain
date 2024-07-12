import 'package:on_chain/solana/src/instructions/metaplex/token_meta_data/layouts/instruction/instruction.dart';
import 'package:blockchain_utils/layout/layout.dart';
import 'package:on_chain/solana/src/borsh_serialization/program_layout.dart';

class MetaplexTokenMetaDataSetCollectionSizeLayout
    extends MetaplexTokenMetaDataProgramLayout {
  final BigInt size;
  const MetaplexTokenMetaDataSetCollectionSizeLayout({required this.size});

  factory MetaplexTokenMetaDataSetCollectionSizeLayout.fromBuffer(
      List<int> data) {
    final decode = ProgramLayout.decodeAndValidateStruct(
        layout: _layout,
        bytes: data,
        instruction: MetaplexTokenMetaDataProgramInstruction
            .setCollectionSize.insturction);
    return MetaplexTokenMetaDataSetCollectionSizeLayout(size: decode["size"]);
  }

  static final StructLayout _layout = LayoutConst.struct([
    LayoutConst.u8(property: "instruction"),
    LayoutConst.u64(property: "size")
  ]);

  @override
  StructLayout get layout => _layout;

  @override
  int get instruction =>
      MetaplexTokenMetaDataProgramInstruction.setCollectionSize.insturction;

  @override
  Map<String, dynamic> serialize() {
    return {"size": size};
  }
}
