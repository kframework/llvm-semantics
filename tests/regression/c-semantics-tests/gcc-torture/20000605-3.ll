; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000605-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.F = type { i32, i32 }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %timeout = alloca i32, align 4
  %x = alloca i32, align 4
  %i = alloca %struct.F, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %timeout, align 4
  store i32 0, i32* %x, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end6
  %x1 = getelementptr inbounds %struct.F* %i, i32 0, i32 0
  %0 = load i32* %x, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* %x, align 4
  store i32 %0, i32* %x1, align 4
  %y = getelementptr inbounds %struct.F* %i, i32 0, i32 1
  store i32 0, i32* %y, align 4
  %x2 = getelementptr inbounds %struct.F* %i, i32 0, i32 0
  %1 = load i32* %x2, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %2 = load i32* %timeout, align 4
  %inc3 = add nsw i32 %2, 1
  store i32 %inc3, i32* %timeout, align 4
  %cmp4 = icmp sgt i32 %inc3, 5
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  br label %die

if.end6:                                          ; preds = %if.end
  br label %while.body

while.end:                                        ; preds = %if.then
  ret i32 0

die:                                              ; preds = %if.then5
  call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind
