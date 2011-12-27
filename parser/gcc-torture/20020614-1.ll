; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020614-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i8, align 1
  %k = alloca i8, align 1
  store i32 0, i32* %retval
  store i32 127, i32* %i, align 4
  %tmp = load i32* %i, align 4
  %shl = shl i32 %tmp, 1
  %conv = trunc i32 %shl to i8
  %conv1 = sext i8 %conv to i32
  %div = sdiv i32 %conv1, 2
  %conv2 = trunc i32 %div to i8
  store i8 %conv2, i8* %j, align 1
  %tmp3 = load i8* %j, align 1
  %conv4 = sext i8 %tmp3 to i32
  %cmp = icmp ne i32 %conv4, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %tmp6 = load i32* %i, align 4
  %mul = mul nsw i32 %tmp6, 2
  %conv7 = trunc i32 %mul to i8
  %conv8 = sext i8 %conv7 to i32
  %div9 = sdiv i32 %conv8, 2
  %conv10 = trunc i32 %div9 to i8
  store i8 %conv10, i8* %j, align 1
  %tmp11 = load i8* %j, align 1
  %conv12 = sext i8 %tmp11 to i32
  %cmp13 = icmp ne i32 %conv12, -1
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end16:                                         ; preds = %if.end
  store i32 255, i32* %i, align 4
  %tmp17 = load i32* %i, align 4
  %shl18 = shl i32 %tmp17, 1
  %conv19 = trunc i32 %shl18 to i8
  %conv20 = zext i8 %conv19 to i32
  %div21 = sdiv i32 %conv20, 2
  %conv22 = trunc i32 %div21 to i8
  store i8 %conv22, i8* %k, align 1
  %tmp23 = load i8* %k, align 1
  %conv24 = zext i8 %tmp23 to i32
  %cmp25 = icmp ne i32 %conv24, 127
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end16
  call void @abort() noreturn
  unreachable

if.end28:                                         ; preds = %if.end16
  %tmp29 = load i32* %i, align 4
  %mul30 = mul nsw i32 %tmp29, 2
  %conv31 = trunc i32 %mul30 to i8
  %conv32 = zext i8 %conv31 to i32
  %div33 = sdiv i32 %conv32, 2
  %conv34 = trunc i32 %div33 to i8
  store i8 %conv34, i8* %k, align 1
  %tmp35 = load i8* %k, align 1
  %conv36 = zext i8 %tmp35 to i32
  %cmp37 = icmp ne i32 %conv36, 127
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end28
  call void @abort() noreturn
  unreachable

if.end40:                                         ; preds = %if.end28
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
