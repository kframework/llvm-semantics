; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040307-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i8, [3 x i8] }

@main.sdata = private unnamed_addr constant %struct.anon { i8 1, [3 x i8] undef }, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %b = alloca i32, align 4
  %sdata = alloca %struct.anon, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %b, align 4
  %0 = bitcast %struct.anon* %sdata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds (%struct.anon* @main.sdata, i32 0, i32 0), i64 4, i32 4, i1 false)
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %1 = bitcast %struct.anon* %sdata to i32*
  %2 = load i32* %1, align 4
  %bf.clear = and i32 %2, 1
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 1
  %3 = bitcast %struct.anon* %sdata to i32*
  %4 = and i32 %bf.value, 1
  %5 = load i32* %3, align 4
  %6 = and i32 %5, -2
  %7 = or i32 %6, %4
  store i32 %7, i32* %3, align 4
  %cmp = icmp ugt i32 %bf.clear, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i32* %b, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %b, align 4
  %9 = load i32* %b, align 4
  %cmp1 = icmp sgt i32 %9, 100
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  %10 = load i32* %b, align 4
  %cmp2 = icmp ne i32 %10, 1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %while.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %while.end
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
