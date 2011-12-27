; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/ashldi-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@data = internal unnamed_addr constant [64 x i64] [i64 81985529216486895, i64 163971058432973790, i64 327942116865947580, i64 655884233731895160, i64 1311768467463790320, i64 2623536934927580640, i64 5247073869855161280, i64 -7952596333999229056, i64 2541551405711093504, i64 5083102811422187008, i64 -8280538450865177600, i64 1885667171979196416, i64 3771334343958392832, i64 7542668687916785664, i64 -3361406697875980288, i64 -6722813395751960576, i64 5001117282205630464, i64 -8444509509298290688, i64 1557725055112970240, i64 3115450110225940480, i64 6230900220451880960, i64 -5984943632805789696, i64 6476856808097972224, i64 -5493030457513607168, i64 7460683158682337280, i64 -3525377756344877056, i64 -7050755512689754112, i64 4345233048330043392, i64 8690466096660086784, i64 -1065811880389378048, i64 -2131623760778756096, i64 -4263247521557512192, i64 -8526495043115024384, i64 1393753987479502848, i64 2787507974959005696, i64 5575015949918011392, i64 -7296712173873528832, i64 3853319725962493952, i64 7706639451924987904, i64 -3033465169859575808, i64 -6066930339719151616, i64 6312883394271248384, i64 -5820977285167054848, i64 6804789503375441920, i64 -4837165066958667776, i64 8772413939792216064, i64 -901916194125119488, i64 -1803832388250238976, i64 -3607664776500477952, i64 -7215329553000955904, i64 4016084967707639808, i64 8032169935415279616, i64 -2382404202878992384, i64 -4764808405757984768, i64 8917127262193582080, i64 -612489549322387456, i64 -1224979098644774912, i64 -2449958197289549824, i64 -4899916394579099648, i64 8646911284551352320, i64 -1152921504606846976, i64 -2305843009213693952, i64 -4611686018427387904, i64 -9223372036854775808], align 16

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %sh_prom.i = phi i64 [ %indvar.next3, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %sh_prom.i to i32
  %cmp = icmp slt i32 %storemerge, 64
  br i1 %cmp, label %for.body, label %for.cond9

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr [64 x i64]* @data, i64 0, i64 %sh_prom.i
  %shl.i = shl i64 81985529216486895, %sh_prom.i
  %tmp6 = load i64* %arrayidx, align 8
  %cmp7 = icmp eq i64 %shl.i, %tmp6
  br i1 %cmp7, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %for.body
  %indvar.next3 = add i64 %sh_prom.i, 1
  br label %for.cond

for.cond9:                                        ; preds = %for.cond, %for.inc26
  %indvar = phi i64 [ %indvar.next, %for.inc26 ], [ 0, %for.cond ]
  %storemerge1 = trunc i64 %indvar to i32
  %arrayidx21 = getelementptr [64 x i64]* @data, i64 0, i64 %indvar
  %cmp11 = icmp slt i32 %storemerge1, 64
  br i1 %cmp11, label %for.body12, label %for.end29

for.body12:                                       ; preds = %for.cond9
  switch i32 %storemerge1, label %sw.default.i [
    i32 0, label %constant_shift.exit
    i32 1, label %sw.bb2.i
    i32 2, label %sw.bb5.i
    i32 3, label %sw.bb8.i
    i32 4, label %sw.bb11.i
    i32 5, label %sw.bb14.i
    i32 6, label %sw.bb17.i
    i32 7, label %sw.bb20.i
    i32 8, label %sw.bb23.i
    i32 9, label %sw.bb26.i
    i32 10, label %sw.bb29.i
    i32 11, label %sw.bb32.i
    i32 12, label %sw.bb35.i
    i32 13, label %sw.bb38.i
    i32 14, label %sw.bb41.i
    i32 15, label %sw.bb44.i
    i32 16, label %sw.bb47.i
    i32 17, label %sw.bb50.i
    i32 18, label %sw.bb53.i
    i32 19, label %sw.bb56.i
    i32 20, label %sw.bb59.i
    i32 21, label %sw.bb62.i
    i32 22, label %sw.bb65.i
    i32 23, label %sw.bb68.i
    i32 24, label %sw.bb71.i
    i32 25, label %sw.bb74.i
    i32 26, label %sw.bb77.i
    i32 27, label %sw.bb80.i
    i32 28, label %sw.bb83.i
    i32 29, label %sw.bb86.i
    i32 30, label %sw.bb89.i
    i32 31, label %sw.bb92.i
    i32 32, label %sw.bb95.i
    i32 33, label %sw.bb98.i
    i32 34, label %sw.bb101.i
    i32 35, label %sw.bb104.i
    i32 36, label %sw.bb107.i
    i32 37, label %sw.bb110.i
    i32 38, label %sw.bb113.i
    i32 39, label %sw.bb116.i
    i32 40, label %sw.bb119.i
    i32 41, label %sw.bb122.i
    i32 42, label %sw.bb125.i
    i32 43, label %sw.bb128.i
    i32 44, label %sw.bb131.i
    i32 45, label %sw.bb134.i
    i32 46, label %sw.bb137.i
    i32 47, label %sw.bb140.i
    i32 48, label %sw.bb143.i
    i32 49, label %sw.bb146.i
    i32 50, label %sw.bb149.i
    i32 51, label %sw.bb152.i
    i32 52, label %sw.bb155.i
    i32 53, label %sw.bb158.i
    i32 54, label %sw.bb161.i
    i32 55, label %sw.bb164.i
    i32 56, label %sw.bb167.i
    i32 57, label %sw.bb170.i
    i32 58, label %sw.bb173.i
    i32 59, label %sw.bb176.i
    i32 60, label %sw.bb179.i
    i32 61, label %sw.bb182.i
    i32 62, label %sw.bb185.i
    i32 63, label %sw.bb188.i
  ]

sw.bb2.i:                                         ; preds = %for.body12
  br label %constant_shift.exit

sw.bb5.i:                                         ; preds = %for.body12
  br label %constant_shift.exit

sw.bb8.i:                                         ; preds = %for.body12
  br label %constant_shift.exit

sw.bb11.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb14.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb17.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb20.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb23.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb26.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb29.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb32.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb35.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb38.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb41.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb44.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb47.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb50.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb53.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb56.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb59.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb62.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb65.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb68.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb71.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb74.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb77.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb80.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb83.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb86.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb89.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb92.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb95.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb98.i:                                        ; preds = %for.body12
  br label %constant_shift.exit

sw.bb101.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb104.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb107.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb110.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb113.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb116.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb119.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb122.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb125.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb128.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb131.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb134.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb137.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb140.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb143.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb146.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb149.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb152.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb155.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb158.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb161.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb164.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb167.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb170.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb173.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb176.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb179.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb182.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb185.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.bb188.i:                                       ; preds = %for.body12
  br label %constant_shift.exit

sw.default.i:                                     ; preds = %for.body12
  tail call void @abort() noreturn nounwind
  unreachable

constant_shift.exit:                              ; preds = %for.body12, %sw.bb2.i, %sw.bb5.i, %sw.bb8.i, %sw.bb11.i, %sw.bb14.i, %sw.bb17.i, %sw.bb20.i, %sw.bb23.i, %sw.bb26.i, %sw.bb29.i, %sw.bb32.i, %sw.bb35.i, %sw.bb38.i, %sw.bb41.i, %sw.bb44.i, %sw.bb47.i, %sw.bb50.i, %sw.bb53.i, %sw.bb56.i, %sw.bb59.i, %sw.bb62.i, %sw.bb65.i, %sw.bb68.i, %sw.bb71.i, %sw.bb74.i, %sw.bb77.i, %sw.bb80.i, %sw.bb83.i, %sw.bb86.i, %sw.bb89.i, %sw.bb92.i, %sw.bb95.i, %sw.bb98.i, %sw.bb101.i, %sw.bb104.i, %sw.bb107.i, %sw.bb110.i, %sw.bb113.i, %sw.bb116.i, %sw.bb119.i, %sw.bb122.i, %sw.bb125.i, %sw.bb128.i, %sw.bb131.i, %sw.bb134.i, %sw.bb137.i, %sw.bb140.i, %sw.bb143.i, %sw.bb146.i, %sw.bb149.i, %sw.bb152.i, %sw.bb155.i, %sw.bb158.i, %sw.bb161.i, %sw.bb164.i, %sw.bb167.i, %sw.bb170.i, %sw.bb173.i, %sw.bb176.i, %sw.bb179.i, %sw.bb182.i, %sw.bb185.i, %sw.bb188.i
  %tmp1911.i = phi i64 [ 81985529216486895, %for.body12 ], [ -9223372036854775808, %sw.bb188.i ], [ -4611686018427387904, %sw.bb185.i ], [ -2305843009213693952, %sw.bb182.i ], [ -1152921504606846976, %sw.bb179.i ], [ 8646911284551352320, %sw.bb176.i ], [ -4899916394579099648, %sw.bb173.i ], [ -2449958197289549824, %sw.bb170.i ], [ -1224979098644774912, %sw.bb167.i ], [ -612489549322387456, %sw.bb164.i ], [ 8917127262193582080, %sw.bb161.i ], [ -4764808405757984768, %sw.bb158.i ], [ -2382404202878992384, %sw.bb155.i ], [ 8032169935415279616, %sw.bb152.i ], [ 4016084967707639808, %sw.bb149.i ], [ -7215329553000955904, %sw.bb146.i ], [ -3607664776500477952, %sw.bb143.i ], [ -1803832388250238976, %sw.bb140.i ], [ -901916194125119488, %sw.bb137.i ], [ 8772413939792216064, %sw.bb134.i ], [ -4837165066958667776, %sw.bb131.i ], [ 6804789503375441920, %sw.bb128.i ], [ -5820977285167054848, %sw.bb125.i ], [ 6312883394271248384, %sw.bb122.i ], [ -6066930339719151616, %sw.bb119.i ], [ -3033465169859575808, %sw.bb116.i ], [ 7706639451924987904, %sw.bb113.i ], [ 3853319725962493952, %sw.bb110.i ], [ -7296712173873528832, %sw.bb107.i ], [ 5575015949918011392, %sw.bb104.i ], [ 2787507974959005696, %sw.bb101.i ], [ 1393753987479502848, %sw.bb98.i ], [ -8526495043115024384, %sw.bb95.i ], [ -4263247521557512192, %sw.bb92.i ], [ -2131623760778756096, %sw.bb89.i ], [ -1065811880389378048, %sw.bb86.i ], [ 8690466096660086784, %sw.bb83.i ], [ 4345233048330043392, %sw.bb80.i ], [ -7050755512689754112, %sw.bb77.i ], [ -3525377756344877056, %sw.bb74.i ], [ 7460683158682337280, %sw.bb71.i ], [ -5493030457513607168, %sw.bb68.i ], [ 6476856808097972224, %sw.bb65.i ], [ -5984943632805789696, %sw.bb62.i ], [ 6230900220451880960, %sw.bb59.i ], [ 3115450110225940480, %sw.bb56.i ], [ 1557725055112970240, %sw.bb53.i ], [ -8444509509298290688, %sw.bb50.i ], [ 5001117282205630464, %sw.bb47.i ], [ -6722813395751960576, %sw.bb44.i ], [ -3361406697875980288, %sw.bb41.i ], [ 7542668687916785664, %sw.bb38.i ], [ 3771334343958392832, %sw.bb35.i ], [ 1885667171979196416, %sw.bb32.i ], [ -8280538450865177600, %sw.bb29.i ], [ 5083102811422187008, %sw.bb26.i ], [ 2541551405711093504, %sw.bb23.i ], [ -7952596333999229056, %sw.bb20.i ], [ 5247073869855161280, %sw.bb17.i ], [ 2623536934927580640, %sw.bb14.i ], [ 1311768467463790320, %sw.bb11.i ], [ 655884233731895160, %sw.bb8.i ], [ 327942116865947580, %sw.bb5.i ], [ 163971058432973790, %sw.bb2.i ]
  %tmp22 = load i64* %arrayidx21, align 8
  %cmp23 = icmp eq i64 %tmp1911.i, %tmp22
  br i1 %cmp23, label %for.inc26, label %if.then24

if.then24:                                        ; preds = %constant_shift.exit
  tail call void @abort() noreturn nounwind
  unreachable

for.inc26:                                        ; preds = %constant_shift.exit
  %indvar.next = add i64 %indvar, 1
  br label %for.cond9

for.end29:                                        ; preds = %for.cond9
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
