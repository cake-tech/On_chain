import 'package:on_chain/solana/src/instructions/metaplex/token_meta_data/layouts/instruction/instruction.dart';
import 'package:on_chain/solana/src/instructions/metaplex/token_meta_data/types/types/payload.dart';
import 'package:blockchain_utils/layout/layout.dart';
import 'package:on_chain/solana/src/borsh_serialization/program_layout.dart';

class MetaplexTokenMetaDataTransferV1Layout
    extends MetaplexTokenMetaDataProgramLayout {
  final Payload? authorizationData;
  final BigInt amount;
  static const int discriminator = 0;

  const MetaplexTokenMetaDataTransferV1Layout({
    required this.amount,
    this.authorizationData,
  });

  factory MetaplexTokenMetaDataTransferV1Layout.fromBuffer(List<int> data) {
    final decode = ProgramLayout.decodeAndValidateStruct(
        layout: _layout,
        bytes: data,
        instruction:
            MetaplexTokenMetaDataProgramInstruction.transferV1.insturction,
        discriminator: discriminator);
    return MetaplexTokenMetaDataTransferV1Layout(
        authorizationData: decode["authorizationData"] == null
            ? null
            : Payload.fromJson(decode["authorizationData"]),
        amount: decode["amount"]);
  }

  static final StructLayout _layout = LayoutConst.struct([
    LayoutConst.u8(property: "instruction"),
    LayoutConst.u8(property: "discriminator"),
    LayoutConst.u64(property: "amount"),
    LayoutConst.optional(Payload.staticLayout, property: "authorizationData"),
  ]);

  @override
  StructLayout get layout => _layout;

  @override
  int get instruction =>
      MetaplexTokenMetaDataProgramInstruction.transferV1.insturction;

  @override
  Map<String, dynamic> serialize() {
    return {
      "authorizationData": authorizationData?.serialize(),
      "discriminator": discriminator,
      "amount": amount,
    };
  }
}
