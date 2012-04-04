; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/981001-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@flg = global i64 0, align 8

define i64 @sub(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %n.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32* %n.addr, align 4
  %cmp = icmp sge i32 %0, 2
  br i1 %cmp, label %if.then, label %if.else19

if.then:                                          ; preds = %entry
  %1 = load i32* %n.addr, align 4
  %rem = srem i32 %1, 2
  %cmp1 = icmp eq i32 %rem, 0
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %2 = load i32* %n.addr, align 4
  %div = sdiv i32 %2, 2
  %call = call i64 @sub(i32 %div)
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* %a, align 4
  %3 = load i32* %a, align 4
  %conv3 = sext i32 %3 to i64
  %4 = load i32* %n.addr, align 4
  %div4 = sdiv i32 %4, 2
  %sub = sub nsw i32 %div4, 1
  %call5 = call i64 @sub(i32 %sub)
  %mul = mul nsw i64 2, %call5
  %add = add nsw i64 %conv3, %mul
  %5 = load i32* %a, align 4
  %conv6 = sext i32 %5 to i64
  %mul7 = mul nsw i64 %add, %conv6
  store i64 %mul7, i64* %retval
  br label %return

if.else:                                          ; preds = %if.then
  %6 = load i32* %n.addr, align 4
  %div8 = sdiv i32 %6, 2
  %add9 = add nsw i32 %div8, 1
  %call10 = call i64 @sub(i32 %add9)
  %conv11 = trunc i64 %call10 to i32
  store i32 %conv11, i32* %a, align 4
  %7 = load i32* %n.addr, align 4
  %div12 = sdiv i32 %7, 2
  %call13 = call i64 @sub(i32 %div12)
  %conv14 = trunc i64 %call13 to i32
  store i32 %conv14, i32* %b, align 4
  %8 = load i32* %a, align 4
  %9 = load i32* %a, align 4
  %mul15 = mul nsw i32 %8, %9
  %10 = load i32* %b, align 4
  %11 = load i32* %b, align 4
  %mul16 = mul nsw i32 %10, %11
  %add17 = add nsw i32 %mul15, %mul16
  %conv18 = sext i32 %add17 to i64
  store i64 %conv18, i64* %retval
  br label %return

if.else19:                                        ; preds = %entry
  %12 = load i32* %n.addr, align 4
  %conv20 = sext i32 %12 to i64
  store i64 %conv20, i64* %retval
  br label %return

return:                                           ; preds = %if.else19, %if.else, %if.then2
  %13 = load i64* %retval
  ret i64 %13
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @sub(i32 30)
  %cmp = icmp ne i64 %call, 832040
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load i64* @flg, align 8
  %or = or i64 %0, 256
  store i64 %or, i64* @flg, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i64* @flg, align 8
  %tobool = icmp ne i64 %1, 0
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end2:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
