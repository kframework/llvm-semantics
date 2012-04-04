; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/981001-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@flg = global i64 0, align 8

define i64 @sub(i32 %n) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i32 %n, 1
  br i1 %cmp, label %if.then, label %if.else19

if.then:                                          ; preds = %entry
  %rem21 = and i32 %n, 1
  %cmp1 = icmp eq i32 %rem21, 0
  %div = sdiv i32 %n, 2
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %call = tail call i64 @sub(i32 %div)
  %sext = shl i64 %call, 32
  %conv3 = ashr exact i64 %sext, 32
  %sub = add nsw i32 %div, -1
  %call5 = tail call i64 @sub(i32 %sub)
  %mul = shl i64 %call5, 1
  %add = add nsw i64 %conv3, %mul
  %mul7 = mul nsw i64 %add, %conv3
  ret i64 %mul7

if.else:                                          ; preds = %if.then
  %add9 = add nsw i32 %div, 1
  %call10 = tail call i64 @sub(i32 %add9)
  %conv11 = trunc i64 %call10 to i32
  %call13 = tail call i64 @sub(i32 %div)
  %conv14 = trunc i64 %call13 to i32
  %mul15 = mul nsw i32 %conv11, %conv11
  %mul16 = mul nsw i32 %conv14, %conv14
  %add17 = add nsw i32 %mul16, %mul15
  %conv18 = sext i32 %add17 to i64
  ret i64 %conv18

if.else19:                                        ; preds = %entry
  %conv20 = sext i32 %n to i64
  ret i64 %conv20
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %call = tail call i64 @sub(i32 30)
  %cmp = icmp eq i64 %call, 832040
  %.pr = load i64* @flg, align 8, !tbaa !0
  br i1 %cmp, label %if.end, label %if.end.thread

if.end.thread:                                    ; preds = %entry
  %or = or i64 %.pr, 256
  store i64 %or, i64* @flg, align 8, !tbaa !0
  br label %if.then1

if.end:                                           ; preds = %entry
  %tobool = icmp eq i64 %.pr, 0
  br i1 %tobool, label %if.end2, label %if.then1

if.then1:                                         ; preds = %if.end.thread, %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end2:                                          ; preds = %if.end
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
