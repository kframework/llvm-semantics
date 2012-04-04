; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr39240.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@l1 = global i64 4294967292, align 8
@l2 = global i64 65532, align 8
@l3 = global i64 252, align 8
@l4 = global i64 -4, align 8
@l5 = global i64 -4, align 8
@l6 = global i64 -4, align 8

define i32 @bar1(i32 %x) nounwind uwtable readnone noinline {
entry:
  %add = add nsw i32 %x, 6
  %call = tail call fastcc i32 @foo1(i32 %add)
  ret i32 %call
}

define internal fastcc i32 @foo1(i32 %x) nounwind uwtable readnone noinline {
entry:
  ret i32 %x
}

define zeroext i16 @bar2(i32 %x) nounwind uwtable readnone noinline {
entry:
  %add = add nsw i32 %x, 6
  %call = tail call fastcc signext i16 @foo2(i32 %add)
  ret i16 %call
}

define internal fastcc signext i16 @foo2(i32 %x) nounwind uwtable readnone noinline {
entry:
  %conv = trunc i32 %x to i16
  ret i16 %conv
}

define zeroext i8 @bar3(i32 %x) nounwind uwtable readnone noinline {
entry:
  %add = add nsw i32 %x, 6
  %call = tail call fastcc signext i8 @foo3(i32 %add)
  ret i8 %call
}

define internal fastcc signext i8 @foo3(i32 %x) nounwind uwtable readnone noinline {
entry:
  %conv = trunc i32 %x to i8
  ret i8 %conv
}

define i32 @bar4(i32 %x) nounwind uwtable readnone noinline {
entry:
  %add = add nsw i32 %x, 6
  %call = tail call fastcc i32 @foo4(i32 %add)
  ret i32 %call
}

define internal fastcc i32 @foo4(i32 %x) nounwind uwtable readnone noinline {
entry:
  ret i32 %x
}

define signext i16 @bar5(i32 %x) nounwind uwtable readnone noinline {
entry:
  %add = add nsw i32 %x, 6
  %call = tail call fastcc zeroext i16 @foo5(i32 %add)
  ret i16 %call
}

define internal fastcc zeroext i16 @foo5(i32 %x) nounwind uwtable readnone noinline {
entry:
  %conv = trunc i32 %x to i16
  ret i16 %conv
}

define signext i8 @bar6(i32 %x) nounwind uwtable readnone noinline {
entry:
  %add = add nsw i32 %x, 6
  %call = tail call fastcc zeroext i8 @foo6(i32 %add)
  ret i8 %call
}

define internal fastcc zeroext i8 @foo6(i32 %x) nounwind uwtable readnone noinline {
entry:
  %conv = trunc i32 %x to i8
  ret i8 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @bar1(i32 -10)
  %conv = zext i32 %call to i64
  %0 = load volatile i64* @l1, align 8, !tbaa !0
  %cmp = icmp eq i64 %conv, %0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call2 = tail call zeroext i16 @bar2(i32 -10)
  %conv3 = zext i16 %call2 to i64
  %1 = load volatile i64* @l2, align 8, !tbaa !0
  %cmp4 = icmp eq i64 %conv3, %1
  br i1 %cmp4, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  %call8 = tail call zeroext i8 @bar3(i32 -10)
  %conv9 = zext i8 %call8 to i64
  %2 = load volatile i64* @l3, align 8, !tbaa !0
  %cmp10 = icmp eq i64 %conv9, %2
  br i1 %cmp10, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.end7
  tail call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end7
  %call14 = tail call i32 @bar4(i32 -10)
  %conv15 = sext i32 %call14 to i64
  %3 = load volatile i64* @l4, align 8, !tbaa !0
  %cmp16 = icmp eq i64 %conv15, %3
  br i1 %cmp16, label %if.end19, label %if.then18

if.then18:                                        ; preds = %if.end13
  tail call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end13
  %call20 = tail call signext i16 @bar5(i32 -10)
  %conv21 = sext i16 %call20 to i64
  %4 = load volatile i64* @l5, align 8, !tbaa !0
  %cmp22 = icmp eq i64 %conv21, %4
  br i1 %cmp22, label %if.end25, label %if.then24

if.then24:                                        ; preds = %if.end19
  tail call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end19
  %call26 = tail call signext i8 @bar6(i32 -10)
  %conv27 = sext i8 %call26 to i64
  %5 = load volatile i64* @l6, align 8, !tbaa !0
  %cmp28 = icmp eq i64 %conv27, %5
  br i1 %cmp28, label %if.end31, label %if.then30

if.then30:                                        ; preds = %if.end25
  tail call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %if.end25
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
