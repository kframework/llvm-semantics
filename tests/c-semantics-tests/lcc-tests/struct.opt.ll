; ModuleID = '/home/david/src/c-semantics/tests/lcc-tests/struct.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.odd = type { [3 x i8] }

@y = global %struct.odd { [3 x i8] c"ab\00" }, align 1
@.str1 = private unnamed_addr constant [12 x i8] c"(%d,%d) is \00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"not \00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"within [%d,%d; %d,%d]\0A\00", align 1

define i64 @addpoint(i64 %p1.coerce, i64 %p2.coerce) nounwind uwtable readnone {
entry:
  %sroa.store.elt5 = and i64 %p1.coerce, -4294967296
  %add = add i64 %p2.coerce, %p1.coerce
  %0 = and i64 %add, 4294967295
  %sroa.store.elt10 = add i64 %sroa.store.elt5, %p2.coerce
  %1 = and i64 %sroa.store.elt10, -4294967296
  %2 = or i64 %1, %0
  ret i64 %2
}

define { i64, i64 } @canonrect(i64 %r.coerce0, i64 %r.coerce1) nounwind uwtable readnone {
entry:
  %0 = trunc i64 %r.coerce0 to i32
  %sroa.store.elt57 = lshr i64 %r.coerce0, 32
  %1 = trunc i64 %sroa.store.elt57 to i32
  %2 = trunc i64 %r.coerce1 to i32
  %sroa.store.elt = lshr i64 %r.coerce1, 32
  %3 = trunc i64 %sroa.store.elt to i32
  %cmp = icmp slt i32 %0, %2
  %. = select i1 %cmp, i32 %0, i32 %2
  %cmp11 = icmp slt i32 %1, %3
  %cond19 = select i1 %cmp11, i32 %1, i32 %3
  %cmp26 = icmp sgt i32 %0, %2
  %.67 = select i1 %cmp26, i32 %0, i32 %2
  %cmp41 = icmp sgt i32 %1, %3
  %cond49 = select i1 %cmp41, i32 %1, i32 %3
  %4 = zext i32 %. to i64
  %5 = zext i32 %cond19 to i64
  %6 = shl nuw i64 %5, 32
  %ins = or i64 %6, %4
  %7 = zext i32 %.67 to i64
  %8 = zext i32 %cond49 to i64
  %9 = shl nuw i64 %8, 32
  %ins63 = or i64 %9, %7
  %10 = insertvalue { i64, i64 } undef, i64 %ins, 0
  %11 = insertvalue { i64, i64 } %10, i64 %ins63, 1
  ret { i64, i64 } %11
}

define i64 @makepoint(i32 %x, i32 %y) nounwind uwtable readnone {
entry:
  %0 = zext i32 %x to i64
  %1 = zext i32 %y to i64
  %2 = shl nuw i64 %1, 32
  %3 = or i64 %2, %0
  ret i64 %3
}

define { i64, i64 } @makerect(i64 %p1.coerce, i64 %p2.coerce) nounwind uwtable readnone {
entry:
  %0 = trunc i64 %p1.coerce to i32
  %sroa.store.elt57.i = lshr i64 %p1.coerce, 32
  %1 = trunc i64 %sroa.store.elt57.i to i32
  %2 = trunc i64 %p2.coerce to i32
  %sroa.store.elt.i = lshr i64 %p2.coerce, 32
  %3 = trunc i64 %sroa.store.elt.i to i32
  %cmp.i = icmp slt i32 %0, %2
  %..i = select i1 %cmp.i, i32 %0, i32 %2
  %cmp11.i = icmp slt i32 %1, %3
  %cond19.i = select i1 %cmp11.i, i32 %1, i32 %3
  %cmp26.i = icmp sgt i32 %0, %2
  %.67.i = select i1 %cmp26.i, i32 %0, i32 %2
  %cmp41.i = icmp sgt i32 %1, %3
  %cond49.i = select i1 %cmp41.i, i32 %1, i32 %3
  %4 = zext i32 %..i to i64
  %5 = zext i32 %cond19.i to i64
  %6 = shl nuw i64 %5, 32
  %ins.i = or i64 %6, %4
  %7 = zext i32 %.67.i to i64
  %8 = zext i32 %cond49.i to i64
  %9 = shl nuw i64 %8, 32
  %ins63.i = or i64 %9, %7
  %10 = insertvalue { i64, i64 } undef, i64 %ins.i, 0
  %11 = insertvalue { i64, i64 } %10, i64 %ins63.i, 1
  ret { i64, i64 } %11
}

