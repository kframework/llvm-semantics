; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000808-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Point = type { i64, i64 }

define void @bar() nounwind uwtable {
entry:
  ret void
}

define void @f(i64 %p0.coerce0, i64 %p0.coerce1, i64 %p1.coerce0, i64 %p1.coerce1, i64 %p2.coerce0, i64 %p2.coerce1, %struct.Point* byval align 8 %p3, %struct.Point* byval align 8 %p4, %struct.Point* byval align 8 %p5) nounwind uwtable {
entry:
  %p0 = alloca %struct.Point, align 8
  %p1 = alloca %struct.Point, align 8
  %p2 = alloca %struct.Point, align 8
  %0 = bitcast %struct.Point* %p0 to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %p0.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %p0.coerce1, i64* %2
  %3 = bitcast %struct.Point* %p1 to { i64, i64 }*
  %4 = getelementptr { i64, i64 }* %3, i32 0, i32 0
  store i64 %p1.coerce0, i64* %4
  %5 = getelementptr { i64, i64 }* %3, i32 0, i32 1
  store i64 %p1.coerce1, i64* %5
  %6 = bitcast %struct.Point* %p2 to { i64, i64 }*
  %7 = getelementptr { i64, i64 }* %6, i32 0, i32 0
  store i64 %p2.coerce0, i64* %7
  %8 = getelementptr { i64, i64 }* %6, i32 0, i32 1
  store i64 %p2.coerce1, i64* %8
  %p_x = getelementptr inbounds %struct.Point* %p0, i32 0, i32 0
  %9 = load i64* %p_x, align 8
  %cmp = icmp ne i64 %9, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %p_y = getelementptr inbounds %struct.Point* %p0, i32 0, i32 1
  %10 = load i64* %p_y, align 8
  %cmp1 = icmp ne i64 %10, 1
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %p_x3 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 0
  %11 = load i64* %p_x3, align 8
  %cmp4 = icmp ne i64 %11, -1
  br i1 %cmp4, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false2
  %p_y6 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 1
  %12 = load i64* %p_y6, align 8
  %cmp7 = icmp ne i64 %12, 0
  br i1 %cmp7, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false5
  %p_x9 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 0
  %13 = load i64* %p_x9, align 8
  %cmp10 = icmp ne i64 %13, 1
  br i1 %cmp10, label %if.then, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %lor.lhs.false8
  %p_y12 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 1
  %14 = load i64* %p_y12, align 8
  %cmp13 = icmp ne i64 %14, -1
  br i1 %cmp13, label %if.then, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %lor.lhs.false11
  %p_x15 = getelementptr inbounds %struct.Point* %p3, i32 0, i32 0
  %15 = load i64* %p_x15, align 8
  %cmp16 = icmp ne i64 %15, -1
  br i1 %cmp16, label %if.then, label %lor.lhs.false17

lor.lhs.false17:                                  ; preds = %lor.lhs.false14
  %p_y18 = getelementptr inbounds %struct.Point* %p3, i32 0, i32 1
  %16 = load i64* %p_y18, align 8
  %cmp19 = icmp ne i64 %16, 1
  br i1 %cmp19, label %if.then, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false17
  %p_x21 = getelementptr inbounds %struct.Point* %p4, i32 0, i32 0
  %17 = load i64* %p_x21, align 8
  %cmp22 = icmp ne i64 %17, 0
  br i1 %cmp22, label %if.then, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %lor.lhs.false20
  %p_y24 = getelementptr inbounds %struct.Point* %p4, i32 0, i32 1
  %18 = load i64* %p_y24, align 8
  %cmp25 = icmp ne i64 %18, -1
  br i1 %cmp25, label %if.then, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %lor.lhs.false23
  %p_x27 = getelementptr inbounds %struct.Point* %p5, i32 0, i32 0
  %19 = load i64* %p_x27, align 8
  %cmp28 = icmp ne i64 %19, 1
  br i1 %cmp28, label %if.then, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %lor.lhs.false26
  %p_y30 = getelementptr inbounds %struct.Point* %p5, i32 0, i32 1
  %20 = load i64* %p_y30, align 8
  %cmp31 = icmp ne i64 %20, 0
  br i1 %cmp31, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false29, %lor.lhs.false26, %lor.lhs.false23, %lor.lhs.false20, %lor.lhs.false17, %lor.lhs.false14, %lor.lhs.false11, %lor.lhs.false8, %lor.lhs.false5, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false29
  ret void
}

declare void @abort() noreturn nounwind

define void @foo() nounwind uwtable {
entry:
  %p0 = alloca %struct.Point, align 8
  %p1 = alloca %struct.Point, align 8
  %p2 = alloca %struct.Point, align 8
  %p3 = alloca %struct.Point, align 8
  %p4 = alloca %struct.Point, align 8
  %p5 = alloca %struct.Point, align 8
  call void @bar()
  %p_x = getelementptr inbounds %struct.Point* %p0, i32 0, i32 0
  store i64 0, i64* %p_x, align 8
  %p_y = getelementptr inbounds %struct.Point* %p0, i32 0, i32 1
  store i64 1, i64* %p_y, align 8
  %p_x1 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 0
  store i64 -1, i64* %p_x1, align 8
  %p_y2 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 1
  store i64 0, i64* %p_y2, align 8
  %p_x3 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 0
  store i64 1, i64* %p_x3, align 8
  %p_y4 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 1
  store i64 -1, i64* %p_y4, align 8
  %p_x5 = getelementptr inbounds %struct.Point* %p3, i32 0, i32 0
  store i64 -1, i64* %p_x5, align 8
  %p_y6 = getelementptr inbounds %struct.Point* %p3, i32 0, i32 1
  store i64 1, i64* %p_y6, align 8
  %p_x7 = getelementptr inbounds %struct.Point* %p4, i32 0, i32 0
  store i64 0, i64* %p_x7, align 8
  %p_y8 = getelementptr inbounds %struct.Point* %p4, i32 0, i32 1
  store i64 -1, i64* %p_y8, align 8
  %p_x9 = getelementptr inbounds %struct.Point* %p5, i32 0, i32 0
  store i64 1, i64* %p_x9, align 8
  %p_y10 = getelementptr inbounds %struct.Point* %p5, i32 0, i32 1
  store i64 0, i64* %p_y10, align 8
  %0 = bitcast %struct.Point* %p0 to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  %2 = load i64* %1, align 1
  %3 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  %4 = load i64* %3, align 1
  %5 = bitcast %struct.Point* %p1 to { i64, i64 }*
  %6 = getelementptr { i64, i64 }* %5, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr { i64, i64 }* %5, i32 0, i32 1
  %9 = load i64* %8, align 1
  %10 = bitcast %struct.Point* %p2 to { i64, i64 }*
  %11 = getelementptr { i64, i64 }* %10, i32 0, i32 0
  %12 = load i64* %11, align 1
  %13 = getelementptr { i64, i64 }* %10, i32 0, i32 1
  %14 = load i64* %13, align 1
  call void (...)* bitcast (void (i64, i64, i64, i64, i64, i64, %struct.Point*, %struct.Point*, %struct.Point*)* @f to void (...)*)(i64 %2, i64 %4, i64 %7, i64 %9, i64 %12, i64 %14, %struct.Point* byval align 8 %p3, %struct.Point* byval align 8 %p4, %struct.Point* byval align 8 %p5)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
