; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000726-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.adjust_template = type { i16, i16, i16, i16 }

@adjust = internal global %struct.adjust_template { i16 0, i16 0, i16 1, i16 1 }, align 2

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i16, align 2
  %y = alloca i16, align 2
  store i32 0, i32* %retval
  store i16 1, i16* %x, align 2
  store i16 1, i16* %y, align 2
  call void @adjust_xy(i16* %x, i16* %y)
  %0 = load i16* %x, align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

define void @adjust_xy(i16* %x, i16* %y) nounwind uwtable {
entry:
  %x.addr = alloca i16*, align 8
  %y.addr = alloca i16*, align 8
  store i16* %x, i16** %x.addr, align 8
  store i16* %y, i16** %y.addr, align 8
  %0 = load i16* getelementptr inbounds (%struct.adjust_template* @adjust, i32 0, i32 0), align 2
  %conv = sext i16 %0 to i32
  %1 = load i16** %x.addr, align 8
  %2 = load i16* %1, align 2
  %conv1 = sext i16 %2 to i32
  %mul = mul nsw i32 %conv, %conv1
  %3 = load i16* getelementptr inbounds (%struct.adjust_template* @adjust, i32 0, i32 1), align 2
  %conv2 = sext i16 %3 to i32
  %4 = load i16** %y.addr, align 8
  %5 = load i16* %4, align 2
  %conv3 = sext i16 %5 to i32
  %mul4 = mul nsw i32 %conv2, %conv3
  %add = add nsw i32 %mul, %mul4
  %6 = load i16* getelementptr inbounds (%struct.adjust_template* @adjust, i32 0, i32 2), align 2
  %conv5 = sext i16 %6 to i32
  %add6 = add nsw i32 %add, %conv5
  %conv7 = trunc i32 %add6 to i16
  %7 = load i16** %x.addr, align 8
  store i16 %conv7, i16* %7, align 2
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
