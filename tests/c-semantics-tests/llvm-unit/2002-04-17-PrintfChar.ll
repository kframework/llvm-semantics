; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-04-17-PrintfChar.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"'%c' '%c'\0A\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"e\00", align 1

define void @printArgsNoRet(i8 signext %a3, i8* %a5) nounwind uwtable {
entry:
  %a3.addr = alloca i8, align 1
  %a5.addr = alloca i8*, align 8
  store i8 %a3, i8* %a3.addr, align 1
  store i8* %a5, i8** %a5.addr, align 8
  %0 = load i8* %a3.addr, align 1
  %conv = sext i8 %0 to i32
  %1 = load i8** %a5.addr, align 8
  %2 = load i8* %1, align 1
  %conv1 = sext i8 %2 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %conv1)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @printArgsNoRet(i8 signext 99, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  ret i32 0
}
