; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr41317.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32 }
%struct.B = type { %struct.A, i32 }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 4
  store i32 0, i32* %retval
  %i = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  store i32 0, i32* %i, align 4
  %0 = bitcast %struct.A* %a to %struct.B*
  call void @foo(%struct.B* %0)
  %i1 = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %1 = load i32* %i1, align 4
  %cmp = icmp ne i32 %1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal void @foo(%struct.B* %p) nounwind uwtable {
entry:
  %p.addr = alloca %struct.B*, align 8
  store %struct.B* %p, %struct.B** %p.addr, align 8
  %0 = load %struct.B** %p.addr, align 8
  %1 = bitcast %struct.B* %0 to %struct.A*
  %i = getelementptr inbounds %struct.A* %1, i32 0, i32 0
  store i32 1, i32* %i, align 4
  ret void
}

declare void @abort() noreturn nounwind
