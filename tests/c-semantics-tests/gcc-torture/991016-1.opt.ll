; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991016-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @doit(i32 %sel, i32 %n, i8* nocapture %p) nounwind uwtable {
entry:
  %0 = bitcast i8* %p to i32*
  %1 = bitcast i8* %p to i64*
  switch i32 %sel, label %sw.default [
    i32 0, label %do.body.preheader
    i32 1, label %do.body2.preheader
    i32 2, label %do.body11.preheader
  ]

do.body.preheader:                                ; preds = %entry
  %.promoted23 = load i32* %0, align 4
  br label %do.body

do.body2.preheader:                               ; preds = %entry
  %.promoted21 = load i64* %1, align 8
  br label %do.body2

do.body11.preheader:                              ; preds = %entry
  %.promoted = load i64* %1, align 8
  br label %do.body11

do.body:                                          ; preds = %do.body.preheader, %do.body
  %2 = phi i32 [ %add, %do.body ], [ %.promoted23, %do.body.preheader ]
  %n.addr.0 = phi i32 [ %dec, %do.body ], [ %n, %do.body.preheader ]
  %add = shl nsw i32 %2, 1
  %dec = add nsw i32 %n.addr.0, -1
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %do.end, label %do.body

do.end:                                           ; preds = %do.body
  store i32 %add, i32* %0, align 4
  %cmp = icmp eq i32 %add, 0
  %conv = zext i1 %cmp to i32
  br label %return

do.body2:                                         ; preds = %do.body2.preheader, %do.body2
  %3 = phi i64 [ %add3, %do.body2 ], [ %.promoted21, %do.body2.preheader ]
  %n.addr.1 = phi i32 [ %dec5, %do.body2 ], [ %n, %do.body2.preheader ]
  %add3 = shl nsw i64 %3, 1
  %dec5 = add nsw i32 %n.addr.1, -1
  %tobool6 = icmp eq i32 %dec5, 0
  br i1 %tobool6, label %do.end7, label %do.body2

do.end7:                                          ; preds = %do.body2
  store i64 %add3, i64* %1, align 8
  %cmp8 = icmp eq i64 %add3, 0
  %conv9 = zext i1 %cmp8 to i32
  br label %return

do.body11:                                        ; preds = %do.body11.preheader, %do.body11
  %add1219 = phi i64 [ %add12, %do.body11 ], [ %.promoted, %do.body11.preheader ]
  %n.addr.2 = phi i32 [ %dec14, %do.body11 ], [ %n, %do.body11.preheader ]
  %add12 = shl nsw i64 %add1219, 1
  %dec14 = add nsw i32 %n.addr.2, -1
  %tobool15 = icmp eq i32 %dec14, 0
  br i1 %tobool15, label %do.end16, label %do.body11

do.end16:                                         ; preds = %do.body11
  store i64 %add12, i64* %1, align 8
  %cmp17 = icmp eq i64 %add12, 0
  %conv18 = zext i1 %cmp17 to i32
  br label %return

sw.default:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %do.end16, %do.end7, %do.end
  %retval.0 = phi i32 [ %conv18, %do.end16 ], [ %conv9, %do.end7 ], [ %conv, %do.end ]
  ret i32 %retval.0
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
if.end8:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
