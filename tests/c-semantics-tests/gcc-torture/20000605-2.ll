; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000605-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.F = type { i32 }

define void @f1(%struct.F* %x, %struct.F* %y) nounwind uwtable {
entry:
  %x.addr = alloca %struct.F*, align 8
  %y.addr = alloca %struct.F*, align 8
  %timeout = alloca i32, align 4
  store %struct.F* %x, %struct.F** %x.addr, align 8
  store %struct.F* %y, %struct.F** %y.addr, align 8
  store i32 0, i32* %timeout, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.F** %x.addr, align 8
  %i = getelementptr inbounds %struct.F* %0, i32 0, i32 0
  %1 = load i32* %i, align 4
  %2 = load %struct.F** %y.addr, align 8
  %i1 = getelementptr inbounds %struct.F* %2, i32 0, i32 0
  %3 = load i32* %i1, align 4
  %cmp = icmp slt i32 %1, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32* %timeout, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %timeout, align 4
  %cmp2 = icmp sgt i32 %inc, 5
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %5 = load %struct.F** %x.addr, align 8
  %i3 = getelementptr inbounds %struct.F* %5, i32 0, i32 0
  %6 = load i32* %i3, align 4
  %inc4 = add nsw i32 %6, 1
  store i32 %inc4, i32* %i3, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.F, align 4
  %y = alloca %struct.F, align 4
  store i32 0, i32* %retval
  %i = getelementptr inbounds %struct.F* %x, i32 0, i32 0
  store i32 0, i32* %i, align 4
  %i1 = getelementptr inbounds %struct.F* %y, i32 0, i32 0
  store i32 1, i32* %i1, align 4
  call void @f1(%struct.F* %x, %struct.F* %y)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
