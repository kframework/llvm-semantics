; ModuleID = 'tls.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.pthread_attr_t = type { i32, [32 x i8] }

@i.2509 = internal thread_local global i32 1      ; <i32*> [#uses=2]
@.str = private constant [14 x i8] c"Thread 1: %d\0A\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str1 = private constant [14 x i8] c"Thread 2: %d\0A\00", align 1 ; <[14 x i8]*> [#uses=1]

define internal i8* @f(i8* nocapture %a) nounwind {
entry:
  %0 = load i32* @i.2509, align 4                 ; <i32> [#uses=1]
  %1 = add nsw i32 %0, 1                          ; <i32> [#uses=2]
  store i32 %1, i32* @i.2509, align 4
  %2 = inttoptr i32 %1 to i8*                     ; <i8*> [#uses=1]
  ret i8* %2
}

define i32 @main() nounwind {
entry:
  %ret = alloca i32, align 4                      ; <i32*> [#uses=3]
  %t = alloca i32, align 4                        ; <i32*> [#uses=4]
  %0 = call i32 @pthread_create(i32* noalias %t, %struct.pthread_attr_t* noalias null, i8* (i8*)* @f, i8* noalias null) nounwind ; <i32> [#uses=0]
  %ret1 = bitcast i32* %ret to i8**               ; <i8**> [#uses=2]
  %1 = load i32* %t, align 4                      ; <i32> [#uses=1]
  %2 = call i32 @pthread_join(i32 %1, i8** %ret1) nounwind ; <i32> [#uses=0]
  %3 = load i32* %ret, align 4                    ; <i32> [#uses=1]
  %4 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0), i32 %3) nounwind ; <i32> [#uses=0]
  %5 = call i32 @pthread_create(i32* noalias %t, %struct.pthread_attr_t* noalias null, i8* (i8*)* @f, i8* noalias null) nounwind ; <i32> [#uses=0]
  %6 = load i32* %t, align 4                      ; <i32> [#uses=1]
  %7 = call i32 @pthread_join(i32 %6, i8** %ret1) nounwind ; <i32> [#uses=0]
  %8 = load i32* %ret, align 4                    ; <i32> [#uses=1]
  %9 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 %8) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @pthread_create(i32* noalias, %struct.pthread_attr_t* noalias, i8* (i8*)*, i8* noalias) nounwind

declare i32 @pthread_join(i32, i8**)

declare i32 @printf(i8* nocapture, ...) nounwind
