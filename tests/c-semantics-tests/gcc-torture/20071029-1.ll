; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20071029-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.T = type { %struct.anon }
%struct.anon = type { i32, i32, i32, i32, i32, i32, i32, i32, i64, i64, i32 }

@test.i = internal global i32 11, align 4

define void @test(%union.T* %t) nounwind uwtable noinline {
entry:
  %t.addr = alloca %union.T*, align 8
  store %union.T* %t, %union.T** %t.addr, align 8
  %0 = load %union.T** %t.addr, align 8
  %f = bitcast %union.T* %0 to %struct.anon*
  %f1 = getelementptr inbounds %struct.anon* %f, i32 0, i32 0
  %1 = load i32* %f1, align 4
  %2 = load i32* @test.i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @test.i, align 4
  %cmp = icmp ne i32 %1, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %3 = load %union.T** %t.addr, align 8
  %f2 = bitcast %union.T* %3 to %struct.anon*
  %f23 = getelementptr inbounds %struct.anon* %f2, i32 0, i32 1
  %4 = load i32* %f23, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then33, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %5 = load %union.T** %t.addr, align 8
  %f4 = bitcast %union.T* %5 to %struct.anon*
  %f3 = getelementptr inbounds %struct.anon* %f4, i32 0, i32 2
  %6 = load i32* %f3, align 4
  %tobool5 = icmp ne i32 %6, 0
  br i1 %tobool5, label %if.then33, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %7 = load %union.T** %t.addr, align 8
  %f7 = bitcast %union.T* %7 to %struct.anon*
  %f48 = getelementptr inbounds %struct.anon* %f7, i32 0, i32 3
  %8 = load i32* %f48, align 4
  %tobool9 = icmp ne i32 %8, 0
  br i1 %tobool9, label %if.then33, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false6
  %9 = load %union.T** %t.addr, align 8
  %f11 = bitcast %union.T* %9 to %struct.anon*
  %f5 = getelementptr inbounds %struct.anon* %f11, i32 0, i32 4
  %10 = load i32* %f5, align 4
  %tobool12 = icmp ne i32 %10, 0
  br i1 %tobool12, label %if.then33, label %lor.lhs.false13

lor.lhs.false13:                                  ; preds = %lor.lhs.false10
  %11 = load %union.T** %t.addr, align 8
  %f14 = bitcast %union.T* %11 to %struct.anon*
  %f6 = getelementptr inbounds %struct.anon* %f14, i32 0, i32 5
  %12 = load i32* %f6, align 4
  %tobool15 = icmp ne i32 %12, 0
  br i1 %tobool15, label %if.then33, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %lor.lhs.false13
  %13 = load %union.T** %t.addr, align 8
  %f17 = bitcast %union.T* %13 to %struct.anon*
  %f718 = getelementptr inbounds %struct.anon* %f17, i32 0, i32 6
  %14 = load i32* %f718, align 4
  %tobool19 = icmp ne i32 %14, 0
  br i1 %tobool19, label %if.then33, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false16
  %15 = load %union.T** %t.addr, align 8
  %f21 = bitcast %union.T* %15 to %struct.anon*
  %f8 = getelementptr inbounds %struct.anon* %f21, i32 0, i32 7
  %16 = load i32* %f8, align 4
  %tobool22 = icmp ne i32 %16, 0
  br i1 %tobool22, label %if.then33, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %lor.lhs.false20
  %17 = load %union.T** %t.addr, align 8
  %f24 = bitcast %union.T* %17 to %struct.anon*
  %f9 = getelementptr inbounds %struct.anon* %f24, i32 0, i32 8
  %18 = load i64* %f9, align 8
  %tobool25 = icmp ne i64 %18, 0
  br i1 %tobool25, label %if.then33, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %lor.lhs.false23
  %19 = load %union.T** %t.addr, align 8
  %f27 = bitcast %union.T* %19 to %struct.anon*
  %f10 = getelementptr inbounds %struct.anon* %f27, i32 0, i32 9
  %20 = load i64* %f10, align 8
  %tobool28 = icmp ne i64 %20, 0
  br i1 %tobool28, label %if.then33, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %lor.lhs.false26
  %21 = load %union.T** %t.addr, align 8
  %f30 = bitcast %union.T* %21 to %struct.anon*
  %f1131 = getelementptr inbounds %struct.anon* %f30, i32 0, i32 10
  %22 = load i32* %f1131, align 4
  %tobool32 = icmp ne i32 %22, 0
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %lor.lhs.false29, %lor.lhs.false26, %lor.lhs.false23, %lor.lhs.false20, %lor.lhs.false16, %lor.lhs.false13, %lor.lhs.false10, %lor.lhs.false6, %lor.lhs.false, %if.end
  call void @abort() noreturn
  unreachable

if.end34:                                         ; preds = %lor.lhs.false29
  %23 = load i32* @test.i, align 4
  %cmp35 = icmp eq i32 %23, 20
  br i1 %cmp35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end34
  call void @exit(i32 0) noreturn
  unreachable

if.end37:                                         ; preds = %if.end34
  ret void
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

define void @foo(i32 %i) nounwind uwtable noinline {
entry:
  %i.addr = alloca i32, align 4
  %t = alloca %union.T, align 8
  %.compoundliteral = alloca %union.T, align 8
  store i32 %i, i32* %i.addr, align 4
  br label %again

again:                                            ; preds = %again, %entry
  %f = bitcast %union.T* %.compoundliteral to %struct.anon*
  %f1 = getelementptr inbounds %struct.anon* %f, i32 0, i32 0
  %0 = load i32* %i.addr, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* %i.addr, align 4
  store i32 %inc, i32* %f1, align 4
  %f2 = getelementptr inbounds %struct.anon* %f, i32 0, i32 1
  store i32 0, i32* %f2, align 4
  %f3 = getelementptr inbounds %struct.anon* %f, i32 0, i32 2
  store i32 0, i32* %f3, align 4
  %f4 = getelementptr inbounds %struct.anon* %f, i32 0, i32 3
  store i32 0, i32* %f4, align 4
  %f5 = getelementptr inbounds %struct.anon* %f, i32 0, i32 4
  store i32 0, i32* %f5, align 4
  %f6 = getelementptr inbounds %struct.anon* %f, i32 0, i32 5
  store i32 0, i32* %f6, align 4
  %f7 = getelementptr inbounds %struct.anon* %f, i32 0, i32 6
  store i32 0, i32* %f7, align 4
  %f8 = getelementptr inbounds %struct.anon* %f, i32 0, i32 7
  store i32 0, i32* %f8, align 4
  %f9 = getelementptr inbounds %struct.anon* %f, i32 0, i32 8
  store i64 0, i64* %f9, align 8
  %f10 = getelementptr inbounds %struct.anon* %f, i32 0, i32 9
  store i64 0, i64* %f10, align 8
  %f11 = getelementptr inbounds %struct.anon* %f, i32 0, i32 10
  store i32 0, i32* %f11, align 4
  %1 = bitcast %union.T* %t to i8*
  %2 = bitcast %union.T* %.compoundliteral to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 56, i32 8, i1 false)
  call void @test(%union.T* %t)
  br label %again

return:                                           ; No predecessors!
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %t1 = alloca %union.T*, align 8
  %t2 = alloca %union.T*, align 8
  %cnt = alloca i32, align 4
  %.compoundliteral = alloca %union.T, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %cnt, align 4
  store %union.T* null, %union.T** %t1, align 8
  br label %loop

loop:                                             ; preds = %if.then, %entry
  %0 = load %union.T** %t1, align 8
  store %union.T* %0, %union.T** %t2, align 8
  %1 = bitcast %union.T* %.compoundliteral to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 56, i32 8, i1 false)
  %f = bitcast %union.T* %.compoundliteral to %struct.anon*
  %f9 = getelementptr inbounds %struct.anon* %f, i32 0, i32 8
  %2 = load i32* %cnt, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %cnt, align 4
  %conv = sext i32 %2 to i64
  store i64 %conv, i64* %f9, align 8
  store %union.T* %.compoundliteral, %union.T** %t1, align 8
  %3 = load i32* %cnt, align 4
  %cmp = icmp slt i32 %3, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %loop
  br label %loop

if.end:                                           ; preds = %loop
  %4 = load %union.T** %t1, align 8
  %5 = load %union.T** %t2, align 8
  %cmp2 = icmp ne %union.T* %4, %5
  br i1 %cmp2, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %6 = load %union.T** %t1, align 8
  %f4 = bitcast %union.T* %6 to %struct.anon*
  %f95 = getelementptr inbounds %struct.anon* %f4, i32 0, i32 8
  %7 = load i64* %f95, align 8
  %cmp6 = icmp ne i64 %7, 2
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %lor.lhs.false, %if.end
  call void @abort() noreturn
  unreachable

if.end9:                                          ; preds = %lor.lhs.false
  call void @foo(i32 10)
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
