; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930628-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(double* %x, double* %y) nounwind uwtable {
entry:
  %cmp = icmp eq double* %x, %y
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  %bdm = alloca [4 x [2 x [4 x [2 x float]]]], align 16
  br label %for.cond

for.cond:                                         ; preds = %for.inc58, %entry
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %for.inc58 ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv87 to i32
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.cond1.preheader, label %for.end60

for.cond1.preheader:                              ; preds = %for.cond
  %arraydecay.idx = shl nsw i64 %indvars.iv87, 6
  br label %for.cond1

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc55
  %indvars.iv85 = phi i64 [ %indvars.iv87, %for.cond1.preheader ], [ %indvars.iv.next86, %for.inc55 ]
  %1 = trunc i64 %indvars.iv85 to i32
  %cmp2 = icmp slt i32 %1, 4
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc58

for.cond4.preheader:                              ; preds = %for.cond1
  %cmp10 = icmp eq i32 %1, %0
  %arraydecay37.idx = shl nsw i64 %indvars.iv85, 6
  br label %for.cond4

for.cond4:                                        ; preds = %for.cond4.preheader, %for.inc52
  %indvars.iv81 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next82, %for.inc52 ]
  %2 = trunc i64 %indvars.iv81 to i32
  %cmp5 = icmp slt i32 %2, 2
  br i1 %cmp5, label %for.cond7.preheader, label %for.inc55

for.cond7.preheader:                              ; preds = %for.cond4
  %arraydecay.idx61 = shl nsw i64 %indvars.iv81, 5
  %arraydecay.offs62 = add i64 %arraydecay.idx61, %arraydecay.idx
  %arraydecay.offs63 = or i64 %arraydecay.offs62, 16
  br i1 %cmp10, label %for.cond7.us, label %for.cond7

for.cond7.us:                                     ; preds = %for.cond7.preheader, %for.inc49.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %for.inc49.us ], [ 0, %for.cond7.preheader ]
  %3 = trunc i64 %indvars.iv73 to i32
  %cmp8.us = icmp slt i32 %3, 2
  br i1 %cmp8.us, label %for.body9.us, label %for.inc52

for.inc49.us:                                     ; preds = %if.then.us, %for.end40.us
  %indvars.iv.next74 = add i64 %indvars.iv73, 1
  br label %for.cond7.us

for.end40.us:                                     ; preds = %for.cond18.us
  %arrayidx48.us = getelementptr inbounds [4 x [2 x [4 x [2 x float]]]]* %bdm, i64 0, i64 %indvars.iv87, i64 %indvars.iv81, i64 %indvars.iv85, i64 %indvars.iv73
  store float 1.000000e+03, float* %arrayidx48.us, align 4, !tbaa !0
  br label %for.inc49.us

for.cond18.us:                                    ; preds = %for.cond18.preheader.us, %for.inc38.us
  %indvars.iv71 = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next72, %for.inc38.us ]
  %4 = trunc i64 %indvars.iv71 to i32
  %cmp19.us = icmp slt i32 %4, 1
  br i1 %cmp19.us, label %for.cond21.preheader.us, label %for.end40.us

for.inc38.us:                                     ; preds = %for.cond21.us
  %indvars.iv.next72 = add i64 %indvars.iv71, 1
  br label %for.cond18.us

for.cond21.us:                                    ; preds = %for.cond21.preheader.us, %for.body23.us
  %indvars.iv = phi i64 [ 0, %for.cond21.preheader.us ], [ %indvars.iv.next, %for.body23.us ]
  %5 = trunc i64 %indvars.iv to i32
  %cmp22.us = icmp slt i32 %5, 1
  br i1 %cmp22.us, label %for.body23.us, label %for.inc38.us

for.body23.us:                                    ; preds = %for.cond21.us
  %arraydecay37.idx69.us = shl nsw i64 %indvars.iv, 4
  %arraydecay37.offs70.us = add i64 %arraydecay37.idx69.us, %arraydecay37.offs68.us
  %cmp.i.us = icmp eq i64 %arraydecay.offs65.us, %arraydecay37.offs70.us
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp.i.us, label %if.then.i, label %for.cond21.us

for.body9.us:                                     ; preds = %for.cond7.us
  %cmp11.us = icmp eq i32 %2, %3
  br i1 %cmp11.us, label %if.then.us, label %for.cond18.preheader.us

