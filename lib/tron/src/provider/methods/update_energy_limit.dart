import 'package:on_chain/tron/src/address/tron_address.dart';
import 'package:on_chain/tron/src/provider/core/request.dart';
import 'package:on_chain/tron/src/provider/methods/request_methods.dart';

/// Update the origin_energy_limit parameter of a smart contract
/// [developers.tron.network](https://developers.tron.network/reference/wallet-updateenergylimit).
class TronRequestUpdateEnergyLimit
    extends TronRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TronRequestUpdateEnergyLimit(
      {required this.ownerAddress,
      required this.contractAddress,
      required this.originEnergyLimit,
      this.permissionId,
      this.visible = true});

  /// Transaction creator address
  final TronAddress ownerAddress;

  /// The address of the contract to be modified
  final TronAddress contractAddress;

  /// The maximum energy the creator sets. The greatest amount of energy the creator consumes during contract execution or creation process.
  final int originEnergyLimit;

  /// for multi-signature use
  final int? permissionId;
  @override
  final bool visible;

  /// wallet/updateenergylimit
  @override
  TronHTTPMethods get method => TronHTTPMethods.updateenergylimit;

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner_address': ownerAddress.toAddress(visible),
      'contract_address': contractAddress.toAddress(visible),
      'origin_energy_limit': originEnergyLimit,
      'Permission_id': permissionId,
      'visible': visible
    };
  }

  @override
  String toString() {
    return 'TronRequestUpdateEnergyLimit{${toJson()}}';
  }
}
