; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010118-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32, i32, i32, i32, i32 }

@main.w = private unnamed_addr constant %struct.A { i32 100, i32 110, i32 20, i32 30, i32 -1, i32 -1 }, align 4

define void @foo(%struct.A* %v, i32 %w, i32 %x, i32* %y, i32* %z) nounwind uwtable {
entry:
  %v.addr = alloca %struct.A*, align 8
  %w.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32*, align 8
  %z.addr = alloca i32*, align 8
  store %struct.A* %v, %struct.A** %v.addr, align 8
  store i32 %w, i32* %w.addr, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32* %y, i32** %y.addr, align 8
  store i32* %z, i32** %z.addr, align 8
  ret void
}

define void @bar(%struct.A* %v, i32 %x, i32 %y, i32 %w, i32 %h) nounwind uwtable {
entry:
  %v.addr = alloca %struct.A*, align 8
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %oldw = alloca i32, align 4
  %oldh = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %dx = alloca i32, align 4
  %dy = alloca i32, align 4
  store %struct.A* %v, %struct.A** %v.addr, align 8
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %w, i32* %w.addr, align 4
  store i32 %h, i32* %h.addr, align 4
  %0 = load %struct.A** %v.addr, align 8
  %a = getelementptr inbounds %struct.A* %0, i32 0, i32 0
  %1 = load i32* %a, align 4
  %2 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %1, %2
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load %struct.A** %v.addr, align 8
  %b = getelementptr inbounds %struct.A* %3, i32 0, i32 1
  %4 = load i32* %b, align 4
  %5 = load i32* %y.addr, align 4
  %cmp1 = icmp ne i32 %4, %5
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %6 = load i32* %w.addr, align 4
  store i32 %6, i32* %oldw, align 4
  %7 = load i32* %h.addr, align 4
  store i32 %7, i32* %oldh, align 4
  %8 = load %struct.A** %v.addr, align 8
  %e2 = getelementptr inbounds %struct.A* %8, i32 0, i32 4
  %9 = load i32* %e2, align 4
  store i32 %9, i32* %e, align 4
  %10 = load %struct.A** %v.addr, align 8
  %f3 = getelementptr inbounds %struct.A* %10, i32 0, i32 5
  %11 = load i32* %f3, align 4
  store i32 %11, i32* %f, align 4
  %12 = load %struct.A** %v.addr, align 8
  call void @foo(%struct.A* %12, i32 0, i32 0, i32* %w.addr, i32* %h.addr)
  %13 = load i32* %oldw, align 4
  %14 = load i32* %w.addr, align 4
  %sub = sub nsw i32 %13, %14
  %conv = sitofp i32 %sub to double
  %15 = load i32* %e, align 4
  %conv4 = sitofp i32 %15 to double
  %mul = fmul double %conv, %conv4
  %div = fdiv double %mul, 2.000000e+00
  %conv5 = fptosi double %div to i32
  store i32 %conv5, i32* %dx, align 4
  %16 = load i32* %oldh, align 4
  %17 = load i32* %h.addr, align 4
  %sub6 = sub nsw i32 %16, %17
  %conv7 = sitofp i32 %sub6 to double
  %18 = load i32* %f, align 4
  %conv8 = sitofp i32 %18 to double
  %mul9 = fmul double %conv7, %conv8
  %div10 = fdiv double %mul9, 2.000000e+00
  %conv11 = fptosi double %div10 to i32
  store i32 %conv11, i32* %dy, align 4
  %19 = load i32* %dx, align 4
  %20 = load i32* %x.addr, align 4
  %add = add nsw i32 %20, %19
  store i32 %add, i32* %x.addr, align 4
  %21 = load i32* %dy, align 4
  %22 = load i32* %y.addr, align 4
  %add12 = add nsw i32 %22, %21
  store i32 %add12, i32* %y.addr, align 4
  %23 = load i32* %x.addr, align 4
  %24 = load %struct.A** %v.addr, align 8
  %a13 = getelementptr inbounds %struct.A* %24, i32 0, i32 0
  store i32 %23, i32* %a13, align 4
  %25 = load i32* %y.addr, align 4
  %26 = load %struct.A** %v.addr, align 8
  %b14 = getelementptr inbounds %struct.A* %26, i32 0, i32 1
  store i32 %25, i32* %b14, align 4
  %27 = load i32* %w.addr, align 4
  %28 = load %struct.A** %v.addr, align 8
  %c = getelementptr inbounds %struct.A* %28, i32 0, i32 2
  store i32 %27, i32* %c, align 4
  %29 = load i32* %h.addr, align 4
  %30 = load %struct.A** %v.addr, align 8
  %d = getelementptr inbounds %struct.A* %30, i32 0, i32 3
  store i32 %29, i32* %d, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %w = alloca %struct.A, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.A* %w to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.A* @main.w to i8*), i64 24, i32 4, i1 false)
  call void @bar(%struct.A* %w, i32 400, i32 420, i32 50, i32 70)
  %d = getelementptr inbounds %struct.A* %w, i32 0, i32 3
  %1 = load i32* %d, align 4
  %cmp = icmp ne i32 %1, 70
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
