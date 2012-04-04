; ModuleID = '/home/david/src/c-semantics/tests/mustPass/xrealloc4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p1 = alloca i8*, align 8
  %p2 = alloca i8*, align 8
  store i32 0, i32* %retval
  %call = call noalias i8* @malloc(i64 5) nounwind
  store i8* %call, i8** %p1, align 8
  %0 = load i8** %p1, align 8
  %arrayidx = getelementptr inbounds i8* %0, i64 4
  store i8 100, i8* %arrayidx, align 1
  %1 = load i8** %p1, align 8
  %call1 = call i8* @realloc(i8* %1, i64 5) nounwind
  store i8* %call1, i8** %p2, align 8
  %2 = load i8** %p2, align 8
  %arrayidx2 = getelementptr inbounds i8* %2, i64 4
  %3 = load i8* %arrayidx2, align 1
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i8* @realloc(i8*, i64) nounwind
