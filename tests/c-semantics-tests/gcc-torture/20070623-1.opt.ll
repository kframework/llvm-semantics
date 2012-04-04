; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20070623-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @nge(i32 %a, i32 %b) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp sge i32 %a, %b
  %sub = sext i1 %cmp to i32
  ret i32 %sub
}

define i32 @ngt(i32 %a, i32 %b) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp sgt i32 %a, %b
  %sub = sext i1 %cmp to i32
  ret i32 %sub
}

define i32 @nle(i32 %a, i32 %b) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp sle i32 %a, %b
  %sub = sext i1 %cmp to i32
  ret i32 %sub
}

define i32 @nlt(i32 %a, i32 %b) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp slt i32 %a, %b
  %sub = sext i1 %cmp to i32
  ret i32 %sub
}

define i32 @neq(i32 %a, i32 %b) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp eq i32 %a, %b
  %sub = sext i1 %cmp to i32
  ret i32 %sub
}

define i32 @nne(i32 %a, i32 %b) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp ne i32 %a, %b
  %sub = sext i1 %cmp to i32
  ret i32 %sub
}

define i32 @ngeu(i32 %a, i32 %b) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp uge i32 %a, %b
  %sub = sext i1 %cmp to i32
  ret i32 %sub
}

define i32 @ngtu(i32 %a, i32 %b) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp ugt i32 %a, %b
  %sub = sext i1 %cmp to i32
  ret i32 %sub
}

define i32 @nleu(i32 %a, i32 %b) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp ule i32 %a, %b
  %sub = sext i1 %cmp to i32
  ret i32 %sub
}

define i32 @nltu(i32 %a, i32 %b) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp ult i32 %a, %b
  %sub = sext i1 %cmp to i32
  ret i32 %sub
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %call = tail call i32 @nge(i32 -2147483648, i32 2147483647)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = tail call i32 @nge(i32 2147483647, i32 -2147483648)
  %cmp2 = icmp eq i32 %call1, -1
  br i1 %cmp2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = tail call i32 @ngt(i32 -2147483648, i32 2147483647)
  %cmp6 = icmp eq i32 %call5, 0
  br i1 %cmp6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = tail call i32 @ngt(i32 2147483647, i32 -2147483648)
  %cmp10 = icmp eq i32 %call9, -1
  br i1 %cmp10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = tail call i32 @nle(i32 -2147483648, i32 2147483647)
  %cmp14 = icmp eq i32 %call13, -1
  br i1 %cmp14, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = tail call i32 @nle(i32 2147483647, i32 -2147483648)
  %cmp18 = icmp eq i32 %call17, 0
  br i1 %cmp18, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end16
  tail call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = tail call i32 @nlt(i32 -2147483648, i32 2147483647)
  %cmp22 = icmp eq i32 %call21, -1
  br i1 %cmp22, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end20
  tail call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = tail call i32 @nlt(i32 2147483647, i32 -2147483648)
  %cmp26 = icmp eq i32 %call25, 0
  br i1 %cmp26, label %if.end28, label %if.then27

if.then27:                                        ; preds = %if.end24
  tail call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = tail call i32 @neq(i32 -2147483648, i32 2147483647)
  %cmp30 = icmp eq i32 %call29, 0
  br i1 %cmp30, label %if.end32, label %if.then31

if.then31:                                        ; preds = %if.end28
  tail call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = tail call i32 @neq(i32 2147483647, i32 -2147483648)
  %cmp34 = icmp eq i32 %call33, 0
  br i1 %cmp34, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.end32
  tail call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %call37 = tail call i32 @nne(i32 -2147483648, i32 2147483647)
  %cmp38 = icmp eq i32 %call37, -1
  br i1 %cmp38, label %if.end40, label %if.then39

if.then39:                                        ; preds = %if.end36
  tail call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  %call41 = tail call i32 @nne(i32 2147483647, i32 -2147483648)
  %cmp42 = icmp eq i32 %call41, -1
  br i1 %cmp42, label %if.end44, label %if.then43

if.then43:                                        ; preds = %if.end40
  tail call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end40
  %call45 = tail call i32 @ngeu(i32 0, i32 -1)
  %cmp46 = icmp eq i32 %call45, 0
  br i1 %cmp46, label %if.end48, label %if.then47

if.then47:                                        ; preds = %if.end44
  tail call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.end44
  %call49 = tail call i32 @ngeu(i32 -1, i32 0)
  %cmp50 = icmp eq i32 %call49, -1
  br i1 %cmp50, label %if.end52, label %if.then51

if.then51:                                        ; preds = %if.end48
  tail call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %if.end48
  %call53 = tail call i32 @ngtu(i32 0, i32 -1)
  %cmp54 = icmp eq i32 %call53, 0
  br i1 %cmp54, label %if.end56, label %if.then55

if.then55:                                        ; preds = %if.end52
  tail call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end52
  %call57 = tail call i32 @ngtu(i32 -1, i32 0)
  %cmp58 = icmp eq i32 %call57, -1
  br i1 %cmp58, label %if.end60, label %if.then59

if.then59:                                        ; preds = %if.end56
  tail call void @abort() noreturn nounwind
  unreachable

if.end60:                                         ; preds = %if.end56
  %call61 = tail call i32 @nleu(i32 0, i32 -1)
  %cmp62 = icmp eq i32 %call61, -1
  br i1 %cmp62, label %if.end64, label %if.then63

if.then63:                                        ; preds = %if.end60
  tail call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end60
  %call65 = tail call i32 @nleu(i32 -1, i32 0)
  %cmp66 = icmp eq i32 %call65, 0
  br i1 %cmp66, label %if.end68, label %if.then67

if.then67:                                        ; preds = %if.end64
  tail call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  %call69 = tail call i32 @nltu(i32 0, i32 -1)
  %cmp70 = icmp eq i32 %call69, -1
  br i1 %cmp70, label %if.end72, label %if.then71

if.then71:                                        ; preds = %if.end68
  tail call void @abort() noreturn nounwind
  unreachable

if.end72:                                         ; preds = %if.end68
  %call73 = tail call i32 @nltu(i32 -1, i32 0)
  %cmp74 = icmp eq i32 %call73, 0
  br i1 %cmp74, label %if.end76, label %if.then75

if.then75:                                        ; preds = %if.end72
  tail call void @abort() noreturn nounwind
  unreachable

if.end76:                                         ; preds = %if.end72
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
