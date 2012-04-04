; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/usmul.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i16 signext %x, i16 zeroext %y) nounwind uwtable noinline {
entry:
  %x.addr = alloca i16, align 2
  %y.addr = alloca i16, align 2
  store i16 %x, i16* %x.addr, align 2
  store i16 %y, i16* %y.addr, align 2
  %0 = load i16* %x.addr, align 2
  %conv = sext i16 %0 to i32
  %1 = load i16* %y.addr, align 2
  %conv1 = zext i16 %1 to i32
  %mul = mul nsw i32 %conv, %conv1
  ret i32 %mul
}

define i32 @bar(i16 zeroext %x, i16 signext %y) nounwind uwtable noinline {
entry:
  %x.addr = alloca i16, align 2
  %y.addr = alloca i16, align 2
  store i16 %x, i16* %x.addr, align 2
  store i16 %y, i16* %y.addr, align 2
  %0 = load i16* %x.addr, align 2
  %conv = zext i16 %0 to i32
  %1 = load i16* %y.addr, align 2
  %conv1 = sext i16 %1 to i32
  %mul = mul nsw i32 %conv, %conv1
  ret i32 %mul
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i16 signext -2, i16 zeroext -1)
  %cmp = icmp ne i32 %call, -131070
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @foo(i16 signext 2, i16 zeroext -1)
  %cmp2 = icmp ne i32 %call1, 131070
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @foo(i16 signext -32768, i16 zeroext -32768)
  %cmp6 = icmp ne i32 %call5, -1073741824
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 @foo(i16 signext 32767, i16 zeroext -32768)
  %cmp10 = icmp ne i32 %call9, 1073709056
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i32 @bar(i16 zeroext -1, i16 signext -2)
  %cmp14 = icmp ne i32 %call13, -131070
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call i32 @bar(i16 zeroext -1, i16 signext 2)
  %cmp18 = icmp ne i32 %call17, 131070
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call i32 @bar(i16 zeroext -32768, i16 signext -32768)
  %cmp22 = icmp ne i32 %call21, -1073741824
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call i32 @bar(i16 zeroext -32768, i16 signext 32767)
  %cmp26 = icmp ne i32 %call25, 1073709056
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
