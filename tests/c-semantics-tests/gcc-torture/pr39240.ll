; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr39240.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@l1 = global i64 4294967292, align 8
@l2 = global i64 65532, align 8
@l3 = global i64 252, align 8
@l4 = global i64 -4, align 8
@l5 = global i64 -4, align 8
@l6 = global i64 -4, align 8

define i32 @bar1(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %add = add nsw i32 %0, 6
  %call = call i32 @foo1(i32 %add)
  ret i32 %call
}

define internal i32 @foo1(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  ret i32 %0
}

define zeroext i16 @bar2(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %add = add nsw i32 %0, 6
  %call = call signext i16 @foo2(i32 %add)
  ret i16 %call
}

define internal signext i16 @foo2(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %conv = trunc i32 %0 to i16
  ret i16 %conv
}

define zeroext i8 @bar3(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %add = add nsw i32 %0, 6
  %call = call signext i8 @foo3(i32 %add)
  ret i8 %call
}

define internal signext i8 @foo3(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %conv = trunc i32 %0 to i8
  ret i8 %conv
}

define i32 @bar4(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %add = add nsw i32 %0, 6
  %call = call i32 @foo4(i32 %add)
  ret i32 %call
}

define internal i32 @foo4(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  ret i32 %0
}

define signext i16 @bar5(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %add = add nsw i32 %0, 6
  %call = call zeroext i16 @foo5(i32 %add)
  ret i16 %call
}

define internal zeroext i16 @foo5(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %conv = trunc i32 %0 to i16
  ret i16 %conv
}

define signext i8 @bar6(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %add = add nsw i32 %0, 6
  %call = call zeroext i8 @foo6(i32 %add)
  ret i8 %call
}

define internal zeroext i8 @foo6(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %conv = trunc i32 %0 to i8
  ret i8 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @bar1(i32 -10)
  %conv = zext i32 %call to i64
  %0 = load volatile i64* @l1, align 8
  %cmp = icmp ne i64 %conv, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call2 = call zeroext i16 @bar2(i32 -10)
  %conv3 = zext i16 %call2 to i64
  %1 = load volatile i64* @l2, align 8
  %cmp4 = icmp ne i64 %conv3, %1
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  %call8 = call zeroext i8 @bar3(i32 -10)
  %conv9 = zext i8 %call8 to i64
  %2 = load volatile i64* @l3, align 8
  %cmp10 = icmp ne i64 %conv9, %2
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end7
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end7
  %call14 = call i32 @bar4(i32 -10)
  %conv15 = sext i32 %call14 to i64
  %3 = load volatile i64* @l4, align 8
  %cmp16 = icmp ne i64 %conv15, %3
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end13
  %call20 = call signext i16 @bar5(i32 -10)
  %conv21 = sext i16 %call20 to i64
  %4 = load volatile i64* @l5, align 8
  %cmp22 = icmp ne i64 %conv21, %4
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end19
  call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end19
  %call26 = call signext i8 @bar6(i32 -10)
  %conv27 = sext i8 %call26 to i64
  %5 = load volatile i64* @l6, align 8
  %cmp28 = icmp ne i64 %conv27, %5
  br i1 %cmp28, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end25
  call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %if.end25
  ret i32 0
}

declare void @abort() noreturn nounwind
