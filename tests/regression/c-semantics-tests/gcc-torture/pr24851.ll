; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr24851.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca [10 x i32], align 16
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [10 x i32]* %a, i32 0, i64 1
  store i32* %arrayidx, i32** %q, align 8
  %0 = load i32** %q, align 8
  %arrayidx1 = getelementptr inbounds i32* %0, i64 -1
  store i32* %arrayidx1, i32** %p, align 8
  %1 = load i32** %p, align 8
  %arrayidx2 = getelementptr inbounds [10 x i32]* %a, i32 0, i64 9
  %cmp = icmp uge i32* %1, %arrayidx2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
