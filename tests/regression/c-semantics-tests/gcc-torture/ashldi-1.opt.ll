; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/ashldi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@data = internal unnamed_addr constant [64 x i64] [i64 81985529216486895, i64 163971058432973790, i64 327942116865947580, i64 655884233731895160, i64 1311768467463790320, i64 2623536934927580640, i64 5247073869855161280, i64 -7952596333999229056, i64 2541551405711093504, i64 5083102811422187008, i64 -8280538450865177600, i64 1885667171979196416, i64 3771334343958392832, i64 7542668687916785664, i64 -3361406697875980288, i64 -6722813395751960576, i64 5001117282205630464, i64 -8444509509298290688, i64 1557725055112970240, i64 3115450110225940480, i64 6230900220451880960, i64 -5984943632805789696, i64 6476856808097972224, i64 -5493030457513607168, i64 7460683158682337280, i64 -3525377756344877056, i64 -7050755512689754112, i64 4345233048330043392, i64 8690466096660086784, i64 -1065811880389378048, i64 -2131623760778756096, i64 -4263247521557512192, i64 -8526495043115024384, i64 1393753987479502848, i64 2787507974959005696, i64 5575015949918011392, i64 -7296712173873528832, i64 3853319725962493952, i64 7706639451924987904, i64 -3033465169859575808, i64 -6066930339719151616, i64 6312883394271248384, i64 -5820977285167054848, i64 6804789503375441920, i64 -4837165066958667776, i64 8772413939792216064, i64 -901916194125119488, i64 -1803832388250238976, i64 -3607664776500477952, i64 -7215329553000955904, i64 4016084967707639808, i64 8032169935415279616, i64 -2382404202878992384, i64 -4764808405757984768, i64 8917127262193582080, i64 -612489549322387456, i64 -1224979098644774912, i64 -2449958197289549824, i64 -4899916394579099648, i64 8646911284551352320, i64 -1152921504606846976, i64 -2305843009213693952, i64 -4611686018427387904, i64 -9223372036854775808], align 16

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.body ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv15 to i32
  %cmp = icmp slt i32 %0, 64
  br i1 %cmp, label %for.body, label %for.cond2

for.body:                                         ; preds = %for.cond
  %sh_prom.i = and i64 %indvars.iv15, 4294967295
  %shl.i = shl i64 81985529216486895, %sh_prom.i
  %arrayidx = getelementptr inbounds [64 x i64]* @data, i64 0, i64 %indvars.iv15
  %1 = load i64* %arrayidx, align 8, !tbaa !0
  %cmp1 = icmp eq i64 %shl.i, %1
  %indvars.iv.next16 = add i64 %indvars.iv15, 1
  br i1 %cmp1, label %for.cond, label %if.then

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.cond2:                                        ; preds = %for.cond, %constant_shift.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %constant_shift.exit ], [ 0, %for.cond ]
  %2 = trunc i64 %indvars.iv to i32
  %cmp3 = icmp slt i32 %2, 64
  br i1 %cmp3, label %for.body4, label %for.end14

