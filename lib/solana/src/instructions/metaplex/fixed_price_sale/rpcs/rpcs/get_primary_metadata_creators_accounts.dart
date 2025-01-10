import 'package:on_chain/solana/src/address/sol_address.dart';
import 'package:on_chain/solana/src/instructions/metaplex/fixed_price_sale/accounts/accounts.dart';
import 'package:on_chain/solana/src/rpc/rpc.dart';

/// Retrieves the account info from the provided address and deserializes
/// the [PrimaryMetadataCreators] from its data.
class SolanaRPCGetPrimaryMetadataCreatorsAccount
    extends SolanaRequest<PrimaryMetadataCreators?, Map<String, dynamic>?> {
  const SolanaRPCGetPrimaryMetadataCreatorsAccount({
    required this.account,
    super.commitment,
    super.minContextSlot,
  });

  @override
  String get method => SolanaRequestMethods.getAccountInfo.value;
  final SolAddress account;

  @override
  List<dynamic> toJson() {
    return [
      account.address,
      SolanaRequestUtils.createConfig([
        commitment?.toJson(),
        SolanaRequestEncoding.base64.toJson(),
        minContextSlot?.toJson()
      ])
    ];
  }

  @override
  PrimaryMetadataCreators? onResonse(result) {
    if (result == null) return null;
    final accountInfo = SolanaAccountInfo.fromJson(result);
    return PrimaryMetadataCreators.fromBuffer(accountInfo.toBytesData());
  }
}
