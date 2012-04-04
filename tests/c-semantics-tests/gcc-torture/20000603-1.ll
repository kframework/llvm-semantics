; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000603-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s1 = type { double }
%struct.s2 = type { double }
%union.u = type { %struct.s1 }

define double @f(%struct.s1* %a, %struct.s2* %b) nounwind uwtable {
entry:
  %a.addr = alloca %struct.s1*, align 8
  %b.addr = alloca %struct.s2*, align 8
  store %struct.s1* %a, %struct.s1** %a.addr, align 8
  store %struct.s2* %b, %struct.s2** %b.addr, align 8
  %0 = load %struct.s1** %a.addr, align 8
  %d = getelementptr inbounds %struct.s1* %0, i32 0, i32 0
  store double 1.000000e+00, double* %d, align 8
  %1 = load %struct.s2** %b.addr, align 8
  %d1 = getelementptr inbounds %struct.s2* %1, i32 0, i32 0
  %2 = load double* %d1, align 8
  %add = fadd double %2, 1.000000e+00
  ret double %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %union.u, align 8
  store i32 0, i32* %retval
  %x = bitcast %union.u* %a to %struct.s1*
  %d = getelementptr inbounds %struct.s1* %x, i32 0, i32 0
  store double 0.000000e+00, double* %d, align 8
  %x1 = bitcast %union.u* %a to %struct.s1*
  %y = bitcast %union.u* %a to %struct.s2*
  %call = call double @f(%struct.s1* %x1, %struct.s2* %y)
  %cmp = fcmp une double %call, 2.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
