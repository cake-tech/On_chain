import 'package:on_chain/tron/src/address/tron_address.dart';
import 'package:on_chain/tron/src/provider/core/request.dart';
import 'package:on_chain/tron/src/provider/methods/request_methods.dart';

/// Deletes Proposal Transaction.
/// [developers.tron.network](https://developers.tron.network/reference/proposaldelete).
class TronRequestProposalDelete
    extends TronRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TronRequestProposalDelete(
      {required this.ownerAddress,
      required this.proposalId,
      this.permissionId,
      this.visible = true});

  /// Address of proposal owner.
  final TronAddress ownerAddress;

  /// Proposal ID
  final BigInt proposalId;

  /// for multi-signature use
  final int? permissionId;
  @override
  final bool visible;

  /// wallet/proposaldelete
  @override
  TronHTTPMethods get method => TronHTTPMethods.proposaldelete;

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner_address': ownerAddress.toAddress(visible),
      'proposal_id': proposalId,
      'Permission_id': permissionId,
      'visible': visible
    };
  }

  @override
  String toString() {
    return 'TronRequestProposalDelete{${toJson()}}';
  }
}