define i32 @ptinrect(i64 %p.coerce, i64 %r.coerce0, i64 %r.coerce1) nounwind uwtable readnone {
entry:
  %0 = trunc i64 %p.coerce to i32
  %sroa.store.elt15 = lshr i64 %p.coerce, 32
  %1 = trunc i64 %sroa.store.elt15 to i32
  %2 = trunc i64 %r.coerce0 to i32
  %cmp = icmp slt i32 %0, %2
  br i1 %cmp, label %land.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %sroa.store.elt = lshr i64 %r.coerce1, 32
  %sroa.store.elt14 = lshr i64 %r.coerce0, 32
  %3 = trunc i64 %sroa.store.elt to i32
  %4 = trunc i64 %sroa.store.elt14 to i32
  %5 = trunc i64 %r.coerce1 to i32
  %cmp12 = icmp slt i32 %1, %3
  %notlhs = icmp slt i32 %0, %5
  %notrhs = icmp sge i32 %1, %4
  %not.or.cond = and i1 %notrhs, %notlhs
  %.cmp12 = and i1 %cmp12, %not.or.cond
  br label %land.end

land.end:                                         ; preds = %land.lhs.true, %entry
  %6 = phi i1 [ false, %entry ], [ %.cmp12, %land.lhs.true ]
  %land.ext = zext i1 %6 to i32
  ret i32 %land.ext
}

define void @odd(i24 %y.coerce) nounwind uwtable {
entry:
  %x = alloca %struct.odd, align 1
  %0 = trunc i24 %y.coerce to i8
  %1 = lshr i24 %y.coerce, 8
  %2 = trunc i24 %1 to i8
  %3 = lshr i24 %y.coerce, 16
  %4 = trunc i24 %3 to i8
  %x2.0 = getelementptr inbounds %struct.odd* %x, i64 0, i32 0, i64 0
  store i8 %0, i8* %x2.0, align 1
  %x2.1 = getelementptr inbounds %struct.odd* %x, i64 0, i32 0, i64 1
  store i8 %2, i8* %x2.1, align 1
  %x2.2 = getelementptr inbounds %struct.odd* %x, i64 0, i32 0, i64 2
  store i8 %4, i8* %x2.2, align 1
  %puts = call i32 @puts(i8* %x2.0)
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() noreturn nounwind uwtable {
if.end.3:
  %x.i = alloca %struct.odd, align 1
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 -1, i32 -1) nounwind
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str2, i64 0, i64 0)) nounwind
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 10, i32 10, i32 310, i32 310) nounwind
  %call17.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 1, i32 1) nounwind
  %call21.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str2, i64 0, i64 0)) nounwind
  %call28.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 10, i32 10, i32 310, i32 310) nounwind
  %call17.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 20, i32 300) nounwind
  %call28.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 10, i32 10, i32 310, i32 310) nounwind
  %call17.3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 500, i32 400) nounwind
  %call21.3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str2, i64 0, i64 0)) nounwind
  %call28.3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 10, i32 10, i32 310, i32 310) nounwind
  %0 = load [3 x i8]* getelementptr inbounds (%struct.odd* @y, i64 0, i32 0), align 1
  %1 = extractvalue [3 x i8] %0, 0
  %2 = zext i8 %1 to i32
  %3 = extractvalue [3 x i8] %0, 1
  %4 = zext i8 %3 to i32
  %5 = shl nuw nsw i32 %4, 8
  %6 = extractvalue [3 x i8] %0, 2
  %7 = zext i8 %6 to i32
  %8 = shl nuw nsw i32 %7, 16
  %ins31 = or i32 %8, %2
  %ins33 = or i32 %ins31, %5
  %9 = trunc i32 %ins33 to i24
  %10 = getelementptr inbounds %struct.odd* %x.i, i64 0, i32 0, i64 0
  call void @llvm.lifetime.start(i64 -1, i8* %10) nounwind
  %11 = lshr i24 %9, 8
  %12 = trunc i24 %11 to i8
  %13 = lshr i24 %9, 16
  %14 = trunc i24 %13 to i8
  store i8 %1, i8* %10, align 1
  %x2.1.i = getelementptr inbounds %struct.odd* %x.i, i64 0, i32 0, i64 1
  store i8 %12, i8* %x2.1.i, align 1
  %x2.2.i = getelementptr inbounds %struct.odd* %x.i, i64 0, i32 0, i64 2
  store i8 %14, i8* %x2.2.i, align 1
  %puts.i = call i32 @puts(i8* %10) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %10) nounwind
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

declare i32 @puts(i8* nocapture) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
