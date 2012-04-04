; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-07-08-BitOpsTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"%d %d %d %d %d\0A\00", align 1

define void @test(i32 %A, i32 %B, i32 %C, i32 %D) nounwind uwtable {
entry:
  %A.addr = alloca i32, align 4
  %B.addr = alloca i32, align 4
  %C.addr = alloca i32, align 4
  %D.addr = alloca i32, align 4
  %bxor = alloca i32, align 4
  %bor = alloca i32, align 4
  %band = alloca i32, align 4
  %bandnot = alloca i32, align 4
  %bornot = alloca i32, align 4
  store i32 %A, i32* %A.addr, align 4
  store i32 %B, i32* %B.addr, align 4
  store i32 %C, i32* %C.addr, align 4
  store i32 %D, i32* %D.addr, align 4
  %0 = load i32* %A.addr, align 4
  %1 = load i32* %B.addr, align 4
  %xor = xor i32 %0, %1
  %2 = load i32* %C.addr, align 4
  %xor1 = xor i32 %xor, %2
  %3 = load i32* %D.addr, align 4
  %xor2 = xor i32 %xor1, %3
  store i32 %xor2, i32* %bxor, align 4
  %4 = load i32* %A.addr, align 4
  %5 = load i32* %B.addr, align 4
  %or = or i32 %4, %5
  %6 = load i32* %C.addr, align 4
  %or3 = or i32 %or, %6
  %7 = load i32* %D.addr, align 4
  %or4 = or i32 %or3, %7
  store i32 %or4, i32* %bor, align 4
  %8 = load i32* %A.addr, align 4
  %9 = load i32* %B.addr, align 4
  %and = and i32 %8, %9
  %10 = load i32* %C.addr, align 4
  %and5 = and i32 %and, %10
  %11 = load i32* %D.addr, align 4
  %and6 = and i32 %and5, %11
  store i32 %and6, i32* %band, align 4
  %12 = load i32* %A.addr, align 4
  %13 = load i32* %B.addr, align 4
  %neg = xor i32 %13, -1
  %and7 = and i32 %12, %neg
  %14 = load i32* %C.addr, align 4
  %15 = load i32* %D.addr, align 4
  %neg8 = xor i32 %15, -1
  %and9 = and i32 %14, %neg8
  %xor10 = xor i32 %and7, %and9
  store i32 %xor10, i32* %bandnot, align 4
  %16 = load i32* %A.addr, align 4
  %17 = load i32* %B.addr, align 4
  %neg11 = xor i32 %17, -1
  %or12 = or i32 %16, %neg11
  %18 = load i32* %C.addr, align 4
  %19 = load i32* %D.addr, align 4
  %neg13 = xor i32 %19, -1
  %or14 = or i32 %18, %neg13
  %xor15 = xor i32 %or12, %or14
  store i32 %xor15, i32* %bornot, align 4
  %20 = load i32* %bxor, align 4
  %21 = load i32* %bor, align 4
  %22 = load i32* %band, align 4
  %23 = load i32* %bandnot, align 4
  %24 = load i32* %bornot, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 %20, i32 %21, i32 %22, i32 %23, i32 %24)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test(i32 7, i32 8, i32 -5, i32 5)
  ret i32 0
}
