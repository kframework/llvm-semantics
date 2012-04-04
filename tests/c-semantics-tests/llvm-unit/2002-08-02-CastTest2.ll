; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-08-02-CastTest2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"s1   = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"us2  = %u\0A\00", align 1

define void @test(i16 signext %s1) nounwind uwtable {
entry:
  %s1.addr = alloca i16, align 2
  %us2 = alloca i16, align 2
  store i16 %s1, i16* %s1.addr, align 2
  %0 = load i16* %s1.addr, align 2
  store i16 %0, i16* %us2, align 2
  %1 = load i16* %s1.addr, align 2
  %conv = sext i16 %1 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %2 = load i16* %us2, align 2
  %conv1 = zext i16 %2 to i32
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %conv1)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test(i16 signext -769)
  ret i32 0
}
