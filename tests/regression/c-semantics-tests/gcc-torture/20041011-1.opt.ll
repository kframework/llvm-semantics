; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041011-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@gvol = common global [32 x i32] zeroinitializer, align 16
@gull = common global i64 0, align 8

define i64 @t1(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool1 = icmp eq i32 %n, 0
  br i1 %tobool1, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 11
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.addr.03 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add nsw i32 %n.addr.03, -1
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  store volatile i32 %3, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  store volatile i32 %4, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  store volatile i32 %5, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  store volatile i32 %6, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  store volatile i32 %7, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  store volatile i32 %8, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  store volatile i32 %9, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  store volatile i32 %10, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  store volatile i32 %11, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  store volatile i32 %12, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  store volatile i32 %13, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  store volatile i32 %14, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  store volatile i32 %15, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  store volatile i32 %16, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  store volatile i32 %17, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  store volatile i32 %18, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  store volatile i32 %19, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  store volatile i32 %20, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  store volatile i32 %21, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  store volatile i32 %22, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  store volatile i32 %23, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  store volatile i32 %24, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  store volatile i32 %25, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  store volatile i32 %26, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  store volatile i32 %27, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  store volatile i32 %28, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  store volatile i32 %29, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  store volatile i32 %30, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %33 = add i64 %x, -2048
  %34 = sub i64 %33, %2
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %x.addr.0.lcssa = phi i64 [ %34, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %x.addr.0.lcssa
}

define i64 @t2(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool1 = icmp eq i32 %n, 0
  br i1 %tobool1, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.addr.03 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add nsw i32 %n.addr.03, -1
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  store volatile i32 %2, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  store volatile i32 %3, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  store volatile i32 %4, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  store volatile i32 %5, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  store volatile i32 %6, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  store volatile i32 %7, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  store volatile i32 %8, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  store volatile i32 %9, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  store volatile i32 %10, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  store volatile i32 %11, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  store volatile i32 %12, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  store volatile i32 %13, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  store volatile i32 %14, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  store volatile i32 %15, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  store volatile i32 %16, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  store volatile i32 %17, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  store volatile i32 %18, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  store volatile i32 %19, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  store volatile i32 %20, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  store volatile i32 %21, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  store volatile i32 %22, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  store volatile i32 %23, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  store volatile i32 %24, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  store volatile i32 %25, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  store volatile i32 %26, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  store volatile i32 %27, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  store volatile i32 %28, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  store volatile i32 %29, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  store volatile i32 %30, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %32 = add i64 %x, -513
  %33 = mul i64 %1, -513
  %34 = add i64 %32, %33
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %x.addr.0.lcssa = phi i64 [ %34, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %x.addr.0.lcssa
}

define i64 @t3(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool1 = icmp eq i32 %n, 0
  br i1 %tobool1, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 9
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.addr.03 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add nsw i32 %n.addr.03, -1
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  store volatile i32 %3, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  store volatile i32 %4, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  store volatile i32 %5, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  store volatile i32 %6, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  store volatile i32 %7, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  store volatile i32 %8, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  store volatile i32 %9, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  store volatile i32 %10, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  store volatile i32 %11, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  store volatile i32 %12, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  store volatile i32 %13, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  store volatile i32 %14, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  store volatile i32 %15, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  store volatile i32 %16, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  store volatile i32 %17, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  store volatile i32 %18, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  store volatile i32 %19, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  store volatile i32 %20, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  store volatile i32 %21, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  store volatile i32 %22, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  store volatile i32 %23, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  store volatile i32 %24, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  store volatile i32 %25, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  store volatile i32 %26, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  store volatile i32 %27, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  store volatile i32 %28, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  store volatile i32 %29, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  store volatile i32 %30, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %33 = add i64 %x, -512
  %34 = sub i64 %33, %2
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %x.addr.0.lcssa = phi i64 [ %34, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %x.addr.0.lcssa
}

define i64 @t4(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool1 = icmp eq i32 %n, 0
  br i1 %tobool1, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.addr.03 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add nsw i32 %n.addr.03, -1
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  store volatile i32 %2, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  store volatile i32 %3, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  store volatile i32 %4, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  store volatile i32 %5, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  store volatile i32 %6, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  store volatile i32 %7, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  store volatile i32 %8, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  store volatile i32 %9, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  store volatile i32 %10, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  store volatile i32 %11, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  store volatile i32 %12, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  store volatile i32 %13, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  store volatile i32 %14, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  store volatile i32 %15, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  store volatile i32 %16, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  store volatile i32 %17, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  store volatile i32 %18, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  store volatile i32 %19, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  store volatile i32 %20, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  store volatile i32 %21, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  store volatile i32 %22, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  store volatile i32 %23, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  store volatile i32 %24, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  store volatile i32 %25, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  store volatile i32 %26, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  store volatile i32 %27, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  store volatile i32 %28, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  store volatile i32 %29, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  store volatile i32 %30, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %32 = add i64 %x, -511
  %33 = mul i64 %1, -511
  %34 = add i64 %32, %33
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %x.addr.0.lcssa = phi i64 [ %34, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %x.addr.0.lcssa
}

define i64 @t5(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool1 = icmp eq i32 %n, 0
  br i1 %tobool1, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.addr.03 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add nsw i32 %n.addr.03, -1
  %2 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  store volatile i32 %2, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  store volatile i32 %3, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  store volatile i32 %4, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  store volatile i32 %5, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  store volatile i32 %6, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  store volatile i32 %7, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  store volatile i32 %8, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  store volatile i32 %9, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  store volatile i32 %10, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  store volatile i32 %11, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  store volatile i32 %12, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  store volatile i32 %13, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  store volatile i32 %14, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  store volatile i32 %15, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  store volatile i32 %16, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  store volatile i32 %17, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  store volatile i32 %18, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  store volatile i32 %19, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  store volatile i32 %20, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  store volatile i32 %21, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  store volatile i32 %22, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  store volatile i32 %23, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  store volatile i32 %24, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  store volatile i32 %25, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  store volatile i32 %26, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  store volatile i32 %27, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  store volatile i32 %28, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  store volatile i32 %29, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  store volatile i32 %30, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %32 = add i64 %x, -1
  %33 = sub i64 %32, %1
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %x.addr.0.lcssa = phi i64 [ %33, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %x.addr.0.lcssa
}

define i64 @t6(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool1 = icmp eq i32 %n, 0
  br i1 %tobool1, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = add i64 %1, %x
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.addr.03 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add nsw i32 %n.addr.03, -1
  %3 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  store volatile i32 %3, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  store volatile i32 %4, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  store volatile i32 %5, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  store volatile i32 %6, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  store volatile i32 %7, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  store volatile i32 %8, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  store volatile i32 %9, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  store volatile i32 %10, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  store volatile i32 %11, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  store volatile i32 %12, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  store volatile i32 %13, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  store volatile i32 %14, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  store volatile i32 %15, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  store volatile i32 %16, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  store volatile i32 %17, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  store volatile i32 %18, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  store volatile i32 %19, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  store volatile i32 %20, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  store volatile i32 %21, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  store volatile i32 %22, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  store volatile i32 %23, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  store volatile i32 %24, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  store volatile i32 %25, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  store volatile i32 %26, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  store volatile i32 %27, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  store volatile i32 %28, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  store volatile i32 %29, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  store volatile i32 %30, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %33 = add i64 %2, 1
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %x.addr.0.lcssa = phi i64 [ %33, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %x.addr.0.lcssa
}

define i64 @t7(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool1 = icmp eq i32 %n, 0
  br i1 %tobool1, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = mul i64 %1, 511
  %3 = add i64 %2, %x
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.addr.03 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add nsw i32 %n.addr.03, -1
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  store volatile i32 %4, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  store volatile i32 %5, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  store volatile i32 %6, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  store volatile i32 %7, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  store volatile i32 %8, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  store volatile i32 %9, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  store volatile i32 %10, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  store volatile i32 %11, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  store volatile i32 %12, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  store volatile i32 %13, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  store volatile i32 %14, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  store volatile i32 %15, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  store volatile i32 %16, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  store volatile i32 %17, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  store volatile i32 %18, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  store volatile i32 %19, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  store volatile i32 %20, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  store volatile i32 %21, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  store volatile i32 %22, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  store volatile i32 %23, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  store volatile i32 %24, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  store volatile i32 %25, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  store volatile i32 %26, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  store volatile i32 %27, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  store volatile i32 %28, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  store volatile i32 %29, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  store volatile i32 %30, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %34 = add i64 %3, 511
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %x.addr.0.lcssa = phi i64 [ %34, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %x.addr.0.lcssa
}

define i64 @t8(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool1 = icmp eq i32 %n, 0
  br i1 %tobool1, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 9
  %3 = add i64 %2, %x
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.addr.03 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add nsw i32 %n.addr.03, -1
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  store volatile i32 %4, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  store volatile i32 %5, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  store volatile i32 %6, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  store volatile i32 %7, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  store volatile i32 %8, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  store volatile i32 %9, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  store volatile i32 %10, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  store volatile i32 %11, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  store volatile i32 %12, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  store volatile i32 %13, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  store volatile i32 %14, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  store volatile i32 %15, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  store volatile i32 %16, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  store volatile i32 %17, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  store volatile i32 %18, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  store volatile i32 %19, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  store volatile i32 %20, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  store volatile i32 %21, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  store volatile i32 %22, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  store volatile i32 %23, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  store volatile i32 %24, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  store volatile i32 %25, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  store volatile i32 %26, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  store volatile i32 %27, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  store volatile i32 %28, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  store volatile i32 %29, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  store volatile i32 %30, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %34 = add i64 %3, 512
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %x.addr.0.lcssa = phi i64 [ %34, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %x.addr.0.lcssa
}

define i64 @t9(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool1 = icmp eq i32 %n, 0
  br i1 %tobool1, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = mul i64 %1, 513
  %3 = add i64 %2, %x
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.addr.03 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add nsw i32 %n.addr.03, -1
  %4 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  store volatile i32 %4, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  store volatile i32 %5, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  store volatile i32 %6, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  store volatile i32 %7, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  store volatile i32 %8, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  store volatile i32 %9, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  store volatile i32 %10, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  store volatile i32 %11, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  store volatile i32 %12, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  store volatile i32 %13, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  store volatile i32 %14, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  store volatile i32 %15, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  store volatile i32 %16, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  store volatile i32 %17, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  store volatile i32 %18, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  store volatile i32 %19, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  store volatile i32 %20, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  store volatile i32 %21, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  store volatile i32 %22, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  store volatile i32 %23, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  store volatile i32 %24, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  store volatile i32 %25, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  store volatile i32 %26, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  store volatile i32 %27, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  store volatile i32 %28, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  store volatile i32 %29, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  store volatile i32 %30, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %34 = add i64 %3, 513
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %x.addr.0.lcssa = phi i64 [ %34, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %x.addr.0.lcssa
}

define i64 @t10(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool1 = icmp eq i32 %n, 0
  br i1 %tobool1, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = load i64* @gull, align 8, !tbaa !3
  %1 = add i32 %n, -1
  %2 = zext i32 %1 to i64
  %3 = add i64 %2, 1
  %4 = mul i64 %0, %3
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.addr.03 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add nsw i32 %n.addr.03, -1
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  store volatile i32 %5, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  store volatile i32 %6, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  store volatile i32 %7, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  store volatile i32 %8, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  store volatile i32 %9, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  store volatile i32 %10, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  store volatile i32 %11, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  store volatile i32 %12, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  store volatile i32 %13, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  store volatile i32 %14, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  store volatile i32 %15, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  store volatile i32 %16, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  store volatile i32 %17, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  store volatile i32 %18, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  store volatile i32 %19, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  store volatile i32 %20, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  store volatile i32 %21, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  store volatile i32 %22, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  store volatile i32 %23, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  store volatile i32 %24, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  store volatile i32 %25, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  store volatile i32 %26, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  store volatile i32 %27, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  store volatile i32 %28, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  store volatile i32 %29, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  store volatile i32 %30, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %35 = add i64 %4, %x
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %x.addr.0.lcssa = phi i64 [ %35, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %x.addr.0.lcssa
}

define i64 @t11(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool1 = icmp eq i32 %n, 0
  br i1 %tobool1, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = load i64* @gull, align 8, !tbaa !3
  %1 = add i32 %n, -1
  %2 = zext i32 %1 to i64
  %3 = xor i64 %2, -1
  %4 = mul i64 %0, %3
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.addr.03 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add nsw i32 %n.addr.03, -1
  %5 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  %6 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  %7 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  store volatile i32 %5, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4, !tbaa !0
  store volatile i32 %6, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8, !tbaa !0
  store volatile i32 %7, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4, !tbaa !0
  store volatile i32 %8, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16, !tbaa !0
  store volatile i32 %9, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4, !tbaa !0
  store volatile i32 %10, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8, !tbaa !0
  store volatile i32 %11, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4, !tbaa !0
  store volatile i32 %12, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16, !tbaa !0
  store volatile i32 %13, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4, !tbaa !0
  store volatile i32 %14, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8, !tbaa !0
  store volatile i32 %15, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4, !tbaa !0
  store volatile i32 %16, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16, !tbaa !0
  store volatile i32 %17, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4, !tbaa !0
  store volatile i32 %18, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8, !tbaa !0
  store volatile i32 %19, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4, !tbaa !0
  store volatile i32 %20, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16, !tbaa !0
  store volatile i32 %21, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4, !tbaa !0
  store volatile i32 %22, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8, !tbaa !0
  store volatile i32 %23, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4, !tbaa !0
  store volatile i32 %24, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16, !tbaa !0
  store volatile i32 %25, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4, !tbaa !0
  store volatile i32 %26, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8, !tbaa !0
  store volatile i32 %27, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4, !tbaa !0
  store volatile i32 %28, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16, !tbaa !0
  store volatile i32 %29, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4, !tbaa !0
  store volatile i32 %30, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8, !tbaa !0
  store volatile i32 %31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4, !tbaa !0
  store volatile i32 %32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16, !tbaa !0
  store volatile i32 %33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4, !tbaa !0
  store volatile i32 %34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8, !tbaa !0
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %35 = add i64 %4, %x
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %x.addr.0.lcssa = phi i64 [ %35, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %x.addr.0.lcssa
}

define i64 @neg(i64 %x) nounwind uwtable readnone {
entry:
  %sub = sub i64 0, %x
  ret i64 %sub
}

define i32 @main() noreturn nounwind uwtable {
entry:
  store i64 100, i64* @gull, align 8, !tbaa !3
  %call = tail call i64 @t1(i32 3, i64 -1)
  %cmp = icmp eq i64 %call, -6145
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = tail call i64 @t1(i32 3, i64 4294967295)
  %cmp2 = icmp eq i64 %call1, 4294961151
  br i1 %cmp2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = tail call i64 @t2(i32 3, i64 -1)
  %cmp6 = icmp eq i64 %call5, -1540
  br i1 %cmp6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = tail call i64 @t2(i32 3, i64 4294967295)
  %cmp10 = icmp eq i64 %call9, 4294965756
  br i1 %cmp10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = tail call i64 @t3(i32 3, i64 -1)
  %cmp14 = icmp eq i64 %call13, -1537
  br i1 %cmp14, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = tail call i64 @t3(i32 3, i64 4294967295)
  %cmp18 = icmp eq i64 %call17, 4294965759
  br i1 %cmp18, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end16
  tail call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = tail call i64 @t4(i32 3, i64 -1)
  %cmp22 = icmp eq i64 %call21, -1534
  br i1 %cmp22, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end20
  tail call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = tail call i64 @t4(i32 3, i64 4294967295)
  %cmp26 = icmp eq i64 %call25, 4294965762
  br i1 %cmp26, label %if.end28, label %if.then27

if.then27:                                        ; preds = %if.end24
  tail call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = tail call i64 @t5(i32 3, i64 -1)
  %cmp30 = icmp eq i64 %call29, -4
  br i1 %cmp30, label %if.end32, label %if.then31

if.then31:                                        ; preds = %if.end28
  tail call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = tail call i64 @t5(i32 3, i64 4294967295)
  %cmp34 = icmp eq i64 %call33, 4294967292
  br i1 %cmp34, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.end32
  tail call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %call37 = tail call i64 @t6(i32 3, i64 -1)
  %cmp38 = icmp eq i64 %call37, 2
  br i1 %cmp38, label %if.end40, label %if.then39

if.then39:                                        ; preds = %if.end36
  tail call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  %call41 = tail call i64 @t6(i32 3, i64 4294967295)
  %cmp42 = icmp eq i64 %call41, 4294967298
  br i1 %cmp42, label %if.end44, label %if.then43

if.then43:                                        ; preds = %if.end40
  tail call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end40
  %call45 = tail call i64 @t7(i32 3, i64 -1)
  %cmp46 = icmp eq i64 %call45, 1532
  br i1 %cmp46, label %if.end48, label %if.then47

if.then47:                                        ; preds = %if.end44
  tail call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.end44
  %call49 = tail call i64 @t7(i32 3, i64 4294967295)
  %cmp50 = icmp eq i64 %call49, 4294968828
  br i1 %cmp50, label %if.end52, label %if.then51

if.then51:                                        ; preds = %if.end48
  tail call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %if.end48
  %call53 = tail call i64 @t8(i32 3, i64 -1)
  %cmp54 = icmp eq i64 %call53, 1535
  br i1 %cmp54, label %if.end56, label %if.then55

if.then55:                                        ; preds = %if.end52
  tail call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end52
  %call57 = tail call i64 @t8(i32 3, i64 4294967295)
  %cmp58 = icmp eq i64 %call57, 4294968831
  br i1 %cmp58, label %if.end60, label %if.then59

if.then59:                                        ; preds = %if.end56
  tail call void @abort() noreturn nounwind
  unreachable

if.end60:                                         ; preds = %if.end56
  %call61 = tail call i64 @t9(i32 3, i64 -1)
  %cmp62 = icmp eq i64 %call61, 1538
  br i1 %cmp62, label %if.end64, label %if.then63

if.then63:                                        ; preds = %if.end60
  tail call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end60
  %call65 = tail call i64 @t9(i32 3, i64 4294967295)
  %cmp66 = icmp eq i64 %call65, 4294968834
  br i1 %cmp66, label %if.end68, label %if.then67

if.then67:                                        ; preds = %if.end64
  tail call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  %call69 = tail call i64 @t10(i32 3, i64 -1)
  %0 = load i64* @gull, align 8, !tbaa !3
  %mul = mul i64 %0, 3
  %sub = add i64 %mul, -1
  %cmp70 = icmp eq i64 %call69, %sub
  br i1 %cmp70, label %if.end72, label %if.then71

if.then71:                                        ; preds = %if.end68
  tail call void @abort() noreturn nounwind
  unreachable

if.end72:                                         ; preds = %if.end68
  %call73 = tail call i64 @t10(i32 3, i64 4294967295)
  %1 = load i64* @gull, align 8, !tbaa !3
  %mul74 = mul i64 %1, 3
  %add = add i64 %mul74, 4294967295
  %cmp75 = icmp eq i64 %call73, %add
  br i1 %cmp75, label %if.end77, label %if.then76

if.then76:                                        ; preds = %if.end72
  tail call void @abort() noreturn nounwind
  unreachable

if.end77:                                         ; preds = %if.end72
  %call78 = tail call i64 @t11(i32 3, i64 -1)
  %2 = load i64* @gull, align 8, !tbaa !3
  %mul80 = mul i64 %2, -3
  %sub81 = add i64 %mul80, -1
  %cmp82 = icmp eq i64 %call78, %sub81
  br i1 %cmp82, label %if.end84, label %if.then83

if.then83:                                        ; preds = %if.end77
  tail call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end77
  %call85 = tail call i64 @t11(i32 3, i64 4294967295)
  %3 = load i64* @gull, align 8, !tbaa !3
  %mul87 = mul i64 %3, -3
  %add88 = add i64 %mul87, 4294967295
  %cmp89 = icmp eq i64 %call85, %add88
  br i1 %cmp89, label %if.end91, label %if.then90

if.then90:                                        ; preds = %if.end84
  tail call void @abort() noreturn nounwind
  unreachable

if.end91:                                         ; preds = %if.end84
  %cmp93 = icmp eq i64 %3, 100
  br i1 %cmp93, label %if.end95, label %if.then94

if.then94:                                        ; preds = %if.end91
  tail call void @abort() noreturn nounwind
  unreachable

if.end95:                                         ; preds = %if.end91
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"long long", metadata !1}
