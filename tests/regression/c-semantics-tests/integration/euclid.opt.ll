; ModuleID = '/home/david/src/c-semantics/tests/integration/euclid.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @euclidean_gcd(i32 %a, i32 %b) nounwind uwtable {
entry:
  %cmp = icmp sgt i32 %b, %a
  %a.b = select i1 %cmp, i32 %a, i32 %b
  %b.a = select i1 %cmp, i32 %b, i32 %a
  %cmp12 = icmp eq i32 %a.b, 0
  br i1 %cmp12, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %a.addr.04 = phi i32 [ %b.addr.03, %while.body ], [ %b.a, %entry ]
  %b.addr.03 = phi i32 [ %rem, %while.body ], [ %a.b, %entry ]
  %putchar = tail call i32 @putchar(i32 46) nounwind
  %rem = srem i32 %a.addr.04, %b.addr.03
  %cmp1 = icmp eq i32 %rem, 0
  br i1 %cmp1, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  %a.addr.0.lcssa = phi i32 [ %b.a, %entry ], [ %b.addr.03, %while.body ]
  ret i32 %a.addr.0.lcssa
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %entry
  %a.addr.04.i = phi i32 [ %b.addr.03.i, %while.body.i ], [ 105537739, %entry ]
  %b.addr.03.i = phi i32 [ %rem.i, %while.body.i ], [ 78401179, %entry ]
  %putchar.i = tail call i32 @putchar(i32 46) nounwind
  %rem.i = srem i32 %a.addr.04.i, %b.addr.03.i
  %cmp1.i = icmp eq i32 %rem.i, 0
  br i1 %cmp1.i, label %euclidean_gcd.exit, label %while.body.i

euclidean_gcd.exit:                               ; preds = %while.body.i
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %b.addr.03.i) nounwind
  ret i32 0
}

declare i32 @putchar(i32)
