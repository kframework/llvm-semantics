; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/bf-sign-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i8, i8, [2 x i8] }

@main.x = private unnamed_addr constant %struct.anon { i8 -1, i8 1, [2 x i8] undef }, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.anon, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.anon* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds (%struct.anon* @main.x, i32 0, i32 0), i64 4, i32 4, i1 false)
  %1 = bitcast %struct.anon* %x to i32*
  %2 = load i32* %1, align 4
  %3 = lshr i32 %2, 3
  %bf.clear = and i32 %3, 7
  %cmp = icmp ne i32 %bf.clear, 7
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %4 = bitcast %struct.anon* %x to i32*
  %5 = load i32* %4, align 4
  %bf.clear1 = and i32 %5, 7
  %6 = shl i32 %bf.clear1, 29
  %bf.val.sext = ashr i32 %6, 29
  %cmp2 = icmp ne i32 %bf.val.sext, -1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %7 = bitcast %struct.anon* %x to i32*
  %8 = load i32* %7, align 4
  %9 = lshr i32 %8, 6
  %bf.clear5 = and i32 %9, 7
  %10 = shl i32 %bf.clear5, 29
  %bf.val.sext6 = ashr i32 %10, 29
  %cmp7 = icmp ne i32 %bf.val.sext6, -1
  br i1 %cmp7, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %if.end4
  %11 = bitcast %struct.anon* %x to i32*
  %12 = load i32* %11, align 4
  %13 = lshr i32 %12, 6
  %bf.clear8 = and i32 %13, 7
  %14 = shl i32 %bf.clear8, 29
  %bf.val.sext9 = ashr i32 %14, 29
  %cmp10 = icmp ne i32 %bf.val.sext9, 7
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %land.lhs.true, %if.end4
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %15 = load i32* %retval
  ret i32 %15
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
