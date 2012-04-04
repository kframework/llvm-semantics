; ModuleID = '/home/david/src/c-semantics/tests/unitTests/negativeBitfield.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i8, i8, i8, i8, [2 x i8], [2 x i8] }

@s = common global %struct.anon zeroinitializer, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %1 = and i32 %0, -16
  %2 = or i32 %1, 6
  store i32 %2, i32* bitcast (%struct.anon* @s to i32*), align 4
  %3 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %4 = and i32 %3, -241
  %5 = or i32 %4, 128
  store i32 %5, i32* bitcast (%struct.anon* @s to i32*), align 4
  %6 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %7 = and i32 %6, -257
  %8 = or i32 %7, 256
  store i32 %8, i32* bitcast (%struct.anon* @s to i32*), align 4
  %9 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %10 = and i32 %9, -1537
  %11 = or i32 %10, 512
  store i32 %11, i32* bitcast (%struct.anon* @s to i32*), align 4
  %12 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %13 = and i32 %12, -6145
  %14 = or i32 %13, 4096
  store i32 %14, i32* bitcast (%struct.anon* @s to i32*), align 4
  %15 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %16 = and i32 %15, -8380417
  %17 = or i32 %16, 2555904
  store i32 %17, i32* bitcast (%struct.anon* @s to i32*), align 4
  %18 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.anon* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %19 = and i32 %18, -1024
  %20 = or i32 %19, 619
  store i32 %20, i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.anon* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %21 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %bf.clear = and i32 %21, 15
  %22 = shl i32 %bf.clear, 28
  %bf.val.sext = ashr i32 %22, 28
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.val.sext)
  %23 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %24 = lshr i32 %23, 4
  %bf.clear1 = and i32 %24, 15
  %25 = shl i32 %bf.clear1, 28
  %bf.val.sext2 = ashr i32 %25, 28
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.val.sext2)
  %26 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %27 = lshr i32 %26, 8
  %bf.clear4 = and i32 %27, 1
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.clear4)
  %28 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %29 = lshr i32 %28, 9
  %bf.clear6 = and i32 %29, 3
  %30 = shl i32 %bf.clear6, 30
  %bf.val.sext7 = ashr i32 %30, 30
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.val.sext7)
  %31 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %32 = lshr i32 %31, 11
  %bf.clear9 = and i32 %32, 3
  %33 = shl i32 %bf.clear9, 30
  %bf.val.sext10 = ashr i32 %33, 30
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.val.sext10)
  %34 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %35 = lshr i32 %34, 13
  %bf.clear12 = and i32 %35, 1023
  %36 = shl i32 %bf.clear12, 22
  %bf.val.sext13 = ashr i32 %36, 22
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.val.sext13)
  %37 = load i32* bitcast (i8* getelementptr (i8* getelementptr inbounds (%struct.anon* @s, i32 0, i32 0), i32 4) to i32*), align 4
  %bf.clear15 = and i32 %37, 1023
  %38 = shl i32 %bf.clear15, 22
  %bf.val.sext16 = ashr i32 %38, 22
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.val.sext16)
  ret i32 0
}

declare i32 @printf(i8*, ...)
