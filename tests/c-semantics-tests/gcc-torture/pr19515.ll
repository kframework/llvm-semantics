; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr19515.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.aun = type { [8 x i8] }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %union.aun, align 1
  store i32 0, i32* %retval
  %0 = bitcast %union.aun* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 8, i32 1, i1 false)
  %a2 = bitcast %union.aun* %a to [8 x i8]*
  %arrayidx = getelementptr inbounds [8 x i8]* %a2, i32 0, i64 2
  %1 = load i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
