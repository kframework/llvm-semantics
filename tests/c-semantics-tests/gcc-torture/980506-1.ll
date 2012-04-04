; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980506-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.decision = type { i8, %struct.decision* }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca %struct.decision*, align 8
  store i32 0, i32* %retval
  store %struct.decision* null, %struct.decision** %p, align 8
  %0 = load %struct.decision** %p, align 8
  call void (...)* bitcast (void (%struct.decision*)* @clear_modes to void (...)*)(%struct.decision* %0)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

define internal void @clear_modes(%struct.decision* %p) nounwind uwtable {
entry:
  %p.addr = alloca %struct.decision*, align 8
  store %struct.decision* %p, %struct.decision** %p.addr, align 8
  br label %blah

foo:                                              ; preds = %if.then
  %0 = load %struct.decision** %p.addr, align 8
  %enforce_mode = getelementptr inbounds %struct.decision* %0, i32 0, i32 0
  store i8 0, i8* %enforce_mode, align 1
  br label %blah

blah:                                             ; preds = %foo, %entry
  %1 = load %struct.decision** %p.addr, align 8
  %tobool = icmp ne %struct.decision* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %blah
  br label %foo

if.end:                                           ; preds = %blah
  ret void
}

declare void @exit(i32) noreturn nounwind
