; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950607-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Point = type { i64, i64 }

define i32 @f(i64 %basePt.coerce0, i64 %basePt.coerce1, i64 %pt1.coerce0, i64 %pt1.coerce1, i64 %pt2.coerce0, i64 %pt2.coerce1) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %basePt = alloca %struct.Point, align 8
  %pt1 = alloca %struct.Point, align 8
  %pt2 = alloca %struct.Point, align 8
  %vector = alloca i64, align 8
  %0 = bitcast %struct.Point* %basePt to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %basePt.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %basePt.coerce1, i64* %2
  %3 = bitcast %struct.Point* %pt1 to { i64, i64 }*
  %4 = getelementptr { i64, i64 }* %3, i32 0, i32 0
  store i64 %pt1.coerce0, i64* %4
  %5 = getelementptr { i64, i64 }* %3, i32 0, i32 1
  store i64 %pt1.coerce1, i64* %5
  %6 = bitcast %struct.Point* %pt2 to { i64, i64 }*
  %7 = getelementptr { i64, i64 }* %6, i32 0, i32 0
  store i64 %pt2.coerce0, i64* %7
  %8 = getelementptr { i64, i64 }* %6, i32 0, i32 1
  store i64 %pt2.coerce1, i64* %8
  %p_x = getelementptr inbounds %struct.Point* %pt1, i32 0, i32 0
  %9 = load i64* %p_x, align 8
  %p_x1 = getelementptr inbounds %struct.Point* %basePt, i32 0, i32 0
  %10 = load i64* %p_x1, align 8
  %sub = sub nsw i64 %9, %10
  %p_y = getelementptr inbounds %struct.Point* %pt2, i32 0, i32 1
  %11 = load i64* %p_y, align 8
  %p_y2 = getelementptr inbounds %struct.Point* %basePt, i32 0, i32 1
  %12 = load i64* %p_y2, align 8
  %sub3 = sub nsw i64 %11, %12
  %mul = mul nsw i64 %sub, %sub3
  %p_y4 = getelementptr inbounds %struct.Point* %pt1, i32 0, i32 1
  %13 = load i64* %p_y4, align 8
  %p_y5 = getelementptr inbounds %struct.Point* %basePt, i32 0, i32 1
  %14 = load i64* %p_y5, align 8
  %sub6 = sub nsw i64 %13, %14
  %p_x7 = getelementptr inbounds %struct.Point* %pt2, i32 0, i32 0
  %15 = load i64* %p_x7, align 8
  %p_x8 = getelementptr inbounds %struct.Point* %basePt, i32 0, i32 0
  %16 = load i64* %p_x8, align 8
  %sub9 = sub nsw i64 %15, %16
  %mul10 = mul nsw i64 %sub6, %sub9
  %sub11 = sub nsw i64 %mul, %mul10
  store i64 %sub11, i64* %vector, align 8
  %17 = load i64* %vector, align 8
  %cmp = icmp sgt i64 %17, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %18 = load i64* %vector, align 8
  %cmp12 = icmp slt i64 %18, 0
  br i1 %cmp12, label %if.then13, label %if.else14

if.then13:                                        ; preds = %if.else
  store i32 1, i32* %retval
  br label %return

if.else14:                                        ; preds = %if.else
  store i32 2, i32* %retval
  br label %return

return:                                           ; preds = %if.else14, %if.then13, %if.then
  %19 = load i32* %retval
  ret i32 %19
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %b = alloca %struct.Point, align 8
  %p1 = alloca %struct.Point, align 8
  %p2 = alloca %struct.Point, align 8
  %answer = alloca i32, align 4
  store i32 0, i32* %retval
  %p_x = getelementptr inbounds %struct.Point* %b, i32 0, i32 0
  store i64 -23250, i64* %p_x, align 8
  %p_y = getelementptr inbounds %struct.Point* %b, i32 0, i32 1
  store i64 23250, i64* %p_y, align 8
  %p_x1 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 0
  store i64 23250, i64* %p_x1, align 8
  %p_y2 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 1
  store i64 -23250, i64* %p_y2, align 8
  %p_x3 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 0
  store i64 -23250, i64* %p_x3, align 8
  %p_y4 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 1
  store i64 -23250, i64* %p_y4, align 8
  %0 = bitcast %struct.Point* %b to { i64, i64 }*
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
  %call = call i32 @f(i64 %2, i64 %4, i64 %7, i64 %9, i64 %12, i64 %14)
  store i32 %call, i32* %answer, align 4
  %15 = load i32* %answer, align 4
  %cmp = icmp ne i32 %15, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %16 = load i32* %retval
  ret i32 %16
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
