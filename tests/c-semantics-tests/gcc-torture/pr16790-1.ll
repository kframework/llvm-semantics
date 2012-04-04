; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr16790-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test1(i32 16384)
  call void @test2(i32 16384)
  ret i32 0
}

define internal void @test1(i32 %u1) nounwind uwtable {
entry:
  %u1.addr = alloca i32, align 4
  %y_final_1 = alloca i32, align 4
  %y_middle = alloca i16, align 2
  %y_final_2 = alloca i32, align 4
  store i32 %u1, i32* %u1.addr, align 4
  %0 = load i32* %u1.addr, align 4
  %mul = mul i32 %0, 2
  %conv = trunc i32 %mul to i16
  %conv1 = sext i16 %conv to i32
  %mul2 = mul nsw i32 %conv1, 3
  store i32 %mul2, i32* %y_final_1, align 4
  %1 = load i32* %u1.addr, align 4
  %mul3 = mul i32 %1, 2
  %conv4 = trunc i32 %mul3 to i16
  store i16 %conv4, i16* %y_middle, align 2
  %2 = load i16* %y_middle, align 2
  %conv5 = sext i16 %2 to i32
  %mul6 = mul nsw i32 %conv5, 3
  store i32 %mul6, i32* %y_final_2, align 4
  %3 = load i32* %y_final_1, align 4
  %4 = load i32* %y_final_2, align 4
  %cmp = icmp ne i32 %3, %4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define internal void @test2(i32 %u1) nounwind uwtable {
entry:
  %u1.addr = alloca i32, align 4
  %y_final_1 = alloca i32, align 4
  %y_middle = alloca i16, align 2
  %y_final_2 = alloca i32, align 4
  store i32 %u1, i32* %u1.addr, align 4
  %0 = load i32* %u1.addr, align 4
  %shl = shl i32 %0, 1
  %conv = trunc i32 %shl to i16
  %conv1 = sext i16 %conv to i32
  %mul = mul nsw i32 %conv1, 3
  store i32 %mul, i32* %y_final_1, align 4
  %1 = load i32* %u1.addr, align 4
  %shl2 = shl i32 %1, 1
  %conv3 = trunc i32 %shl2 to i16
  store i16 %conv3, i16* %y_middle, align 2
  %2 = load i16* %y_middle, align 2
  %conv4 = sext i16 %2 to i32
  %mul5 = mul nsw i32 %conv4, 3
  store i32 %mul5, i32* %y_final_2, align 4
  %3 = load i32* %y_final_1, align 4
  %4 = load i32* %y_final_2, align 4
  %cmp = icmp ne i32 %3, %4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind
