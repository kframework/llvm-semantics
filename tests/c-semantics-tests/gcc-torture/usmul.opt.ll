; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/usmul.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i16 signext %x, i16 zeroext %y) nounwind uwtable readnone noinline {
entry:
  %conv = sext i16 %x to i32
  %conv1 = zext i16 %y to i32
  %mul = mul nsw i32 %conv1, %conv
  ret i32 %mul
}

define i32 @bar(i16 zeroext %x, i16 signext %y) nounwind uwtable readnone noinline {
entry:
  %conv = zext i16 %x to i32
  %conv1 = sext i16 %y to i32
  %mul = mul nsw i32 %conv1, %conv
  ret i32 %mul
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %call = tail call i32 @foo(i16 signext -2, i16 zeroext -1)
  %cmp = icmp eq i32 %call, -131070
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = tail call i32 @foo(i16 signext 2, i16 zeroext -1)
  %cmp2 = icmp eq i32 %call1, 131070
  br i1 %cmp2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = tail call i32 @foo(i16 signext -32768, i16 zeroext -32768)
  %cmp6 = icmp eq i32 %call5, -1073741824
  br i1 %cmp6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = tail call i32 @foo(i16 signext 32767, i16 zeroext -32768)
  %cmp10 = icmp eq i32 %call9, 1073709056
  br i1 %cmp10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = tail call i32 @bar(i16 zeroext -1, i16 signext -2)
  %cmp14 = icmp eq i32 %call13, -131070
  br i1 %cmp14, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = tail call i32 @bar(i16 zeroext -1, i16 signext 2)
  %cmp18 = icmp eq i32 %call17, 131070
  br i1 %cmp18, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end16
  tail call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = tail call i32 @bar(i16 zeroext -32768, i16 signext -32768)
  %cmp22 = icmp eq i32 %call21, -1073741824
  br i1 %cmp22, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end20
  tail call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = tail call i32 @bar(i16 zeroext -32768, i16 signext 32767)
  %cmp26 = icmp eq i32 %call25, 1073709056
  br i1 %cmp26, label %if.end28, label %if.then27

if.then27:                                        ; preds = %if.end24
  tail call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
