import 'package:on_chain/tron/src/provider/core/request.dart';
import 'package:on_chain/tron/src/provider/methods/request_methods.dart';

/// Queries proposal based on ID and returns proposal details.
/// [developers.tron.network](https://developers.tron.network/reference/getproposalbyid).
class TronRequestGetProposalById
    extends TronRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TronRequestGetProposalById({required this.id, this.visible});
  final int id;
  @override
  final bool? visible;

  @override
  TronHTTPMethods get method => TronHTTPMethods.getproposalbyid;

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'visible': visible};
  }
}
