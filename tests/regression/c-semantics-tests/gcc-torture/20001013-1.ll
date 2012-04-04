; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001013-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.x = type { i32, i32 }

@z = global %struct.x { i32 -4028, i32 4096 }, align 4

define i32 @foo(%struct.x* %p, i32 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p.addr = alloca %struct.x*, align 8
  %y.addr = alloca i32, align 4
  store %struct.x* %p, %struct.x** %p.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  %0 = load i32* %y.addr, align 4
  %and = and i32 %0, 255
  %1 = load i32* %y.addr, align 4
  %cmp = icmp ne i32 %and, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.x** %p.addr, align 8
  %b = getelementptr inbounds %struct.x* %2, i32 0, i32 1
  %3 = load i32* %b, align 4
  %sub = sub nsw i32 0, %3
  %4 = load %struct.x** %p.addr, align 8
  %a = getelementptr inbounds %struct.x* %4, i32 0, i32 0
  %5 = load i32* %a, align 4
  %cmp1 = icmp sge i32 %sub, %5
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i32* %retval
  ret i32 %6
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(%struct.x* @z, i32 10)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

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
