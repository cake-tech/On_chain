import 'package:on_chain/tron/src/provider/core/request.dart';
import 'package:on_chain/tron/src/provider/methods/request_methods.dart';

/// Get the size of the pending pool queue
/// [developers.tron.network](https://developers.tron.network/reference/getpendingsize).
class TronRequestGetPendingSize
    extends TronRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TronRequestGetPendingSize();

  /// wallet/getpendingsize
  @override
  TronHTTPMethods get method => TronHTTPMethods.getpendingsize;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String toString() {
    return 'TronRequestGetPendingSize{${toJson()}}';
  }
}
