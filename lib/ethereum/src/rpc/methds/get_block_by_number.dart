import 'package:on_chain/ethereum/src/models/block_tag.dart';
import 'package:on_chain/ethereum/src/rpc/core/core.dart';
import 'package:on_chain/ethereum/src/rpc/core/methods.dart';
import 'package:on_chain/ethereum/src/models/block.dart';

/// Returns information about a block by block number.
/// [ethereum.org](https://ethereum.org/en/developers/docs/apis/json-rpc/#eth_getBlockByNumber)
class EthereumRequestGetBlockByNumber
    extends EthereumRequest<BlockDetails, Map<String, dynamic>> {
  EthereumRequestGetBlockByNumber({
    required BlockTagOrNumber blockNumber,
    this.hydrated = true,
  }) : super(blockNumber: blockNumber);

  /// eth_getBlockByNumber
  @override
  String get method => EthereumMethods.getBlockByNumber.value;

  ///  If true it returns the full transaction objects, if false only the hashes of the transactions.
  final bool hydrated;

  @override
  List<dynamic> toJson() {
    return [blockNumber, hydrated];
  }

  @override
  BlockDetails onResonse(dynamic result) {
    return BlockDetails.fromJson(result, hydrated: hydrated);
  }

  @override
  String toString() {
    return 'EthereumRequestGetBlockByNumber{${toJson()}}';
  }
}
