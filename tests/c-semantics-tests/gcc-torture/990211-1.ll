; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990211-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @func(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32* %i.addr, align 4
  %cmp1 = icmp sge i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.lhs.true, %entry
  %2 = load i32* %i.addr, align 4
  %cmp2 = icmp sgt i32 %2, 0
  br i1 %cmp2, label %land.lhs.true3, label %if.end6

land.lhs.true3:                                   ; preds = %if.end
  %3 = load i32* %i.addr, align 4
  %cmp4 = icmp sle i32 %3, 0
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %land.lhs.true3
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %land.lhs.true3, %if.end
  %4 = load i32* %i.addr, align 4
  %cmp7 = icmp sge i32 %4, 0
  br i1 %cmp7, label %land.lhs.true8, label %if.end11

land.lhs.true8:                                   ; preds = %if.end6
  %5 = load i32* %i.addr, align 4
  %cmp9 = icmp slt i32 %5, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %land.lhs.true8
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %land.lhs.true8, %if.end6
  %6 = load i32* %i.addr, align 4
  %cmp12 = icmp sle i32 %6, 0
  br i1 %cmp12, label %land.lhs.true13, label %if.end16

land.lhs.true13:                                  ; preds = %if.end11
  %7 = load i32* %i.addr, align 4
  %cmp14 = icmp sgt i32 %7, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %land.lhs.true13
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %land.lhs.true13, %if.end11
  %8 = load i32* %i.addr, align 4
  %cmp17 = icmp slt i32 %8, 77
  br i1 %cmp17, label %land.lhs.true18, label %if.end21

land.lhs.true18:                                  ; preds = %if.end16
  %9 = load i32* %i.addr, align 4
  %cmp19 = icmp sge i32 %9, 77
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %land.lhs.true18
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %land.lhs.true18, %if.end16
  %10 = load i32* %i.addr, align 4
  %cmp22 = icmp sgt i32 %10, 77
  br i1 %cmp22, label %land.lhs.true23, label %if.end26

land.lhs.true23:                                  ; preds = %if.end21
  %11 = load i32* %i.addr, align 4
  %cmp24 = icmp sle i32 %11, 77
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %land.lhs.true23
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %land.lhs.true23, %if.end21
  %12 = load i32* %i.addr, align 4
  %cmp27 = icmp sge i32 %12, 77
  br i1 %cmp27, label %land.lhs.true28, label %if.end31

land.lhs.true28:                                  ; preds = %if.end26
  %13 = load i32* %i.addr, align 4
  %cmp29 = icmp slt i32 %13, 77
  br i1 %cmp29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %land.lhs.true28
  call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %land.lhs.true28, %if.end26
  %14 = load i32* %i.addr, align 4
  %cmp32 = icmp sle i32 %14, 77
  br i1 %cmp32, label %land.lhs.true33, label %if.end36

land.lhs.true33:                                  ; preds = %if.end31
  %15 = load i32* %i.addr, align 4
  %cmp34 = icmp sgt i32 %15, 77
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %land.lhs.true33
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %land.lhs.true33, %if.end31
  %16 = load i32* %i.addr, align 4
  %cmp37 = icmp slt i32 %16, 0
  br i1 %cmp37, label %if.end40, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end36
  %17 = load i32* %i.addr, align 4
  %cmp38 = icmp sge i32 %17, 0
  br i1 %cmp38, label %if.end40, label %if.then39

if.then39:                                        ; preds = %lor.lhs.false
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %lor.lhs.false, %if.end36
  %18 = load i32* %i.addr, align 4
  %cmp41 = icmp sgt i32 %18, 0
  br i1 %cmp41, label %if.end45, label %lor.lhs.false42

lor.lhs.false42:                                  ; preds = %if.end40
  %19 = load i32* %i.addr, align 4
  %cmp43 = icmp sle i32 %19, 0
  br i1 %cmp43, label %if.end45, label %if.then44

if.then44:                                        ; preds = %lor.lhs.false42
  call void @abort() noreturn nounwind
  unreachable

if.end45:                                         ; preds = %lor.lhs.false42, %if.end40
  %20 = load i32* %i.addr, align 4
  %cmp46 = icmp sge i32 %20, 0
  br i1 %cmp46, label %if.end50, label %lor.lhs.false47

lor.lhs.false47:                                  ; preds = %if.end45
  %21 = load i32* %i.addr, align 4
  %cmp48 = icmp slt i32 %21, 0
  br i1 %cmp48, label %if.end50, label %if.then49

if.then49:                                        ; preds = %lor.lhs.false47
  call void @abort() noreturn nounwind
  unreachable

if.end50:                                         ; preds = %lor.lhs.false47, %if.end45
  %22 = load i32* %i.addr, align 4
  %cmp51 = icmp sle i32 %22, 0
  br i1 %cmp51, label %if.end55, label %lor.lhs.false52

lor.lhs.false52:                                  ; preds = %if.end50
  %23 = load i32* %i.addr, align 4
  %cmp53 = icmp sgt i32 %23, 0
  br i1 %cmp53, label %if.end55, label %if.then54

if.then54:                                        ; preds = %lor.lhs.false52
  call void @abort() noreturn nounwind
  unreachable

if.end55:                                         ; preds = %lor.lhs.false52, %if.end50
  %24 = load i32* %i.addr, align 4
  %cmp56 = icmp slt i32 %24, 77
  br i1 %cmp56, label %if.end60, label %lor.lhs.false57

lor.lhs.false57:                                  ; preds = %if.end55
  %25 = load i32* %i.addr, align 4
  %cmp58 = icmp sge i32 %25, 77
  br i1 %cmp58, label %if.end60, label %if.then59

if.then59:                                        ; preds = %lor.lhs.false57
  call void @abort() noreturn nounwind
  unreachable

if.end60:                                         ; preds = %lor.lhs.false57, %if.end55
  %26 = load i32* %i.addr, align 4
  %cmp61 = icmp sgt i32 %26, 77
  br i1 %cmp61, label %if.end65, label %lor.lhs.false62

lor.lhs.false62:                                  ; preds = %if.end60
  %27 = load i32* %i.addr, align 4
  %cmp63 = icmp sle i32 %27, 77
  br i1 %cmp63, label %if.end65, label %if.then64

if.then64:                                        ; preds = %lor.lhs.false62
  call void @abort() noreturn nounwind
  unreachable

if.end65:                                         ; preds = %lor.lhs.false62, %if.end60
  %28 = load i32* %i.addr, align 4
  %cmp66 = icmp sge i32 %28, 77
  br i1 %cmp66, label %if.end70, label %lor.lhs.false67

lor.lhs.false67:                                  ; preds = %if.end65
  %29 = load i32* %i.addr, align 4
  %cmp68 = icmp slt i32 %29, 77
  br i1 %cmp68, label %if.end70, label %if.then69

if.then69:                                        ; preds = %lor.lhs.false67
  call void @abort() noreturn nounwind
  unreachable

if.end70:                                         ; preds = %lor.lhs.false67, %if.end65
  %30 = load i32* %i.addr, align 4
  %cmp71 = icmp sle i32 %30, 77
  br i1 %cmp71, label %if.end75, label %lor.lhs.false72

lor.lhs.false72:                                  ; preds = %if.end70
  %31 = load i32* %i.addr, align 4
  %cmp73 = icmp sgt i32 %31, 77
  br i1 %cmp73, label %if.end75, label %if.then74

if.then74:                                        ; preds = %lor.lhs.false72
  call void @abort() noreturn nounwind
  unreachable

if.end75:                                         ; preds = %lor.lhs.false72, %if.end70
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @func(i32 0)
  call void @func(i32 1)
  ret i32 0
}
