; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/2003-05-22-VarSizeArray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @test(i32 %Num) nounwind uwtable {
entry:
  %Num.addr = alloca i32, align 4
  %saved_stack = alloca i8*
  %cleanup.dest.slot = alloca i32
  store i32 %Num, i32* %Num.addr, align 4
  %0 = load i32* %Num.addr, align 4
  %1 = zext i32 %0 to i64
  %2 = call i8* @llvm.stacksave()
  store i8* %2, i8** %saved_stack
  %vla = alloca i32, i64 %1, align 16
  %arrayidx = getelementptr inbounds i32* %vla, i64 2
  store i32 0, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i32* %vla, i64 2
  %3 = load i32* %arrayidx1, align 4
  store i32 1, i32* %cleanup.dest.slot
  %4 = load i8** %saved_stack
  call void @llvm.stackrestore(i8* %4)
  ret i32 %3
}

declare i8* @llvm.stacksave() nounwind

declare void @llvm.stackrestore(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test(i32 4)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call)
  ret i32 0
}

declare i32 @printf(i8*, ...)
