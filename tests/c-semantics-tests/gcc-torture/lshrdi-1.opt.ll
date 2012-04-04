; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/lshrdi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@zext = internal unnamed_addr constant [64 x i64] [i64 -8690466092652643696, i64 4878138990528453960, i64 2439069495264226980, i64 1219534747632113490, i64 609767373816056745, i64 304883686908028372, i64 152441843454014186, i64 76220921727007093, i64 38110460863503546, i64 19055230431751773, i64 9527615215875886, i64 4763807607937943, i64 2381903803968971, i64 1190951901984485, i64 595475950992242, i64 297737975496121, i64 148868987748060, i64 74434493874030, i64 37217246937015, i64 18608623468507, i64 9304311734253, i64 4652155867126, i64 2326077933563, i64 1163038966781, i64 581519483390, i64 290759741695, i64 145379870847, i64 72689935423, i64 36344967711, i64 18172483855, i64 9086241927, i64 4543120963, i64 2271560481, i64 1135780240, i64 567890120, i64 283945060, i64 141972530, i64 70986265, i64 35493132, i64 17746566, i64 8873283, i64 4436641, i64 2218320, i64 1109160, i64 554580, i64 277290, i64 138645, i64 69322, i64 34661, i64 17330, i64 8665, i64 4332, i64 2166, i64 1083, i64 541, i64 270, i64 135, i64 67, i64 33, i64 16, i64 8, i64 4, i64 2, i64 1], align 16

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
  %shr.i = lshr i64 -8690466092652643696, %sh_prom.i
  %arrayidx = getelementptr inbounds [64 x i64]* @zext, i64 0, i64 %indvars.iv15
  %1 = load i64* %arrayidx, align 8, !tbaa !0
  %cmp1 = icmp eq i64 %shr.i, %1
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
  %x.addr.0.i = phi i64 [ 1, %sw.bb125.i ], [ 2, %sw.bb123.i ], [ 4, %sw.bb121.i ], [ 8, %sw.bb119.i ], [ 16, %sw.bb117.i ], [ 33, %sw.bb115.i ], [ 67, %sw.bb113.i ], [ 135, %sw.bb111.i ], [ 270, %sw.bb109.i ], [ 541, %sw.bb107.i ], [ 1083, %sw.bb105.i ], [ 2166, %sw.bb103.i ], [ 4332, %sw.bb101.i ], [ 8665, %sw.bb99.i ], [ 17330, %sw.bb97.i ], [ 34661, %sw.bb95.i ], [ 69322, %sw.bb93.i ], [ 138645, %sw.bb91.i ], [ 277290, %sw.bb89.i ], [ 554580, %sw.bb87.i ], [ 1109160, %sw.bb85.i ], [ 2218320, %sw.bb83.i ], [ 4436641, %sw.bb81.i ], [ 8873283, %sw.bb79.i ], [ 17746566, %sw.bb77.i ], [ 35493132, %sw.bb75.i ], [ 70986265, %sw.bb73.i ], [ 141972530, %sw.bb71.i ], [ 283945060, %sw.bb69.i ], [ 567890120, %sw.bb67.i ], [ 1135780240, %sw.bb65.i ], [ 2271560481, %sw.bb63.i ], [ 4543120963, %sw.bb61.i ], [ 9086241927, %sw.bb59.i ], [ 18172483855, %sw.bb57.i ], [ 36344967711, %sw.bb55.i ], [ 72689935423, %sw.bb53.i ], [ 145379870847, %sw.bb51.i ], [ 290759741695, %sw.bb49.i ], [ 581519483390, %sw.bb47.i ], [ 1163038966781, %sw.bb45.i ], [ 2326077933563, %sw.bb43.i ], [ 4652155867126, %sw.bb41.i ], [ 9304311734253, %sw.bb39.i ], [ 18608623468507, %sw.bb37.i ], [ 37217246937015, %sw.bb35.i ], [ 74434493874030, %sw.bb33.i ], [ 148868987748060, %sw.bb31.i ], [ 297737975496121, %sw.bb29.i ], [ 595475950992242, %sw.bb27.i ], [ 1190951901984485, %sw.bb25.i ], [ 2381903803968971, %sw.bb23.i ], [ 4763807607937943, %sw.bb21.i ], [ 9527615215875886, %sw.bb19.i ], [ 19055230431751773, %sw.bb17.i ], [ 38110460863503546, %sw.bb15.i ], [ 76220921727007093, %sw.bb13.i ], [ 152441843454014186, %sw.bb11.i ], [ 304883686908028372, %sw.bb9.i ], [ 609767373816056745, %sw.bb7.i ], [ 1219534747632113490, %sw.bb5.i ], [ 2439069495264226980, %sw.bb3.i ], [ 4878138990528453960, %sw.bb1.i ], [ -8690466092652643696, %for.body4 ]
  %arrayidx8 = getelementptr inbounds [64 x i64]* @zext, i64 0, i64 %indvars.iv
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
