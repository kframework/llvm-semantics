; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-10-12-StructureArgs.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"%d, %d, %d, %d\0A\00", align 1

define void @print(double %S.coerce0, double %S.coerce1, double %T.coerce0, double %T.coerce1) nounwind uwtable {
entry:
  %mul = fmul double %S.coerce0, 1.000000e+04
  %conv = fptosi double %mul to i32
  %mul1 = fmul double %S.coerce1, 1.000000e+04
  %conv2 = fptosi double %mul1 to i32
  %mul4 = fmul double %T.coerce0, 1.000000e+04
  %conv5 = fptosi double %mul4 to i32
  %mul7 = fmul double %T.coerce1, 1.000000e+04
  %conv8 = fptosi double %mul7 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 %conv, i32 %conv2, i32 %conv5, i32 %conv8) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 5000, i32 13000, i32 -1230100, i32 3333) nounwind
  ret i32 0
}
