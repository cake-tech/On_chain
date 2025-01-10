part of 'package:on_chain/solidity/abi/abi.dart';

/// ABICoder implementation for encoding and decoding Ethereum and Tron addresses.
class AddressCoder implements ABICoder<SolidityAddress> {
  /// Creates an instance of the AddressCoder class.
  const AddressCoder();

  /// Constant defining the length of Ethereum and Tron addresses in bytes.
  static const int addrLength = 20;

  /// Decodes a BaseHexAddress from the given ABI-encoded bytes.
  /// Supports both Ethereum and Tron address formats based on the `tronTypes` flag.
  @override
  DecoderResult<SolidityAddress> decode(AbiParameter params, List<int> bytes) {
    final addrBytes = bytes.sublist(
        ABIConst.uintBytesLength - addrLength, ABIConst.uintBytesLength);
    return DecoderResult(
        result: SolidityAddress.fromBytes(addrBytes),
        consumed: ABIConst.uintBytesLength,
        name: params.name);
  }

  /// Encodes a BaseHexAddress to ABI-encoded bytes.
  /// The resulting bytes include Ethereum or Tron address bytes
  @override
  EncoderResult abiEncode(AbiParameter params, SolidityAddress input) {
    final bytes = List<int>.filled(ABIConst.uintBytesLength, 0);
    List<int> addrBytes = input.toBytes();
    if (addrBytes.length == TronAddress.lengthInBytes) {
      addrBytes = addrBytes.sublist(TronAddress.lengthInBytes - addrLength);
    }
    bytes.setAll(ABIConst.uintBytesLength - addrLength, addrBytes);
    return EncoderResult(isDynamic: false, encoded: bytes, name: params.name);
  }

  /// Legacy EIP-712 encoding for BaseHexAddress.
  /// Optionally keeps the size unchanged based on the `keepSize` parameter.
  @override
  EncoderResult legacyEip712Encode(
      AbiParameter params, SolidityAddress input, bool keepSize) {
    if (keepSize) return abiEncode(params, input);
    List<int> addrBytes = input.toBytes();
    addrBytes = addrBytes.sublist(addrBytes.length - addrLength);
    return EncoderResult(
        isDynamic: false, encoded: input.toBytes(), name: params.name);
  }
}
