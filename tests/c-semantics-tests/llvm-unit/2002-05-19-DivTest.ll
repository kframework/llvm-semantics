; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-05-19-DivTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define void @testL(i64 %Arg) nounwind uwtable {
entry:
  %Arg.addr = alloca i64, align 8
  store i64 %Arg, i64* %Arg.addr, align 8
  %0 = load i64* %Arg.addr, align 8
  %div = sdiv i64 %0, 16
  %conv = trunc i64 %div to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %1 = load i64* %Arg.addr, align 8
  %div1 = sdiv i64 %1, 70368744177664
  %conv2 = trunc i64 %div1 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv2)
  ret void
}

declare i32 @printf(i8*, ...)

define void @test(i32 %Arg) nounwind uwtable {
entry:
  %Arg.addr = alloca i32, align 4
  store i32 %Arg, i32* %Arg.addr, align 4
  %0 = load i32* %Arg.addr, align 4
  %div = sdiv i32 %0, 1
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %div)
  %1 = load i32* %Arg.addr, align 4
  %div1 = sdiv i32 %1, 16
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %div1)
  %2 = load i32* %Arg.addr, align 4
  %div3 = sdiv i32 %2, 262144
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %div3)
  %3 = load i32* %Arg.addr, align 4
  %div5 = sdiv i32 %3, 1073741824
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %div5)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %B20 = alloca i32, align 4
  %B53 = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 -1048576, i32* %B20, align 4
  store i64 -9007199254740992, i64* %B53, align 8
  %0 = load i32* %B20, align 4
  %add = add nsw i32 %0, 32
  call void @test(i32 %add)
  %1 = load i32* %B20, align 4
  %add1 = add nsw i32 %1, 33
  call void @test(i32 %add1)
  %2 = load i64* %B53, align 8
  %add2 = add nsw i64 %2, 64
  call void @testL(i64 %add2)
  %3 = load i64* %B53, align 8
  %add3 = add nsw i64 %3, 65
  call void @testL(i64 %add3)
  ret i32 0
}
