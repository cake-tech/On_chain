import 'package:blockchain_utils/utils/utils.dart';
import 'package:on_chain/solana/src/address/sol_address.dart';
import 'package:on_chain/solana/src/instructions/metaplex/bubblegum/layouts/instructions/instruction.dart';
import 'package:on_chain/solana/src/instructions/metaplex/bubblegum/types/types/meta_data.dart';
import 'package:blockchain_utils/layout/layout.dart';
import 'package:on_chain/solana/src/utils/layouts.dart';

class MetaplexBubblegumSetAndVerifyCollectionLayout
    extends MetaplexBubblegumProgramLayout {
  final List<int> root;
  final List<int> dataHash;
  final List<int> creatorHash;
  final BigInt nonce;
  final int index;
  final MetaData message;
  final SolAddress collection;
  MetaplexBubblegumSetAndVerifyCollectionLayout(
      {required List<int> root,
      required List<int> dataHash,
      required List<int> creatorHash,
      required this.nonce,
      required this.index,
      required this.message,
      required this.collection})
      : root = BytesUtils.toBytes(root, unmodifiable: true),
        dataHash = BytesUtils.toBytes(dataHash, unmodifiable: true),
        creatorHash = BytesUtils.toBytes(creatorHash, unmodifiable: true);

  factory MetaplexBubblegumSetAndVerifyCollectionLayout.fromBuffer(
      List<int> data) {
    final decode = MetaplexBubblegumProgramLayout.decodeAndValidateStruct(
        layout: _layout,
        bytes: data,
        instruction: MetaplexBubblegumProgramInstruction
            .setAndVerifyCollection.insturction);
    return MetaplexBubblegumSetAndVerifyCollectionLayout(
        root: decode["root"],
        dataHash: decode["dataHash"],
        creatorHash: decode["creatorHash"],
        nonce: decode["nonce"],
        index: decode["index"],
        message: MetaData.fromJson(decode["metaData"]),
        collection: decode["collection"]);
  }

  static final StructLayout _layout = LayoutConst.struct([
    LayoutConst.blob(8, property: "instruction"),
    LayoutConst.blob(32, property: "root"),
    LayoutConst.blob(32, property: "dataHash"),
    LayoutConst.blob(32, property: "creatorHash"),
    LayoutConst.u64(property: "nonce"),
    LayoutConst.u32(property: "index"),
    MetaData.staticLayout,
    SolanaLayoutUtils.publicKey("collection")
  ]);

  @override
  StructLayout get layout => _layout;

  @override
  List<int> get instruction =>
      MetaplexBubblegumProgramInstruction.setAndVerifyCollection.insturction;

  @override
  Map<String, dynamic> serialize() {
    return {
      "root": root,
      "dataHash": dataHash,
      "creatorHash": creatorHash,
      "nonce": nonce,
      "index": index,
      "metaData": message.serialize(),
      "collection": collection
    };
  }
}
