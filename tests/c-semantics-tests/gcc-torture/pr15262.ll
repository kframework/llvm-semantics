; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr15262.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }

define void @bar(float* %p) nounwind uwtable {
entry:
  %p.addr = alloca float*, align 8
  store float* %p, float** %p.addr, align 8
  %0 = load float** %p.addr, align 8
  store float 0x4014CCCCC0000000, float* %0, align 4
  ret void
}

define i32 @foo(%struct.A* %locp, i32 %i, i32 %str) nounwind uwtable {
entry:
  %locp.addr = alloca %struct.A*, align 8
  %i.addr = alloca i32, align 4
  %str.addr = alloca i32, align 4
  %f = alloca float, align 4
  %g = alloca float, align 4
  %p = alloca float*, align 8
  %T355 = alloca i32, align 4
  %T356 = alloca i32*, align 8
  store %struct.A* %locp, %struct.A** %locp.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  store i32 %str, i32* %str.addr, align 4
  %0 = load i32* %i.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float* [ %g, %cond.true ], [ %f, %cond.false ]
  store float* %cond, float** %p, align 8
  %1 = load float** %p, align 8
  call void @bar(float* %1)
  %2 = load float** %p, align 8
  %3 = load float* %2, align 4
  %conv = fpext float %3 to double
  %cmp = fcmp ogt double %conv, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store i32 1, i32* %str.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %4 = load %struct.A** %locp.addr, align 8
  %i2 = getelementptr inbounds %struct.A* %4, i32 0, i32 1
  %5 = load i32* %i2, align 4
  store i32 %5, i32* %T355, align 4
  %6 = load %struct.A** %locp.addr, align 8
  %i3 = getelementptr inbounds %struct.A* %6, i32 0, i32 1
  store i32* %i3, i32** %T356, align 8
  %7 = load i32* %str.addr, align 4
  %8 = load i32** %T356, align 8
  store i32 %7, i32* %8, align 4
  %9 = load %struct.A** %locp.addr, align 8
  %i4 = getelementptr inbounds %struct.A* %9, i32 0, i32 1
  %10 = load i32* %i4, align 4
  store i32 %10, i32* %T355, align 4
  %11 = load i32* %T355, align 4
  ret i32 %11
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %loc = alloca %struct.A, align 4
  %str = alloca i32, align 4
  store i32 0, i32* %retval
  %i = getelementptr inbounds %struct.A* %loc, i32 0, i32 1
  store i32 2, i32* %i, align 4
  %call = call i32 @foo(%struct.A* %loc, i32 10, i32 3)
  store i32 %call, i32* %str, align 4
  %0 = load i32* %str, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
