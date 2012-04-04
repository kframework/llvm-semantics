; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020614-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i8, align 1
  %k = alloca i8, align 1
  store i32 0, i32* %retval
  store i32 127, i32* %i, align 4
  %0 = load i32* %i, align 4
  %shl = shl i32 %0, 1
  %conv = trunc i32 %shl to i8
  %conv1 = sext i8 %conv to i32
  %div = sdiv i32 %conv1, 2
  %conv2 = trunc i32 %div to i8
  store i8 %conv2, i8* %j, align 1
  %1 = load i8* %j, align 1
  %conv3 = sext i8 %1 to i32
  %cmp = icmp ne i32 %conv3, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i32* %i, align 4
  %mul = mul nsw i32 %2, 2
  %conv5 = trunc i32 %mul to i8
  %conv6 = sext i8 %conv5 to i32
  %div7 = sdiv i32 %conv6, 2
  %conv8 = trunc i32 %div7 to i8
  store i8 %conv8, i8* %j, align 1
  %3 = load i8* %j, align 1
  %conv9 = sext i8 %3 to i32
  %cmp10 = icmp ne i32 %conv9, -1
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end13:                                         ; preds = %if.end
  store i32 255, i32* %i, align 4
  %4 = load i32* %i, align 4
  %shl14 = shl i32 %4, 1
  %conv15 = trunc i32 %shl14 to i8
  %conv16 = zext i8 %conv15 to i32
  %div17 = sdiv i32 %conv16, 2
  %conv18 = trunc i32 %div17 to i8
  store i8 %conv18, i8* %k, align 1
  %5 = load i8* %k, align 1
  %conv19 = zext i8 %5 to i32
  %cmp20 = icmp ne i32 %conv19, 127
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end13
  call void @abort() noreturn
  unreachable

if.end23:                                         ; preds = %if.end13
  %6 = load i32* %i, align 4
  %mul24 = mul nsw i32 %6, 2
  %conv25 = trunc i32 %mul24 to i8
  %conv26 = zext i8 %conv25 to i32
  %div27 = sdiv i32 %conv26, 2
  %conv28 = trunc i32 %div27 to i8
  store i8 %conv28, i8* %k, align 1
  %7 = load i8* %k, align 1
  %conv29 = zext i8 %7 to i32
  %cmp30 = icmp ne i32 %conv29, 127
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end23
  call void @abort() noreturn
  unreachable

if.end33:                                         ; preds = %if.end23
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
