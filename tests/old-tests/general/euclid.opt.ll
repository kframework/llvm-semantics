; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/euclid.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @euclidean_gcd(i32 %a, i32 %b) nounwind uwtable {
entry:
  %cmp = icmp sgt i32 %b, %a
  %rem2.ph = select i1 %cmp, i32 %a, i32 %b
  %tmp131.ph = select i1 %cmp, i32 %b, i32 %a
  %cmp73 = icmp eq i32 %rem2.ph, 0
  br i1 %cmp73, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %tmp1315 = phi i32 [ %rem24, %while.body ], [ %tmp131.ph, %entry ]
  %rem24 = phi i32 [ %rem, %while.body ], [ %rem2.ph, %entry ]
  %putchar = tail call i32 @putchar(i32 46) nounwind
  %rem = srem i32 %tmp1315, %rem24
  %cmp7 = icmp eq i32 %rem, 0
  br i1 %cmp7, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  %tmp131.lcssa = phi i32 [ %tmp131.ph, %entry ], [ %rem24, %while.body ]
  ret i32 %tmp131.lcssa
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %entry
  %tmp1315.i = phi i32 [ %rem24.i, %while.body.i ], [ 105537739, %entry ]
  %rem24.i = phi i32 [ %rem.i, %while.body.i ], [ 78401179, %entry ]
  %putchar.i = tail call i32 @putchar(i32 46) nounwind
  %rem.i = srem i32 %tmp1315.i, %rem24.i
  %cmp7.i = icmp eq i32 %rem.i, 0
  br i1 %cmp7.i, label %euclidean_gcd.exit, label %while.body.i

euclidean_gcd.exit:                               ; preds = %while.body.i
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %rem24.i) nounwind
  ret i32 0
}

declare i32 @putchar(i32)
