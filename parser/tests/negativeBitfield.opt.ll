; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/negativeBitfield.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i8, i8, i8, i8, [2 x i8], [2 x i8] }

@s = common global %struct.anon zeroinitializer, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %1 = and i32 %0, -8388608
  %2 = or i32 %1, 2560902
  store i32 %2, i32* bitcast (%struct.anon* @s to i32*), align 4
  %3 = load i32* bitcast (i8* getelementptr inbounds (%struct.anon* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %4 = and i32 %3, -1024
  %5 = or i32 %4, 619
  store i32 %5, i32* bitcast (i8* getelementptr inbounds (%struct.anon* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 6) nounwind
  %6 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %7 = shl i32 %6, 24
  %bf.val.sext2 = ashr i32 %7, 28
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %bf.val.sext2) nounwind
  %8 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %9 = lshr i32 %8, 8
  %bf.clear4 = and i32 %9, 1
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %bf.clear4) nounwind
  %10 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %11 = shl i32 %10, 21
  %bf.val.sext7 = ashr i32 %11, 30
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %bf.val.sext7) nounwind
  %12 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %13 = shl i32 %12, 19
  %bf.val.sext10 = ashr i32 %13, 30
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %bf.val.sext10) nounwind
  %14 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %15 = shl i32 %14, 9
  %bf.val.sext13 = ashr i32 %15, 22
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %bf.val.sext13) nounwind
  %16 = load i32* bitcast (i8* getelementptr inbounds (%struct.anon* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %17 = shl i32 %16, 22
  %bf.val.sext16 = ashr exact i32 %17, 22
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %bf.val.sext16) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
