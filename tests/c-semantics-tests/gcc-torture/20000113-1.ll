; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.x = type { i8, [3 x i8] }

define void @foobar(i32 %x, i32 %y, i32 %z) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %z.addr = alloca i32, align 4
  %a = alloca %struct.x, align 4
  %b = alloca %struct.x, align 4
  %c = alloca %struct.x*, align 8
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %z, i32* %z.addr, align 4
  %0 = load i32* %x.addr, align 4
  %bf.value = and i32 %0, 1
  %1 = bitcast %struct.x* %a to i32*
  %2 = and i32 %bf.value, 1
  %3 = load i32* %1, align 4
  %4 = and i32 %3, -2
  %5 = or i32 %4, %2
  store i32 %5, i32* %1, align 4
  %6 = load i32* %y.addr, align 4
  %bf.value1 = and i32 %6, 3
  %7 = bitcast %struct.x* %a to i32*
  %8 = and i32 %bf.value1, 3
  %9 = shl i32 %8, 1
  %10 = load i32* %7, align 4
  %11 = and i32 %10, -7
  %12 = or i32 %11, %9
  store i32 %12, i32* %7, align 4
  %13 = load i32* %z.addr, align 4
  %bf.value2 = and i32 %13, 7
  %14 = bitcast %struct.x* %a to i32*
  %15 = and i32 %bf.value2, 7
  %16 = shl i32 %15, 3
  %17 = load i32* %14, align 4
  %18 = and i32 %17, -57
  %19 = or i32 %18, %16
  store i32 %19, i32* %14, align 4
  %20 = load i32* %x.addr, align 4
  %bf.value3 = and i32 %20, 1
  %21 = bitcast %struct.x* %b to i32*
  %22 = and i32 %bf.value3, 1
  %23 = load i32* %21, align 4
  %24 = and i32 %23, -2
  %25 = or i32 %24, %22
  store i32 %25, i32* %21, align 4
  %26 = load i32* %y.addr, align 4
  %bf.value4 = and i32 %26, 3
  %27 = bitcast %struct.x* %b to i32*
  %28 = and i32 %bf.value4, 3
  %29 = shl i32 %28, 1
  %30 = load i32* %27, align 4
  %31 = and i32 %30, -7
  %32 = or i32 %31, %29
  store i32 %32, i32* %27, align 4
  %33 = load i32* %z.addr, align 4
  %bf.value5 = and i32 %33, 7
  %34 = bitcast %struct.x* %b to i32*
  %35 = and i32 %bf.value5, 7
  %36 = shl i32 %35, 3
  %37 = load i32* %34, align 4
  %38 = and i32 %37, -57
  %39 = or i32 %38, %36
  store i32 %39, i32* %34, align 4
  store %struct.x* %b, %struct.x** %c, align 8
  %40 = bitcast %struct.x* %a to i32*
  %41 = load i32* %40, align 4
  %42 = lshr i32 %41, 1
  %bf.clear = and i32 %42, 3
  %43 = bitcast %struct.x* %a to i32*
  %44 = load i32* %43, align 4
  %bf.clear6 = and i32 %44, 1
  %sub = sub nsw i32 %bf.clear, %bf.clear6
  %45 = load %struct.x** %c, align 8
  %46 = bitcast %struct.x* %45 to i32*
  %47 = load i32* %46, align 4
  %48 = lshr i32 %47, 1
  %bf.clear7 = and i32 %48, 3
  %mul = mul nsw i32 %sub, %bf.clear7
  %49 = load %struct.x** %c, align 8
  %50 = bitcast %struct.x* %49 to i32*
  %51 = load i32* %50, align 4
  %52 = lshr i32 %51, 3
  %bf.clear8 = and i32 %52, 7
  %add = add nsw i32 %bf.clear8, %mul
  %bf.value9 = and i32 %add, 7
  %53 = bitcast %struct.x* %49 to i32*
  %54 = and i32 %bf.value9, 7
  %55 = shl i32 %54, 3
  %56 = load i32* %53, align 4
  %57 = and i32 %56, -57
  %58 = or i32 %57, %55
  store i32 %58, i32* %53, align 4
  %59 = bitcast %struct.x* %a to i32*
  %60 = load i32* %59, align 4
  %bf.clear10 = and i32 %60, 1
  %cmp = icmp ne i32 %bf.clear10, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %61 = load %struct.x** %c, align 8
  %62 = bitcast %struct.x* %61 to i32*
  %63 = load i32* %62, align 4
  %64 = lshr i32 %63, 3
  %bf.clear11 = and i32 %64, 7
  %cmp12 = icmp ne i32 %bf.clear11, 5
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  call void @foobar(i32 1, i32 2, i32 3)
  ret i32 0
}
