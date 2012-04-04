; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921029-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@hpart = common global i64 0, align 8
@lpart = common global i64 0, align 8
@back = common global i64 0, align 8

define i64 @build(i64 %h, i64 %l) nounwind uwtable {
entry:
  %h.addr = alloca i64, align 8
  %l.addr = alloca i64, align 8
  store i64 %h, i64* %h.addr, align 8
  store i64 %l, i64* %l.addr, align 8
  %0 = load i64* %h.addr, align 8
  store i64 %0, i64* @hpart, align 8
  %1 = load i64* @hpart, align 8
  %shl = shl i64 %1, 32
  store i64 %shl, i64* @hpart, align 8
  %2 = load i64* %l.addr, align 8
  store i64 %2, i64* @lpart, align 8
  %3 = load i64* @lpart, align 8
  %and = and i64 %3, 4294967295
  store i64 %and, i64* @lpart, align 8
  %4 = load i64* @hpart, align 8
  %5 = load i64* @lpart, align 8
  %or = or i64 %4, %5
  store i64 %or, i64* @back, align 8
  %6 = load i64* @back, align 8
  ret i64 %6
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @build(i64 0, i64 1)
  %cmp = icmp ne i64 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i64 @build(i64 0, i64 0)
  %cmp2 = icmp ne i64 %call1, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i64 @build(i64 0, i64 4294967295)
  %cmp6 = icmp ne i64 %call5, 4294967295
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i64 @build(i64 0, i64 4294967294)
  %cmp10 = icmp ne i64 %call9, 4294967294
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i64 @build(i64 1, i64 1)
  %cmp14 = icmp ne i64 %call13, 4294967297
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call i64 @build(i64 1, i64 0)
  %cmp18 = icmp ne i64 %call17, 4294967296
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call i64 @build(i64 1, i64 4294967295)
  %cmp22 = icmp ne i64 %call21, 8589934591
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call i64 @build(i64 1, i64 4294967294)
  %cmp26 = icmp ne i64 %call25, 8589934590
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = call i64 @build(i64 4294967295, i64 1)
  %cmp30 = icmp ne i64 %call29, -4294967295
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = call i64 @build(i64 4294967295, i64 0)
  %cmp34 = icmp ne i64 %call33, -4294967296
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %call37 = call i64 @build(i64 4294967295, i64 4294967295)
  %cmp38 = icmp ne i64 %call37, -1
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  %call41 = call i64 @build(i64 4294967295, i64 4294967294)
  %cmp42 = icmp ne i64 %call41, -2
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end40
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end40
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
