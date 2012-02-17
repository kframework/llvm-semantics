; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/basicBitfields.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i8, i32 }

@s = common global %struct.anon zeroinitializer, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 7, i32* getelementptr inbounds (%struct.anon* @s, i32 0, i32 1), align 4
  %0 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %1 = and i32 %0, -7
  %2 = or i32 %1, 4
  store i32 %2, i32* bitcast (%struct.anon* @s to i32*), align 4
  %3 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %4 = and i32 %3, -2
  %5 = or i32 %4, 1
  store i32 %5, i32* bitcast (%struct.anon* @s to i32*), align 4
  %6 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %7 = and i32 %6, -57
  %8 = or i32 %7, 24
  store i32 %8, i32* bitcast (%struct.anon* @s to i32*), align 4
  %9 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %10 = lshr i32 %9, 1
  %bf.clear = and i32 %10, 3
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.clear)
  %11 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %bf.clear1 = and i32 %11, 1
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.clear1)
  %12 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %13 = lshr i32 %12, 3
  %bf.clear3 = and i32 %13, 7
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.clear3)
  %tmp = load i32* getelementptr inbounds (%struct.anon* @s, i32 0, i32 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  ret i32 0
}

declare i32 @printf(i8*, ...)
