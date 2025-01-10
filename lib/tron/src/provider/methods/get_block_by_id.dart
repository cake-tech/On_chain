import 'package:on_chain/tron/src/provider/core/request.dart';
import 'package:on_chain/tron/src/provider/methods/request_methods.dart';

/// Query block by ID(block hash).
/// [developers.tron.network](https://developers.tron.network/reference/getblockbyid).
class TronRequestGetBlockById
    extends TronRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TronRequestGetBlockById({required this.value});
  final String value;

  /// wallet/getblockbyid
  @override
  TronHTTPMethods get method => TronHTTPMethods.getblockbyid;

  @override
  Map<String, dynamic> toJson() {
    return {'value': value};
  }

  @override
  String toString() {
    return 'TronRequestGetBlockById{${toJson()}}';
  }
}
