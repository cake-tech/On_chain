import 'package:on_chain/tron/src/address/tron_address.dart';
import 'package:on_chain/tron/src/provider/core/request.dart';
import 'package:on_chain/tron/src/provider/methods/request_methods.dart';

/// Creates a trading pair.
/// [developers.tron.network](https://developers.tron.network/reference/exchangecreate).
class TronRequestExchangeCreate
    extends TronRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TronRequestExchangeCreate(
      {required this.ownerAddress,
      required this.firstTokenId,
      required this.firstTokenBalance,
      required this.secondTokenId,
      required this.secondTokenBalance,
      this.permissionId,
      this.visible = true});
  final TronAddress ownerAddress;

  /// The first token's id
  final String firstTokenId;

  /// The first token's balance
  final int firstTokenBalance;

  /// The second token's id
  final String secondTokenId;

  /// The second token's balance
  final int secondTokenBalance;

  /// for multi-signature use
  final int? permissionId;
  @override
  final bool visible;

  /// wallet/exchangecreate
  @override
  TronHTTPMethods get method => TronHTTPMethods.exchangecreate;

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner_address': ownerAddress.toAddress(visible),
      'first_token_id': firstTokenId,
      'first_token_balance': firstTokenBalance,
      'second_token_id': secondTokenId,
      'second_token_balance': secondTokenBalance,
      'permission_id': permissionId,
      'visible': visible
    };
  }

  @override
  String toString() {
    return 'TronRequestExchangeCreate{${toJson()}}';
  }
}
