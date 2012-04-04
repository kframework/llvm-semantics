; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/divmod-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @div1(i8 signext %x) nounwind uwtable {
entry:
  %x.addr = alloca i8, align 1
  store i8 %x, i8* %x.addr, align 1
  %0 = load i8* %x.addr, align 1
  %conv = sext i8 %0 to i32
  %div = sdiv i32 %conv, -1
  ret i32 %div
}

define i32 @div2(i16 signext %x) nounwind uwtable {
entry:
  %x.addr = alloca i16, align 2
  store i16 %x, i16* %x.addr, align 2
  %0 = load i16* %x.addr, align 2
  %conv = sext i16 %0 to i32
  %div = sdiv i32 %conv, -1
  ret i32 %div
}

define i32 @div3(i8 signext %x, i8 signext %y) nounwind uwtable {
entry:
  %x.addr = alloca i8, align 1
  %y.addr = alloca i8, align 1
  store i8 %x, i8* %x.addr, align 1
  store i8 %y, i8* %y.addr, align 1
  %0 = load i8* %x.addr, align 1
  %conv = sext i8 %0 to i32
  %1 = load i8* %y.addr, align 1
  %conv1 = sext i8 %1 to i32
  %div = sdiv i32 %conv, %conv1
  ret i32 %div
}

define i32 @div4(i16 signext %x, i16 signext %y) nounwind uwtable {
entry:
  %x.addr = alloca i16, align 2
  %y.addr = alloca i16, align 2
  store i16 %x, i16* %x.addr, align 2
  store i16 %y, i16* %y.addr, align 2
  %0 = load i16* %x.addr, align 2
  %conv = sext i16 %0 to i32
  %1 = load i16* %y.addr, align 2
  %conv1 = sext i16 %1 to i32
  %div = sdiv i32 %conv, %conv1
  ret i32 %div
}

define i32 @mod1(i8 signext %x) nounwind uwtable {
entry:
  %x.addr = alloca i8, align 1
  store i8 %x, i8* %x.addr, align 1
  %0 = load i8* %x.addr, align 1
  %conv = sext i8 %0 to i32
  %rem = srem i32 %conv, -1
  ret i32 %rem
}

define i32 @mod2(i16 signext %x) nounwind uwtable {
entry:
  %x.addr = alloca i16, align 2
  store i16 %x, i16* %x.addr, align 2
  %0 = load i16* %x.addr, align 2
  %conv = sext i16 %0 to i32
  %rem = srem i32 %conv, -1
  ret i32 %rem
}

define i32 @mod3(i8 signext %x, i8 signext %y) nounwind uwtable {
entry:
  %x.addr = alloca i8, align 1
  %y.addr = alloca i8, align 1
  store i8 %x, i8* %x.addr, align 1
  store i8 %y, i8* %y.addr, align 1
  %0 = load i8* %x.addr, align 1
  %conv = sext i8 %0 to i32
  %1 = load i8* %y.addr, align 1
  %conv1 = sext i8 %1 to i32
  %rem = srem i32 %conv, %conv1
  ret i32 %rem
}

define i32 @mod4(i16 signext %x, i16 signext %y) nounwind uwtable {
entry:
  %x.addr = alloca i16, align 2
  %y.addr = alloca i16, align 2
  store i16 %x, i16* %x.addr, align 2
  store i16 %y, i16* %y.addr, align 2
  %0 = load i16* %x.addr, align 2
  %conv = sext i16 %0 to i32
  %1 = load i16* %y.addr, align 2
  %conv1 = sext i16 %1 to i32
  %rem = srem i32 %conv, %conv1
  ret i32 %rem
}

define i64 @mod5(i64 %x, i64 %y) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %rem = srem i64 %0, %1
  ret i64 %rem
}

define i64 @mod6(i64 %x, i64 %y) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %rem = urem i64 %0, %1
  ret i64 %rem
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @div1(i8 signext -128)
  %cmp = icmp ne i32 %call, 128
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @div2(i16 signext -32768)
  %cmp2 = icmp ne i32 %call1, 32768
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @div3(i8 signext -128, i8 signext -1)
  %cmp6 = icmp ne i32 %call5, 128
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 @div4(i16 signext -32768, i16 signext -1)
  %cmp10 = icmp ne i32 %call9, 32768
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i32 @mod1(i8 signext -128)
  %cmp14 = icmp ne i32 %call13, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call i32 @mod2(i16 signext -32768)
  %cmp18 = icmp ne i32 %call17, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call i32 @mod3(i8 signext -128, i8 signext -1)
  %cmp22 = icmp ne i32 %call21, 0
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call i32 @mod4(i16 signext -32768, i16 signext -1)
  %cmp26 = icmp ne i32 %call25, 0
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = call i64 @mod5(i64 1342177280, i64 2)
  %cmp30 = icmp ne i64 %call29, 0
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = call i64 @mod6(i64 1342177280, i64 2)
  %cmp34 = icmp ne i64 %call33, 0
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
