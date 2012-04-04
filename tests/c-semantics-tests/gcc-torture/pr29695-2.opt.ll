; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr29695-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 128, align 4
@b = global i8 -128, align 1
@c = global i64 2147483648, align 8
@d = global i32 -2147483648, align 4

define i32 @f1() nounwind uwtable readonly {
entry:
  %0 = load i32* @a, align 4, !tbaa !0
  %and = and i32 %0, 128
  ret i32 %and
}

define i32 @f2() nounwind uwtable readonly {
entry:
  %0 = load i8* @b, align 1, !tbaa !1
  %tobool = icmp slt i8 %0, 0
  %cond = select i1 %tobool, i32 128, i32 0
  ret i32 %cond
}

define i32 @f3() nounwind uwtable readonly {
entry:
  %0 = load i8* @b, align 1, !tbaa !1
  %tobool = icmp slt i8 %0, 0
  %cond = select i1 %tobool, i32 896, i32 0
  ret i32 %cond
}

define i32 @f4() nounwind uwtable readonly {
entry:
  %0 = load i8* @b, align 1, !tbaa !1
  %tobool = icmp slt i8 %0, 0
  %cond = select i1 %tobool, i32 -128, i32 0
  ret i32 %cond
}

define i64 @f5() nounwind uwtable readonly {
entry:
  %0 = load i64* @c, align 8, !tbaa !3
  %and = and i64 %0, 2147483648
  ret i64 %and
}

define i64 @f6() nounwind uwtable readonly {
entry:
  %0 = load i32* @d, align 4, !tbaa !0
  %tobool = icmp slt i32 %0, 0
  %cond = select i1 %tobool, i64 2147483648, i64 0
  ret i64 %cond
}

define i64 @f7() nounwind uwtable readonly {
entry:
  %0 = load i32* @d, align 4, !tbaa !0
  %tobool = icmp slt i32 %0, 0
  %cond = select i1 %tobool, i64 15032385536, i64 0
  ret i64 %cond
}

define i64 @f8() nounwind uwtable readonly {
entry:
  %0 = load i32* @d, align 4, !tbaa !0
  %tobool = icmp slt i32 %0, 0
  %cond = select i1 %tobool, i64 -2147483648, i64 0
  ret i64 %cond
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @a, align 4, !tbaa !0
  %and.i = and i32 %0, 128
  %cmp = icmp eq i32 %and.i, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i8* @b, align 1, !tbaa !1
  %tobool.i38 = icmp slt i8 %1, 0
  br i1 %tobool.i38, label %if.end12, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end
  %2 = load i64* @c, align 8, !tbaa !3
  %and.i33 = and i64 %2, 2147483648
  %cmp14 = icmp eq i64 %and.i33, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %3 = load i32* @d, align 4, !tbaa !0
  %tobool.i31 = icmp slt i32 %3, 0
  br i1 %tobool.i31, label %if.end28, label %if.then19

if.then19:                                        ; preds = %if.end16
  tail call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end16
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"long long", metadata !1}
