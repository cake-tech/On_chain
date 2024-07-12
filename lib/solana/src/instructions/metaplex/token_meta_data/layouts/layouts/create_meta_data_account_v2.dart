import 'package:on_chain/solana/src/instructions/metaplex/token_meta_data/layouts/instruction/instruction.dart';

import 'package:blockchain_utils/layout/layout.dart';
import 'package:on_chain/solana/src/borsh_serialization/program_layout.dart';

///
class MetaplexTokenMetaDataCreateMetadataAccountV2Layout
    extends MetaplexTokenMetaDataProgramLayout {
  const MetaplexTokenMetaDataCreateMetadataAccountV2Layout();

  factory MetaplexTokenMetaDataCreateMetadataAccountV2Layout.fromBuffer(
      List<int> data) {
    ProgramLayout.decodeAndValidateStruct(
        layout: _layout,
        bytes: data,
        instruction: MetaplexTokenMetaDataProgramInstruction
            .createMetadataAccountV2.insturction);
    return const MetaplexTokenMetaDataCreateMetadataAccountV2Layout();
  }

  static final StructLayout _layout = LayoutConst.struct([
    LayoutConst.u8(property: "instruction"),
  ]);

  @override
  StructLayout get layout => _layout;

  @override
  int get instruction => MetaplexTokenMetaDataProgramInstruction
      .createMetadataAccountV2.insturction;

  @override
  Map<String, dynamic> serialize() {
    return {};
  }
}
