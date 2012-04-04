; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42154.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { [1 x i8] }

define void @foo(i8 %a.coerce) nounwind uwtable noinline {
entry:
  %a = alloca %struct.A, align 1
  %coerce.dive = getelementptr %struct.A* %a, i32 0, i32 0
  %0 = bitcast [1 x i8]* %coerce.dive to i8*
  store i8 %a.coerce, i8* %0, align 1
  %x = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i8]* %x, i32 0, i64 0
  %1 = load i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp ne i32 %conv, 97
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 1
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %x = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i8]* %x, i32 0, i64 %idxprom
  store i8 97, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %coerce.dive = getelementptr %struct.A* %a, i32 0, i32 0
  %3 = bitcast [1 x i8]* %coerce.dive to i8*
  %4 = load i8* %3, align 1
  call void @foo(i8 %4)
  ret i32 0
}
