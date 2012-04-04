; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2006-01-29-SimpleIndirectCall.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Hello, world!\0A\00", align 1
@.str1 = private unnamed_addr constant [17 x i8] c"Goodbye, world!\0A\00", align 1

define void @hello() nounwind uwtable {
entry:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...)

define void @goodbye() nounwind uwtable {
entry:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0))
  ret void
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %f = alloca void (...)*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %0, 1
  %cond = select i1 %cmp, void (...)* bitcast (void ()* @hello to void (...)*), void (...)* bitcast (void ()* @goodbye to void (...)*)
  store void (...)* %cond, void (...)** %f, align 8
  %1 = load void (...)** %f, align 8
  call void (...)* %1()
  ret i32 0
}