for.body4:                                        ; preds = %for.cond2
  switch i32 %2, label %sw.default.i [
    i32 0, label %constant_shift.exit
    i32 1, label %sw.bb1.i
    i32 2, label %sw.bb3.i
    i32 3, label %sw.bb5.i
    i32 4, label %sw.bb7.i
    i32 5, label %sw.bb9.i
    i32 6, label %sw.bb11.i
    i32 7, label %sw.bb13.i
    i32 8, label %sw.bb15.i
    i32 9, label %sw.bb17.i
    i32 10, label %sw.bb19.i
    i32 11, label %sw.bb21.i
    i32 12, label %sw.bb23.i
    i32 13, label %sw.bb25.i
    i32 14, label %sw.bb27.i
    i32 15, label %sw.bb29.i
    i32 16, label %sw.bb31.i
    i32 17, label %sw.bb33.i
    i32 18, label %sw.bb35.i
    i32 19, label %sw.bb37.i
    i32 20, label %sw.bb39.i
    i32 21, label %sw.bb41.i
    i32 22, label %sw.bb43.i
    i32 23, label %sw.bb45.i
    i32 24, label %sw.bb47.i
    i32 25, label %sw.bb49.i
    i32 26, label %sw.bb51.i
    i32 27, label %sw.bb53.i
    i32 28, label %sw.bb55.i
    i32 29, label %sw.bb57.i
    i32 30, label %sw.bb59.i
    i32 31, label %sw.bb61.i
    i32 32, label %sw.bb63.i
    i32 33, label %sw.bb65.i
    i32 34, label %sw.bb67.i
    i32 35, label %sw.bb69.i
    i32 36, label %sw.bb71.i
    i32 37, label %sw.bb73.i
    i32 38, label %sw.bb75.i
    i32 39, label %sw.bb77.i
    i32 40, label %sw.bb79.i
    i32 41, label %sw.bb81.i
    i32 42, label %sw.bb83.i
    i32 43, label %sw.bb85.i
    i32 44, label %sw.bb87.i
    i32 45, label %sw.bb89.i
    i32 46, label %sw.bb91.i
    i32 47, label %sw.bb93.i
    i32 48, label %sw.bb95.i
    i32 49, label %sw.bb97.i
    i32 50, label %sw.bb99.i
    i32 51, label %sw.bb101.i
    i32 52, label %sw.bb103.i
    i32 53, label %sw.bb105.i
    i32 54, label %sw.bb107.i
    i32 55, label %sw.bb109.i
    i32 56, label %sw.bb111.i
    i32 57, label %sw.bb113.i
    i32 58, label %sw.bb115.i
    i32 59, label %sw.bb117.i
    i32 60, label %sw.bb119.i
    i32 61, label %sw.bb121.i
    i32 62, label %sw.bb123.i
    i32 63, label %sw.bb125.i
  ]

sw.bb1.i:                                         ; preds = %for.body4
  br label %constant_shift.exit

sw.bb3.i:                                         ; preds = %for.body4
  br label %constant_shift.exit

sw.bb5.i:                                         ; preds = %for.body4
  br label %constant_shift.exit

sw.bb7.i:                                         ; preds = %for.body4
  br label %constant_shift.exit

sw.bb9.i:                                         ; preds = %for.body4
  br label %constant_shift.exit

sw.bb11.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb13.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb15.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb17.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb19.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb21.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb23.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb25.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb27.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb29.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb31.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb33.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb35.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb37.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb39.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb41.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb43.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb45.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb47.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb49.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb51.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb53.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb55.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb57.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb59.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb61.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb63.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb65.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb67.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb69.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb71.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb73.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb75.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb77.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb79.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb81.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb83.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb85.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb87.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb89.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb91.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb93.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb95.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb97.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb99.i:                                        ; preds = %for.body4
  br label %constant_shift.exit

sw.bb101.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.bb103.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.bb105.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.bb107.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.bb109.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.bb111.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.bb113.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.bb115.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.bb117.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.bb119.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.bb121.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.bb123.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.bb125.i:                                       ; preds = %for.body4
  br label %constant_shift.exit

sw.default.i:                                     ; preds = %for.body4
  tail call void @abort() noreturn nounwind
  unreachable

