; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/shiftopt-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @utest(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %shr = lshr i32 %0, 0
  %1 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %shr, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @link_error()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32* %x.addr, align 4
  %shl = shl i32 %2, 0
  %3 = load i32* %x.addr, align 4
  %cmp1 = icmp ne i32 %shl, %3
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @link_error()
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %4 = load i32* %x.addr, align 4
  %shl4 = shl i32 0, %4
  %cmp5 = icmp ne i32 %shl4, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end3
  call void @link_error()
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end3
  %5 = load i32* %x.addr, align 4
  %shr8 = ashr i32 0, %5
  %cmp9 = icmp ne i32 %shr8, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end7
  call void @link_error()
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end7
  %6 = load i32* %x.addr, align 4
  %shr12 = ashr i32 -1, %6
  %cmp13 = icmp ne i32 %shr12, -1
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end11
  call void @link_error()
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end11
  %7 = load i32* %x.addr, align 4
  %shr16 = ashr i32 -1, %7
  %cmp17 = icmp ne i32 %shr16, -1
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end15
  call void @link_error()
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.end15
  ret void
}

define void @link_error() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define void @stest(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %shr = ashr i32 %0, 0
  %1 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %shr, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @link_error()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32* %x.addr, align 4
  %shl = shl i32 %2, 0
  %3 = load i32* %x.addr, align 4
  %cmp1 = icmp ne i32 %shl, %3
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @link_error()
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %4 = load i32* %x.addr, align 4
  %shl4 = shl i32 0, %4
  %cmp5 = icmp ne i32 %shl4, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end3
  call void @link_error()
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end3
  %5 = load i32* %x.addr, align 4
  %shr8 = ashr i32 0, %5
  %cmp9 = icmp ne i32 %shr8, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end7
  call void @link_error()
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end7
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @utest(i32 9)
  call void @utest(i32 0)
  call void @stest(i32 9)
  call void @stest(i32 0)
  ret i32 0
}

declare void @abort() noreturn nounwind
