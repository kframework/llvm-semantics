; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001228-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { i32 }
%union.anon.0 = type { i32 }

define i32 @foo1() nounwind uwtable {
entry:
  %u = alloca %union.anon, align 4
  %b = bitcast %union.anon* %u to i32*
  store i32 1, i32* %b, align 4
  %a = bitcast %union.anon* %u to [4 x i8]*
  %arrayidx = getelementptr inbounds [4 x i8]* %a, i32 0, i64 0
  %0 = load i8* %arrayidx, align 1
  %conv = sext i8 %0 to i32
  ret i32 %conv
}

define i32 @foo2() nounwind uwtable {
entry:
  %u = alloca %union.anon.0, align 4
  %b = bitcast %union.anon.0* %u to i32*
  store volatile i32 1, i32* %b, align 4
  %a = bitcast %union.anon.0* %u to [4 x i8]*
  %arrayidx = getelementptr inbounds [4 x i8]* %a, i32 0, i64 0
  %0 = load volatile i8* %arrayidx, align 1
  %conv = sext i8 %0 to i32
  ret i32 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo1()
  %call1 = call i32 @foo2()
  %cmp = icmp ne i32 %call, %call1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
