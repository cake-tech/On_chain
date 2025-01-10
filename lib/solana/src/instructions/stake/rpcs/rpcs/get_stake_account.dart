import 'package:on_chain/solana/src/address/sol_address.dart';
import 'package:on_chain/solana/src/instructions/stake/accounts/accounts.dart';
import 'package:on_chain/solana/src/rpc/rpc.dart';

class SolanaRPCGetStakeAccount
    extends SolanaRequest<StakeAccount?, Map<String, dynamic>?> {
  const SolanaRPCGetStakeAccount({
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
  StakeAccount? onResonse(result) {
    if (result == null) return null;
    final accountInfo = SolanaAccountInfo.fromJson(result);
    return StakeAccount.fromBuffer(accountInfo.toBytesData());
  }
}