constant_shift.exit:                              ; preds = %for.body4, %sw.bb1.i, %sw.bb3.i, %sw.bb5.i, %sw.bb7.i, %sw.bb9.i, %sw.bb11.i, %sw.bb13.i, %sw.bb15.i, %sw.bb17.i, %sw.bb19.i, %sw.bb21.i, %sw.bb23.i, %sw.bb25.i, %sw.bb27.i, %sw.bb29.i, %sw.bb31.i, %sw.bb33.i, %sw.bb35.i, %sw.bb37.i, %sw.bb39.i, %sw.bb41.i, %sw.bb43.i, %sw.bb45.i, %sw.bb47.i, %sw.bb49.i, %sw.bb51.i, %sw.bb53.i, %sw.bb55.i, %sw.bb57.i, %sw.bb59.i, %sw.bb61.i, %sw.bb63.i, %sw.bb65.i, %sw.bb67.i, %sw.bb69.i, %sw.bb71.i, %sw.bb73.i, %sw.bb75.i, %sw.bb77.i, %sw.bb79.i, %sw.bb81.i, %sw.bb83.i, %sw.bb85.i, %sw.bb87.i, %sw.bb89.i, %sw.bb91.i, %sw.bb93.i, %sw.bb95.i, %sw.bb97.i, %sw.bb99.i, %sw.bb101.i, %sw.bb103.i, %sw.bb105.i, %sw.bb107.i, %sw.bb109.i, %sw.bb111.i, %sw.bb113.i, %sw.bb115.i, %sw.bb117.i, %sw.bb119.i, %sw.bb121.i, %sw.bb123.i, %sw.bb125.i
  %x.addr.0.i = phi i64 [ -9223372036854775808, %sw.bb125.i ], [ -4611686018427387904, %sw.bb123.i ], [ -2305843009213693952, %sw.bb121.i ], [ -1152921504606846976, %sw.bb119.i ], [ 8646911284551352320, %sw.bb117.i ], [ -4899916394579099648, %sw.bb115.i ], [ -2449958197289549824, %sw.bb113.i ], [ -1224979098644774912, %sw.bb111.i ], [ -612489549322387456, %sw.bb109.i ], [ 8917127262193582080, %sw.bb107.i ], [ -4764808405757984768, %sw.bb105.i ], [ -2382404202878992384, %sw.bb103.i ], [ 8032169935415279616, %sw.bb101.i ], [ 4016084967707639808, %sw.bb99.i ], [ -7215329553000955904, %sw.bb97.i ], [ -3607664776500477952, %sw.bb95.i ], [ -1803832388250238976, %sw.bb93.i ], [ -901916194125119488, %sw.bb91.i ], [ 8772413939792216064, %sw.bb89.i ], [ -4837165066958667776, %sw.bb87.i ], [ 6804789503375441920, %sw.bb85.i ], [ -5820977285167054848, %sw.bb83.i ], [ 6312883394271248384, %sw.bb81.i ], [ -6066930339719151616, %sw.bb79.i ], [ -3033465169859575808, %sw.bb77.i ], [ 7706639451924987904, %sw.bb75.i ], [ 3853319725962493952, %sw.bb73.i ], [ -7296712173873528832, %sw.bb71.i ], [ 5575015949918011392, %sw.bb69.i ], [ 2787507974959005696, %sw.bb67.i ], [ 1393753987479502848, %sw.bb65.i ], [ -8526495043115024384, %sw.bb63.i ], [ -4263247521557512192, %sw.bb61.i ], [ -2131623760778756096, %sw.bb59.i ], [ -1065811880389378048, %sw.bb57.i ], [ 8690466096660086784, %sw.bb55.i ], [ 4345233048330043392, %sw.bb53.i ], [ -7050755512689754112, %sw.bb51.i ], [ -3525377756344877056, %sw.bb49.i ], [ 7460683158682337280, %sw.bb47.i ], [ -5493030457513607168, %sw.bb45.i ], [ 6476856808097972224, %sw.bb43.i ], [ -5984943632805789696, %sw.bb41.i ], [ 6230900220451880960, %sw.bb39.i ], [ 3115450110225940480, %sw.bb37.i ], [ 1557725055112970240, %sw.bb35.i ], [ -8444509509298290688, %sw.bb33.i ], [ 5001117282205630464, %sw.bb31.i ], [ -6722813395751960576, %sw.bb29.i ], [ -3361406697875980288, %sw.bb27.i ], [ 7542668687916785664, %sw.bb25.i ], [ 3771334343958392832, %sw.bb23.i ], [ 1885667171979196416, %sw.bb21.i ], [ -8280538450865177600, %sw.bb19.i ], [ 5083102811422187008, %sw.bb17.i ], [ 2541551405711093504, %sw.bb15.i ], [ -7952596333999229056, %sw.bb13.i ], [ 5247073869855161280, %sw.bb11.i ], [ 2623536934927580640, %sw.bb9.i ], [ 1311768467463790320, %sw.bb7.i ], [ 655884233731895160, %sw.bb5.i ], [ 327942116865947580, %sw.bb3.i ], [ 163971058432973790, %sw.bb1.i ], [ 81985529216486895, %for.body4 ]
  %arrayidx8 = getelementptr inbounds [64 x i64]* @data, i64 0, i64 %indvars.iv
  %3 = load i64* %arrayidx8, align 8, !tbaa !0
  %cmp9 = icmp eq i64 %x.addr.0.i, %3
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp9, label %for.cond2, label %if.then10

if.then10:                                        ; preds = %constant_shift.exit
  tail call void @abort() noreturn nounwind
  unreachable

for.end14:                                        ; preds = %for.cond2
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
