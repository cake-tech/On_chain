import 'package:on_chain/solana/src/instructions/stake_pool/layouts/instruction/instruction.dart';
import 'package:blockchain_utils/layout/layout.dart';
import 'package:on_chain/solana/src/borsh_serialization/program_layout.dart';

/// Decrease active stake on a validator layout.
class StakePoolDecreaseValidatorStakeWithReserveLayout
    extends StakePoolProgramLayout {
  /// amount of lamports to split into the transient stake account
  final BigInt lamports;

  /// seed used to create transient stake account
  final BigInt transientStakeSeed;
  StakePoolDecreaseValidatorStakeWithReserveLayout(
      {required this.lamports, required this.transientStakeSeed});

  factory StakePoolDecreaseValidatorStakeWithReserveLayout.fromBuffer(
      List<int> bytes) {
    final decode = ProgramLayout.decodeAndValidateStruct(
        layout: _layout,
        bytes: bytes,
        instruction: StakePoolProgramInstruction
            .decreaseValidatorStakeWithReserve.insturction);
    return StakePoolDecreaseValidatorStakeWithReserveLayout(
      lamports: decode["lamports"],
      transientStakeSeed: decode["transientStakeSeed"],
    );
  }
  static final StructLayout _layout = LayoutConst.struct([
    LayoutConst.u8(property: "instruction"),
    LayoutConst.ns64(property: "lamports"),
    LayoutConst.ns64(property: "transientStakeSeed")
  ]);

  @override
  int get instruction =>
      StakePoolProgramInstruction.decreaseValidatorStakeWithReserve.insturction;

  @override
  StructLayout get layout => _layout;

  @override
  Map<String, dynamic> serialize() {
    return {"lamports": lamports, "transientStakeSeed": transientStakeSeed};
  }
}
