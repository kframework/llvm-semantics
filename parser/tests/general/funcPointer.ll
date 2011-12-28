; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/funcPointer.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [20 x i8] c"\22%s!!!\22 you shout.\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"\22%s\22 you whisper.\0A\00", align 1
@say = global void (i8*)* null, align 8
@.str2 = private unnamed_addr constant [5 x i8] c"WHAT\00", align 1
@.str3 = private unnamed_addr constant [17 x i8] c"I know a secret!\00", align 1

define void @say_loud(i8* %a_message) nounwind uwtable {
entry:
  %a_message.addr = alloca i8*, align 8
  store i8* %a_message, i8** %a_message.addr, align 8
  %tmp = load i8** %a_message.addr, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i8* %tmp)
  ret void
}

declare i32 @printf(i8*, ...)

define void @say_soft(i8* %a_message) nounwind uwtable {
entry:
  %a_message.addr = alloca i8*, align 8
  store i8* %a_message, i8** %a_message.addr, align 8
  %tmp = load i8** %a_message.addr, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i8* %tmp)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store void (i8*)* @say_loud, void (i8*)** @say, align 8
  %tmp = load void (i8*)** @say, align 8
  call void %tmp(i8* getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0))
  store void (i8*)* @say_soft, void (i8*)** @say, align 8
  %tmp1 = load void (i8*)** @say, align 8
  call void %tmp1(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0))
  ret i32 0
}
