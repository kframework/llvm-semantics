; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001011-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"main\00", align 1

define i32 @foo(i8* %a) nounwind uwtable {
entry:
  %a.addr = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  %0 = load i8** %a.addr, align 8
  %call = call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0))
  ret i32 %call
}

declare i32 @strcmp(i8*, i8*)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
