; ModuleID = '/home/david/src/c-semantics/tests/unitTests/passUnionWithBitfield.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u1 = global { i8, i8, [2 x i8] } { i8 123, i8 0, [2 x i8] undef }, align 4
@u2 = global { i8, i8, [2 x i8] } { i8 123, i8 0, [2 x i8] undef }, align 4
@u3 = global { i8, i8, [2 x i8] } { i8 123, i8 0, [2 x i8] undef }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @f1(i32 %u.coerce) nounwind uwtable readnone {
entry:
  ret i32 %u.coerce
}

define i32 @f2(i32 %u.coerce) nounwind uwtable readnone {
entry:
  ret i32 %u.coerce
}

define i32 @f3(i32 %u.coerce) nounwind uwtable readnone {
entry:
  ret i32 %u.coerce
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* bitcast ({ i8, i8, [2 x i8] }* @u1 to i32*), align 4
  %1 = shl i32 %0, 19
  %bf.val.sext = ashr exact i32 %1, 19
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %bf.val.sext) nounwind
  %2 = load i32* bitcast ({ i8, i8, [2 x i8] }* @u2 to i32*), align 4
  %3 = shl i32 %2, 19
  %bf.val.sext5 = ashr exact i32 %3, 19
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %bf.val.sext5) nounwind
  %4 = load i32* bitcast ({ i8, i8, [2 x i8] }* @u3 to i32*), align 4
  %5 = shl i32 %4, 19
  %bf.val.sext10 = ashr exact i32 %5, 19
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %bf.val.sext10) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
