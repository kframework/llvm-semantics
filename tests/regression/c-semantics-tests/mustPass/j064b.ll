; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j064b.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.p = internal constant [6 x i8] c"hello\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %q = alloca i8*, align 8
  store i32 0, i32* %retval
  %0 = load i8* getelementptr inbounds ([6 x i8]* @main.p, i32 0, i64 0), align 1
  %conv = sext i8 %0 to i32
  %call = call i8* @strchr(i8* getelementptr inbounds ([6 x i8]* @main.p, i32 0, i32 0), i32 %conv) nounwind readonly
  store i8* %call, i8** %q, align 8
  %1 = load i8** %q, align 8
  %arrayidx = getelementptr inbounds i8* %1, i64 0
  %2 = load i8* %arrayidx, align 1
  ret i32 0
}

declare i8* @strchr(i8*, i32) nounwind readonly
