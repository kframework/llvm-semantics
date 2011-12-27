; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/lshrdi-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@zext = internal unnamed_addr constant [64 x i64] [i64 -8690466092652643696, i64 4878138990528453960, i64 2439069495264226980, i64 1219534747632113490, i64 609767373816056745, i64 304883686908028372, i64 152441843454014186, i64 76220921727007093, i64 38110460863503546, i64 19055230431751773, i64 9527615215875886, i64 4763807607937943, i64 2381903803968971, i64 1190951901984485, i64 595475950992242, i64 297737975496121, i64 148868987748060, i64 74434493874030, i64 37217246937015, i64 18608623468507, i64 9304311734253, i64 4652155867126, i64 2326077933563, i64 1163038966781, i64 581519483390, i64 290759741695, i64 145379870847, i64 72689935423, i64 36344967711, i64 18172483855, i64 9086241927, i64 4543120963, i64 2271560481, i64 1135780240, i64 567890120, i64 283945060, i64 141972530, i64 70986265, i64 35493132, i64 17746566, i64 8873283, i64 4436641, i64 2218320, i64 1109160, i64 554580, i64 277290, i64 138645, i64 69322, i64 34661, i64 17330, i64 8665, i64 4332, i64 2166, i64 1083, i64 541, i64 270, i64 135, i64 67, i64 33, i64 16, i64 8, i64 4, i64 2, i64 1], align 16

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %sh_prom.i = phi i64 [ %indvar.next3, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %sh_prom.i to i32
  %cmp = icmp slt i32 %storemerge, 64
  br i1 %cmp, label %for.body, label %for.cond9

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr [64 x i64]* @zext, i64 0, i64 %sh_prom.i
  %shr.i = lshr i64 -8690466092652643696, %sh_prom.i
  %tmp6 = load i64* %arrayidx, align 8
  %cmp7 = icmp eq i64 %shr.i, %tmp6
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
  %arrayidx21 = getelementptr [64 x i64]* @zext, i64 0, i64 %indvar
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
  %tmp1911.i = phi i64 [ -8690466092652643696, %for.body12 ], [ 1, %sw.bb188.i ], [ 2, %sw.bb185.i ], [ 4, %sw.bb182.i ], [ 8, %sw.bb179.i ], [ 16, %sw.bb176.i ], [ 33, %sw.bb173.i ], [ 67, %sw.bb170.i ], [ 135, %sw.bb167.i ], [ 270, %sw.bb164.i ], [ 541, %sw.bb161.i ], [ 1083, %sw.bb158.i ], [ 2166, %sw.bb155.i ], [ 4332, %sw.bb152.i ], [ 8665, %sw.bb149.i ], [ 17330, %sw.bb146.i ], [ 34661, %sw.bb143.i ], [ 69322, %sw.bb140.i ], [ 138645, %sw.bb137.i ], [ 277290, %sw.bb134.i ], [ 554580, %sw.bb131.i ], [ 1109160, %sw.bb128.i ], [ 2218320, %sw.bb125.i ], [ 4436641, %sw.bb122.i ], [ 8873283, %sw.bb119.i ], [ 17746566, %sw.bb116.i ], [ 35493132, %sw.bb113.i ], [ 70986265, %sw.bb110.i ], [ 141972530, %sw.bb107.i ], [ 283945060, %sw.bb104.i ], [ 567890120, %sw.bb101.i ], [ 1135780240, %sw.bb98.i ], [ 2271560481, %sw.bb95.i ], [ 4543120963, %sw.bb92.i ], [ 9086241927, %sw.bb89.i ], [ 18172483855, %sw.bb86.i ], [ 36344967711, %sw.bb83.i ], [ 72689935423, %sw.bb80.i ], [ 145379870847, %sw.bb77.i ], [ 290759741695, %sw.bb74.i ], [ 581519483390, %sw.bb71.i ], [ 1163038966781, %sw.bb68.i ], [ 2326077933563, %sw.bb65.i ], [ 4652155867126, %sw.bb62.i ], [ 9304311734253, %sw.bb59.i ], [ 18608623468507, %sw.bb56.i ], [ 37217246937015, %sw.bb53.i ], [ 74434493874030, %sw.bb50.i ], [ 148868987748060, %sw.bb47.i ], [ 297737975496121, %sw.bb44.i ], [ 595475950992242, %sw.bb41.i ], [ 1190951901984485, %sw.bb38.i ], [ 2381903803968971, %sw.bb35.i ], [ 4763807607937943, %sw.bb32.i ], [ 9527615215875886, %sw.bb29.i ], [ 19055230431751773, %sw.bb26.i ], [ 38110460863503546, %sw.bb23.i ], [ 76220921727007093, %sw.bb20.i ], [ 152441843454014186, %sw.bb17.i ], [ 304883686908028372, %sw.bb14.i ], [ 609767373816056745, %sw.bb11.i ], [ 1219534747632113490, %sw.bb8.i ], [ 2439069495264226980, %sw.bb5.i ], [ 4878138990528453960, %sw.bb2.i ]
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
