; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/991016-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @doit(i32 %sel, i32 %n, i8* %p) nounwind uwtable {
entry:
  %0 = bitcast i8* %p to i32*
  %1 = bitcast i8* %p to i64*
  switch i32 %sel, label %sw.default [
    i32 0, label %do.body.preheader
    i32 1, label %do.body14.preheader
    i32 2, label %do.body30.preheader
  ]

do.body.preheader:                                ; preds = %entry
  %.promoted9 = load i32* %0, align 4
  br label %do.body

do.body14.preheader:                              ; preds = %entry
  %.promoted6 = load i64* %1, align 8
  br label %do.body14

do.body30.preheader:                              ; preds = %entry
  %.promoted = load i64* %1, align 8
  br label %do.body30

do.body:                                          ; preds = %do.body.preheader, %do.body
  %indvar19 = phi i32 [ 0, %do.body.preheader ], [ %indvar.next20, %do.body ]
  %tmp710 = phi i32 [ %.promoted9, %do.body.preheader ], [ %add, %do.body ]
  %add = shl nsw i32 %tmp710, 1
  %indvar.next20 = add i32 %indvar19, 1
  %exitcond21 = icmp eq i32 %indvar.next20, %n
  br i1 %exitcond21, label %do.end, label %do.body

do.end:                                           ; preds = %do.body
  store i32 %add, i32* %0, align 4
  %cmp = icmp eq i32 %add, 0
  %conv = zext i1 %cmp to i32
  br label %return

do.body14:                                        ; preds = %do.body14.preheader, %do.body14
  %indvar14 = phi i32 [ 0, %do.body14.preheader ], [ %indvar.next15, %do.body14 ]
  %tmp167 = phi i64 [ %.promoted6, %do.body14.preheader ], [ %add19, %do.body14 ]
  %add19 = shl nsw i64 %tmp167, 1
  %indvar.next15 = add i32 %indvar14, 1
  %exitcond16 = icmp eq i32 %indvar.next15, %n
  br i1 %exitcond16, label %do.end24, label %do.body14

do.end24:                                         ; preds = %do.body14
  store i64 %add19, i64* %1, align 8
  %cmp27 = icmp eq i64 %add19, 0
  %conv28 = zext i1 %cmp27 to i32
  br label %return

do.body30:                                        ; preds = %do.body30.preheader, %do.body30
  %indvar = phi i32 [ 0, %do.body30.preheader ], [ %indvar.next, %do.body30 ]
  %add354 = phi i64 [ %.promoted, %do.body30.preheader ], [ %add35, %do.body30 ]
  %add35 = shl nsw i64 %add354, 1
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %n
  br i1 %exitcond, label %do.end40, label %do.body30

do.end40:                                         ; preds = %do.body30
  store i64 %add35, i64* %1, align 8
  %cmp43 = icmp eq i64 %add35, 0
  %conv44 = zext i1 %cmp43 to i32
  br label %return

sw.default:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %do.end40, %do.end24, %do.end
  %2 = phi i32 [ %conv44, %do.end40 ], [ %conv28, %do.end24 ], [ %conv, %do.end ]
  ret i32 %2
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
if.end10:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
