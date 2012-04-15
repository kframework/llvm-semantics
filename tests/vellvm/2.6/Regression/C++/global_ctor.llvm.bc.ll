; ModuleID = 'global_ctor.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct.bar = type <{ i8 }>
%struct.foo = type { i32 }

@CN = internal global i32 0                       ; <i32*> [#uses=4]
@.str = private constant [16 x i8] c"Foo ctor %d %d\0A\00", align 1 ; <[16 x i8]*> [#uses=1]
@Constructor1.0.b = internal global i1 false      ; <i1*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@Constructor2.0.b = internal global i1 false      ; <i1*> [#uses=2]
@DN = internal global i32 0                       ; <i32*> [#uses=4]
@.str1 = private constant [16 x i8] c"Foo dtor %d %d\0A\00", align 1 ; <[16 x i8]*> [#uses=1]
@.str2 = private constant [9 x i8] c"bar dtor\00", align 1 ; <[9 x i8]*> [#uses=1]
@.str3 = private constant [5 x i8] c"main\00", align 1 ; <[5 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [1 x %0] [%0 { i32 65535, void ()* @_GLOBAL__I_CN }] ; <[1 x %0]*> [#uses=0]

define internal void @_GLOBAL__I_CN() nounwind {
entry:
  store i1 true, i1* @Constructor1.0.b
  %0 = load i32* @CN, align 4                     ; <i32> [#uses=2]
  %1 = add nsw i32 %0, 1                          ; <i32> [#uses=1]
  store i32 %1, i32* @CN, align 4
  %2 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 7, i32 %0) nounwind ; <i32> [#uses=0]
  %3 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  store i1 true, i1* @Constructor2.0.b
  %4 = load i32* @CN, align 4                     ; <i32> [#uses=2]
  %5 = add nsw i32 %4, 1                          ; <i32> [#uses=1]
  store i32 %5, i32* @CN, align 4
  %6 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 12, i32 %4) nounwind ; <i32> [#uses=0]
  %7 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_1, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  %8 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_2, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  ret void
}

declare i32 @printf(i8* noalias nocapture, ...) nounwind

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

define internal void @__tcf_0(i8* nocapture %unnamed_arg) nounwind {
entry:
  %0 = load i32* @DN, align 4                     ; <i32> [#uses=2]
  %1 = add nsw i32 %0, 1                          ; <i32> [#uses=1]
  store i32 %1, i32* @DN, align 4
  %.b = load i1* @Constructor1.0.b                ; <i1> [#uses=1]
  %2 = select i1 %.b, i32 7, i32 0                ; <i32> [#uses=1]
  %3 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0), i32 %2, i32 %0) nounwind ; <i32> [#uses=0]
  ret void
}

define internal void @__tcf_1(i8* nocapture %unnamed_arg) nounwind {
entry:
  %0 = load i32* @DN, align 4                     ; <i32> [#uses=2]
  %1 = add nsw i32 %0, 1                          ; <i32> [#uses=1]
  store i32 %1, i32* @DN, align 4
  %.b = load i1* @Constructor2.0.b                ; <i1> [#uses=1]
  %2 = select i1 %.b, i32 12, i32 0               ; <i32> [#uses=1]
  %3 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0), i32 %2, i32 %0) nounwind ; <i32> [#uses=0]
  ret void
}

define internal void @__tcf_2(i8* nocapture %unnamed_arg) nounwind {
entry:
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  ret void
}

declare i32 @puts(i8* nocapture) nounwind

define i32 @main() nounwind {
entry:
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0)) ; <i32> [#uses=0]
  ret i32 0
}