if.then.us:                                       ; preds = %for.body9.us
  %arrayidx17.us = getelementptr inbounds [4 x [2 x [4 x [2 x float]]]]* %bdm, i64 0, i64 %indvars.iv87, i64 %indvars.iv81, i64 %indvars.iv85, i64 %indvars.iv73
  store float 1.000000e+03, float* %arrayidx17.us, align 4, !tbaa !0
  br label %for.inc49.us

for.cond21.preheader.us:                          ; preds = %for.cond18.us
  %arraydecay.idx64.us = shl nsw i64 %indvars.iv71, 4
  %arraydecay.offs65.us = add i64 %arraydecay.idx64.us, %arraydecay.offs63
  br label %for.cond21.us

for.cond18.preheader.us:                          ; preds = %for.body9.us
  %arraydecay37.idx66.us = shl nsw i64 %indvars.iv73, 5
  %arraydecay37.offs67.us = add i64 %arraydecay37.idx66.us, %arraydecay37.idx
  %arraydecay37.offs68.us = or i64 %arraydecay37.offs67.us, 16
  br label %for.cond18.us

for.cond7:                                        ; preds = %for.cond7.preheader, %for.inc49
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %for.inc49 ], [ 0, %for.cond7.preheader ]
  %6 = trunc i64 %indvars.iv79 to i32
  %cmp8 = icmp slt i32 %6, 2
  br i1 %cmp8, label %for.cond18.preheader, label %for.inc52

for.cond18.preheader:                             ; preds = %for.cond7
  %arraydecay37.idx66 = shl nsw i64 %indvars.iv79, 5
  %arraydecay37.offs67 = add i64 %arraydecay37.idx66, %arraydecay37.idx
  %arraydecay37.offs68 = or i64 %arraydecay37.offs67, 16
  br label %for.cond18

for.cond18:                                       ; preds = %for.cond18.preheader, %for.inc38
  %indvars.iv77 = phi i64 [ 0, %for.cond18.preheader ], [ %indvars.iv.next78, %for.inc38 ]
  %7 = trunc i64 %indvars.iv77 to i32
  %cmp19 = icmp slt i32 %7, 1
  br i1 %cmp19, label %for.cond21.preheader, label %for.inc49

for.cond21.preheader:                             ; preds = %for.cond18
  %arraydecay.idx64 = shl nsw i64 %indvars.iv77, 4
  %arraydecay.offs65 = add i64 %arraydecay.idx64, %arraydecay.offs63
  br label %for.cond21

for.cond21:                                       ; preds = %for.body23, %for.cond21.preheader
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.body23 ], [ 0, %for.cond21.preheader ]
  %8 = trunc i64 %indvars.iv75 to i32
  %cmp22 = icmp slt i32 %8, 1
  br i1 %cmp22, label %for.body23, label %for.inc38

for.body23:                                       ; preds = %for.cond21
  %arraydecay37.idx69 = shl nsw i64 %indvars.iv75, 4
  %arraydecay37.offs70 = add i64 %arraydecay37.idx69, %arraydecay37.offs68
  %cmp.i = icmp eq i64 %arraydecay.offs65, %arraydecay37.offs70
  %indvars.iv.next76 = add i64 %indvars.iv75, 1
  br i1 %cmp.i, label %if.then.i, label %for.cond21

if.then.i:                                        ; preds = %for.body23, %for.body23.us
  call void @abort() noreturn nounwind
  unreachable

for.inc38:                                        ; preds = %for.cond21
  %indvars.iv.next78 = add i64 %indvars.iv77, 1
  br label %for.cond18

for.inc49:                                        ; preds = %for.cond18
  %arrayidx48 = getelementptr inbounds [4 x [2 x [4 x [2 x float]]]]* %bdm, i64 0, i64 %indvars.iv87, i64 %indvars.iv81, i64 %indvars.iv85, i64 %indvars.iv79
  store float 1.000000e+03, float* %arrayidx48, align 4, !tbaa !0
  %indvars.iv.next80 = add i64 %indvars.iv79, 1
  br label %for.cond7

for.inc52:                                        ; preds = %for.cond7, %for.cond7.us
  %indvars.iv.next82 = add i64 %indvars.iv81, 1
  br label %for.cond4

for.inc55:                                        ; preds = %for.cond4
  %indvars.iv.next86 = add i64 %indvars.iv85, 1
  br label %for.cond1

for.inc58:                                        ; preds = %for.cond1
  %indvars.iv.next88 = add i64 %indvars.iv87, 1
  br label %for.cond

for.end60:                                        ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"float", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
