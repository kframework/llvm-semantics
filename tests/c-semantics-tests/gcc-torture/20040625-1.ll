; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040625-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type <{ %struct.s* }>

define %struct.s* @maybe_next(%struct.s* %s, i32 %t) nounwind uwtable noinline {
entry:
  %s.addr = alloca %struct.s*, align 8
  %t.addr = alloca i32, align 4
  store %struct.s* %s, %struct.s** %s.addr, align 8
  store i32 %t, i32* %t.addr, align 4
  %0 = load i32* %t.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.s** %s.addr, align 8
  %next = getelementptr inbounds %struct.s* %1, i32 0, i32 0
  %2 = load %struct.s** %next, align 1
  store %struct.s* %2, %struct.s** %s.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load %struct.s** %s.addr, align 8
  ret %struct.s* %3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s1 = alloca %struct.s, align 1
  %s2 = alloca %struct.s, align 1
  store i32 0, i32* %retval
  %next = getelementptr inbounds %struct.s* %s1, i32 0, i32 0
  store %struct.s* %s2, %struct.s** %next, align 1
  %call = call %struct.s* @maybe_next(%struct.s* %s1, i32 1)
  %cmp = icmp ne %struct.s* %call, %s2
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
