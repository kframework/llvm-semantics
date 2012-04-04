; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931102-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.T = type { i64 }
%struct.anon = type { i16, i16 }

define i32 @f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %num = alloca i32, align 4
  %reg = alloca %union.T, align 8
  store i32 %x, i32* %x.addr, align 4
  store i32 0, i32* %num, align 4
  %0 = load i32* %x.addr, align 4
  %conv = trunc i32 %0 to i16
  %b = bitcast %union.T* %reg to %struct.anon*
  %l = getelementptr inbounds %struct.anon* %b, i32 0, i32 1
  store i16 %conv, i16* %l, align 2
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %b1 = bitcast %union.T* %reg to %struct.anon*
  %l2 = getelementptr inbounds %struct.anon* %b1, i32 0, i32 1
  %1 = load i16* %l2, align 2
  %conv3 = sext i16 %1 to i32
  %and = and i32 %conv3, 1
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32* %num, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %num, align 4
  %b5 = bitcast %union.T* %reg to %struct.anon*
  %l6 = getelementptr inbounds %struct.anon* %b5, i32 0, i32 1
  %3 = load i16* %l6, align 2
  %conv7 = sext i16 %3 to i32
  %shr = ashr i32 %conv7, 1
  %conv8 = trunc i32 %shr to i16
  store i16 %conv8, i16* %l6, align 2
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %4 = load i32* %num, align 4
  ret i32 %4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (...)* bitcast (i32 (i32)* @f to i32 (...)*)(i32 2)
  %cmp = icmp ne i32 %call, 1
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
