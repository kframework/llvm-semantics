; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr15262-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }

define i32 @foo() nounwind uwtable {
entry:
  ret i32 3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %loc = alloca %struct.A, align 4
  %locp = alloca %struct.A*, align 8
  %f = alloca float, align 4
  %g = alloca float, align 4
  %p = alloca float*, align 8
  %T355 = alloca i32, align 4
  %T356 = alloca i32*, align 8
  store i32 0, i32* %retval
  store float 3.000000e+00, float* %f, align 4
  store float 2.000000e+00, float* %g, align 4
  %call = call i32 @foo()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float* [ %g, %cond.true ], [ %f, %cond.false ]
  store float* %cond, float** %p, align 8
  %0 = load float** %p, align 8
  %1 = load float* %0, align 4
  %conv = fpext float %1 to double
  %cmp = fcmp ogt double %conv, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store float 1.000000e+00, float* %g, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %call2 = call noalias i8* @malloc(i64 8) nounwind
  %2 = bitcast i8* %call2 to %struct.A*
  store %struct.A* %2, %struct.A** %locp, align 8
  %3 = load %struct.A** %locp, align 8
  %i = getelementptr inbounds %struct.A* %3, i32 0, i32 1
  store i32 10, i32* %i, align 4
  %4 = load %struct.A** %locp, align 8
  %i3 = getelementptr inbounds %struct.A* %4, i32 0, i32 1
  %5 = load i32* %i3, align 4
  store i32 %5, i32* %T355, align 4
  %6 = load %struct.A** %locp, align 8
  %i4 = getelementptr inbounds %struct.A* %6, i32 0, i32 1
  store i32* %i4, i32** %T356, align 8
  %7 = load i32** %T356, align 8
  store i32 1, i32* %7, align 4
  %8 = load %struct.A** %locp, align 8
  %i5 = getelementptr inbounds %struct.A* %8, i32 0, i32 1
  %9 = load i32* %i5, align 4
  store i32 %9, i32* %T355, align 4
  %10 = load i32* %T355, align 4
  %cmp6 = icmp ne i32 %10, 1
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare void @abort() noreturn nounwind
