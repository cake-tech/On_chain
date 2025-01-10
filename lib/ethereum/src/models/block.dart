import 'package:on_chain/ethereum/src/models/transaction.dart';
import 'package:on_chain/utils/utils/number_utils.dart';

/// Represents a withdrawal in the context of Ethereum block.
class Withdrawal {
  final String address;
  final String amount;
  final String index;
  final String validatorIndex;

  const Withdrawal({
    required this.address,
    required this.amount,
    required this.index,
    required this.validatorIndex,
  });

  factory Withdrawal.fromJson(Map<String, dynamic> json) {
    return Withdrawal(
      address: json['address'],
      amount: json['amount'],
      index: json['index'],
      validatorIndex: json['validatorIndex'],
    );
  }

  @override
  String toString() {
    return '''
      Withdrawal {
        address: $address,
        amount: $amount,
        index: $index,
        validatorIndex: $validatorIndex,
      }
    ''';
  }
}

/// Represents details about an Ethereum block.
class BlockDetails {
  final List<TransactionInfo> transactions;
  final List<String> transactionIds;
  final BigInt? baseFeePerGas;
  final int difficulty;
  final String extraData;
  final BigInt gasLimit;
  final BigInt gasUsed;
  final String? hash;
  final String logsBloom;
  final String? miner;
  final String mixHash;
  final int? nonce;
  final int number;
  final String parentHash;
  final String receiptsRoot;
  final String sha3Uncles;
  final int size;
  final String stateRoot;
  final String timestamp;
  final String? totalDifficulty;
  final String transactionsRoot;
  final List<dynamic> uncles;
  final List<Withdrawal> withdrawals;
  final String? withdrawalsRoot;

  const BlockDetails({
    required this.baseFeePerGas,
    required this.difficulty,
    required this.transactionIds,
    required this.transactions,
    required this.extraData,
    required this.gasLimit,
    required this.gasUsed,
    required this.hash,
    required this.logsBloom,
    required this.miner,
    required this.mixHash,
    required this.nonce,
    required this.number,
    required this.parentHash,
    required this.receiptsRoot,
    required this.sha3Uncles,
    required this.size,
    required this.stateRoot,
    required this.timestamp,
    required this.totalDifficulty,
    required this.transactionsRoot,
    required this.uncles,
    required this.withdrawals,
    required this.withdrawalsRoot,
  });

  factory BlockDetails.fromJson(Map<String, dynamic> json,
      {bool hydrated = true}) {
    final List<Withdrawal> withdrawals = (json['withdrawals'] as List<dynamic>?)
            ?.map((withdrawal) => Withdrawal.fromJson(withdrawal))
            .toList() ??
        <Withdrawal>[];
    final List<dynamic> transactions = json['transactions'];

    final transactionsInfo = hydrated
        ? transactions.map((e) => TransactionInfo.fromJson(e)).toList()
        : <TransactionInfo>[];
    final List<String> ids = hydrated
        ? transactionsInfo.map((e) => e.hash).toList()
        : transactions.cast();

    return BlockDetails(
      transactionIds: ids,
      transactions: transactionsInfo,
      baseFeePerGas: PluginBigintUtils.tryHexToBigint(json['baseFeePerGas']),
      difficulty: PluginIntUtils.hexToInt(json['difficulty']),
      extraData: json['extraData'],
      gasLimit: PluginBigintUtils.hexToBigint(json['gasLimit']),
      gasUsed: PluginBigintUtils.hexToBigint(json['gasUsed']),
      hash: json['hash'],
      logsBloom: json['logsBloom'],
      miner: json['miner'],
      mixHash: json['mixHash'],
      nonce: PluginIntUtils.tryHexToInt(json['nonce']),
      number: PluginIntUtils.hexToInt(json['number']),
      parentHash: json['parentHash'],
      receiptsRoot: json['receiptsRoot'],
      sha3Uncles: json['sha3Uncles'],
      size: PluginIntUtils.hexToInt(json['size']),
      stateRoot: json['stateRoot'],
      timestamp: json['timestamp'],
      totalDifficulty: json['totalDifficulty'],
      transactionsRoot: json['transactionsRoot'],
      uncles: json['uncles'] ?? [],
      withdrawals: withdrawals,
      withdrawalsRoot: json['withdrawalsRoot'],
    );
  }

  @override
  String toString() {
    return '''
      BlockDetails {
        baseFeePerGas: $baseFeePerGas,
        difficulty: $difficulty,
        extraData: $extraData,
        gasLimit: $gasLimit,
        gasUsed: $gasUsed,
        hash: $hash,
        logsBloom: $logsBloom,
        miner: $miner,
        mixHash: $mixHash,
        nonce: $nonce,
        number: $number,
        parentHash: $parentHash,
        receiptsRoot: $receiptsRoot,
        sha3Uncles: $sha3Uncles,
        size: $size,
        stateRoot: $stateRoot,
        timestamp: $timestamp,
        totalDifficulty: $totalDifficulty,
        transactionsRoot: $transactionsRoot,
        uncles: $uncles,
        withdrawals: $withdrawals,
        withdrawalsRoot: $withdrawalsRoot,
      }
    ''';
  }
}
