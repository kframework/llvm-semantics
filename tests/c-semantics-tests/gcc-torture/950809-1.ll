; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950809-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32*, i32, i32*, [2 x i32] }

@main.sc = internal global [3 x i32] [i32 2, i32 3, i32 4], align 4

define void @f(%struct.S* %x) nounwind uwtable {
entry:
  %x.addr = alloca %struct.S*, align 8
  %t = alloca i32*, align 8
  %t1 = alloca i32, align 4
  %t2 = alloca i32, align 4
  %t3 = alloca i32, align 4
  %a0 = alloca i32, align 4
  %a1 = alloca i32, align 4
  store %struct.S* %x, %struct.S** %x.addr, align 8
  %0 = load %struct.S** %x.addr, align 8
  %sc = getelementptr inbounds %struct.S* %0, i32 0, i32 2
  %1 = load i32** %sc, align 8
  store i32* %1, i32** %t, align 8
  %2 = load i32** %t, align 8
  %arrayidx = getelementptr inbounds i32* %2, i64 0
  %3 = load i32* %arrayidx, align 4
  store i32 %3, i32* %t1, align 4
  %4 = load i32** %t, align 8
  %arrayidx1 = getelementptr inbounds i32* %4, i64 1
  %5 = load i32* %arrayidx1, align 4
  store i32 %5, i32* %t2, align 4
  %6 = load i32** %t, align 8
  %arrayidx2 = getelementptr inbounds i32* %6, i64 2
  %7 = load i32* %arrayidx2, align 4
  store i32 %7, i32* %t3, align 4
  %8 = load %struct.S** %x.addr, align 8
  %a = getelementptr inbounds %struct.S* %8, i32 0, i32 3
  %arrayidx3 = getelementptr inbounds [2 x i32]* %a, i32 0, i64 0
  %9 = load i32* %arrayidx3, align 4
  store i32 %9, i32* %a0, align 4
  %10 = load %struct.S** %x.addr, align 8
  %a4 = getelementptr inbounds %struct.S* %10, i32 0, i32 3
  %arrayidx5 = getelementptr inbounds [2 x i32]* %a4, i32 0, i64 1
  %11 = load i32* %arrayidx5, align 4
  store i32 %11, i32* %a1, align 4
  %12 = load i32* %t1, align 4
  %13 = load i32** %t, align 8
  %arrayidx6 = getelementptr inbounds i32* %13, i64 2
  store i32 %12, i32* %arrayidx6, align 4
  %14 = load i32* %a1, align 4
  %15 = load i32** %t, align 8
  %arrayidx7 = getelementptr inbounds i32* %15, i64 0
  store i32 %14, i32* %arrayidx7, align 4
  %16 = load i32* %a0, align 4
  %17 = load %struct.S** %x.addr, align 8
  %a8 = getelementptr inbounds %struct.S* %17, i32 0, i32 3
  %arrayidx9 = getelementptr inbounds [2 x i32]* %a8, i32 0, i64 1
  store i32 %16, i32* %arrayidx9, align 4
  %18 = load i32* %t3, align 4
  %19 = load %struct.S** %x.addr, align 8
  %a10 = getelementptr inbounds %struct.S* %19, i32 0, i32 3
  %arrayidx11 = getelementptr inbounds [2 x i32]* %a10, i32 0, i64 0
  store i32 %18, i32* %arrayidx11, align 4
  %20 = load i32* %t2, align 4
  %21 = load %struct.S** %x.addr, align 8
  %fc = getelementptr inbounds %struct.S* %21, i32 0, i32 1
  store i32 %20, i32* %fc, align 4
  %22 = load i32** %t, align 8
  %23 = load %struct.S** %x.addr, align 8
  %sp = getelementptr inbounds %struct.S* %23, i32 0, i32 0
  store i32* %22, i32** %sp, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.S, align 8
  store i32 0, i32* %retval
  %sc = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  store i32* getelementptr inbounds ([3 x i32]* @main.sc, i32 0, i32 0), i32** %sc, align 8
  %a = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %arrayidx = getelementptr inbounds [2 x i32]* %a, i32 0, i64 0
  store i32 10, i32* %arrayidx, align 4
  %a1 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %arrayidx2 = getelementptr inbounds [2 x i32]* %a1, i32 0, i64 1
  store i32 11, i32* %arrayidx2, align 4
  call void @f(%struct.S* %s)
  %sp = getelementptr inbounds %struct.S* %s, i32 0, i32 0
  %0 = load i32** %sp, align 8
  %arrayidx3 = getelementptr inbounds i32* %0, i64 2
  %1 = load i32* %arrayidx3, align 4
  %cmp = icmp ne i32 %1, 2
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

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
