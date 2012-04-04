; ModuleID = '/home/david/src/c-semantics/tests/unitTests/realloc2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca i8*, align 8
  store i32 0, i32* %retval
  %call = call i8* @realloc(i8* null, i64 5) nounwind
  store i8* %call, i8** %p, align 8
  %0 = load i8** %p, align 8
  %arrayidx = getelementptr inbounds i8* %0, i64 3
  store i8 100, i8* %arrayidx, align 1
  %1 = load i8** %p, align 8
  %arrayidx1 = getelementptr inbounds i8* %1, i64 3
  %2 = load i8* %arrayidx1, align 1
  %conv = sext i8 %2 to i32
  ret i32 %conv
}

declare i8* @realloc(i8*, i64) nounwind
