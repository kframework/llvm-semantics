; ModuleID = '/home/david/src/c-semantics/tests/lcc-tests/struct.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.odd = type { [3 x i8] }
%struct.point = type { i32, i32 }
%struct.rect = type { %struct.point, %struct.point }

@y = global %struct.odd { [3 x i8] c"ab\00" }, align 1
@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@main.maxpt = private unnamed_addr constant %struct.point { i32 320, i32 320 }, align 4
@main.pts = private unnamed_addr constant [4 x %struct.point] [%struct.point { i32 -1, i32 -1 }, %struct.point { i32 1, i32 1 }, %struct.point { i32 20, i32 300 }, %struct.point { i32 500, i32 400 }], align 16
@.str1 = private unnamed_addr constant [12 x i8] c"(%d,%d) is \00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"not \00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"within [%d,%d; %d,%d]\0A\00", align 1

define i64 @addpoint(i64 %p1.coerce, i64 %p2.coerce) nounwind uwtable {
entry:
  %retval = alloca %struct.point, align 4
  %p1 = alloca %struct.point, align 8
  %p2 = alloca %struct.point, align 8
  %0 = bitcast %struct.point* %p1 to i64*
  store i64 %p1.coerce, i64* %0, align 1
  %1 = bitcast %struct.point* %p2 to i64*
  store i64 %p2.coerce, i64* %1, align 1
  %x = getelementptr inbounds %struct.point* %p2, i32 0, i32 0
  %2 = load i32* %x, align 4
  %x1 = getelementptr inbounds %struct.point* %p1, i32 0, i32 0
  %3 = load i32* %x1, align 4
  %add = add nsw i32 %3, %2
  store i32 %add, i32* %x1, align 4
  %y = getelementptr inbounds %struct.point* %p2, i32 0, i32 1
  %4 = load i32* %y, align 4
  %y2 = getelementptr inbounds %struct.point* %p1, i32 0, i32 1
  %5 = load i32* %y2, align 4
  %add3 = add nsw i32 %5, %4
  store i32 %add3, i32* %y2, align 4
  %6 = bitcast %struct.point* %retval to i8*
  %7 = bitcast %struct.point* %p1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 4, i1 false)
  %8 = bitcast %struct.point* %retval to i64*
  %9 = load i64* %8, align 1
  ret i64 %9
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define { i64, i64 } @canonrect(i64 %r.coerce0, i64 %r.coerce1) nounwind uwtable {
entry:
  %retval = alloca %struct.rect, align 4
  %r = alloca %struct.rect, align 8
  %temp = alloca %struct.rect, align 4
  %0 = bitcast %struct.rect* %r to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %r.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %r.coerce1, i64* %2
  %pt1 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %x = getelementptr inbounds %struct.point* %pt1, i32 0, i32 0
  %3 = load i32* %x, align 4
  %pt2 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %x1 = getelementptr inbounds %struct.point* %pt2, i32 0, i32 0
  %4 = load i32* %x1, align 4
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %pt12 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %x3 = getelementptr inbounds %struct.point* %pt12, i32 0, i32 0
  %5 = load i32* %x3, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %pt24 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %x5 = getelementptr inbounds %struct.point* %pt24, i32 0, i32 0
  %6 = load i32* %x5, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %5, %cond.true ], [ %6, %cond.false ]
  %pt16 = getelementptr inbounds %struct.rect* %temp, i32 0, i32 0
  %x7 = getelementptr inbounds %struct.point* %pt16, i32 0, i32 0
  store i32 %cond, i32* %x7, align 4
  %pt18 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %y = getelementptr inbounds %struct.point* %pt18, i32 0, i32 1
  %7 = load i32* %y, align 4
  %pt29 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %y10 = getelementptr inbounds %struct.point* %pt29, i32 0, i32 1
  %8 = load i32* %y10, align 4
  %cmp11 = icmp slt i32 %7, %8
  br i1 %cmp11, label %cond.true12, label %cond.false15

cond.true12:                                      ; preds = %cond.end
  %pt113 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %y14 = getelementptr inbounds %struct.point* %pt113, i32 0, i32 1
  %9 = load i32* %y14, align 4
  br label %cond.end18

cond.false15:                                     ; preds = %cond.end
  %pt216 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %y17 = getelementptr inbounds %struct.point* %pt216, i32 0, i32 1
  %10 = load i32* %y17, align 4
  br label %cond.end18

cond.end18:                                       ; preds = %cond.false15, %cond.true12
  %cond19 = phi i32 [ %9, %cond.true12 ], [ %10, %cond.false15 ]
  %pt120 = getelementptr inbounds %struct.rect* %temp, i32 0, i32 0
  %y21 = getelementptr inbounds %struct.point* %pt120, i32 0, i32 1
  store i32 %cond19, i32* %y21, align 4
  %pt122 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %x23 = getelementptr inbounds %struct.point* %pt122, i32 0, i32 0
  %11 = load i32* %x23, align 4
  %pt224 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %x25 = getelementptr inbounds %struct.point* %pt224, i32 0, i32 0
  %12 = load i32* %x25, align 4
  %cmp26 = icmp sgt i32 %11, %12
  br i1 %cmp26, label %cond.true27, label %cond.false30

cond.true27:                                      ; preds = %cond.end18
  %pt128 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %x29 = getelementptr inbounds %struct.point* %pt128, i32 0, i32 0
  %13 = load i32* %x29, align 4
  br label %cond.end33

cond.false30:                                     ; preds = %cond.end18
  %pt231 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %x32 = getelementptr inbounds %struct.point* %pt231, i32 0, i32 0
  %14 = load i32* %x32, align 4
  br label %cond.end33

cond.end33:                                       ; preds = %cond.false30, %cond.true27
  %cond34 = phi i32 [ %13, %cond.true27 ], [ %14, %cond.false30 ]
  %pt235 = getelementptr inbounds %struct.rect* %temp, i32 0, i32 1
  %x36 = getelementptr inbounds %struct.point* %pt235, i32 0, i32 0
  store i32 %cond34, i32* %x36, align 4
  %pt137 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %y38 = getelementptr inbounds %struct.point* %pt137, i32 0, i32 1
  %15 = load i32* %y38, align 4
  %pt239 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %y40 = getelementptr inbounds %struct.point* %pt239, i32 0, i32 1
  %16 = load i32* %y40, align 4
  %cmp41 = icmp sgt i32 %15, %16
  br i1 %cmp41, label %cond.true42, label %cond.false45

cond.true42:                                      ; preds = %cond.end33
  %pt143 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %y44 = getelementptr inbounds %struct.point* %pt143, i32 0, i32 1
  %17 = load i32* %y44, align 4
  br label %cond.end48

cond.false45:                                     ; preds = %cond.end33
  %pt246 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %y47 = getelementptr inbounds %struct.point* %pt246, i32 0, i32 1
  %18 = load i32* %y47, align 4
  br label %cond.end48

cond.end48:                                       ; preds = %cond.false45, %cond.true42
  %cond49 = phi i32 [ %17, %cond.true42 ], [ %18, %cond.false45 ]
  %pt250 = getelementptr inbounds %struct.rect* %temp, i32 0, i32 1
  %y51 = getelementptr inbounds %struct.point* %pt250, i32 0, i32 1
  store i32 %cond49, i32* %y51, align 4
  %19 = bitcast %struct.rect* %retval to i8*
  %20 = bitcast %struct.rect* %temp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %20, i64 16, i32 4, i1 false)
  %21 = bitcast %struct.rect* %retval to { i64, i64 }*
  %22 = load { i64, i64 }* %21, align 1
  ret { i64, i64 } %22
}

define i64 @makepoint(i32 %x, i32 %y) nounwind uwtable {
entry:
  %retval = alloca %struct.point, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %p = alloca %struct.point, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %0 = load i32* %x.addr, align 4
  %x1 = getelementptr inbounds %struct.point* %p, i32 0, i32 0
  store i32 %0, i32* %x1, align 4
  %1 = load i32* %y.addr, align 4
  %y2 = getelementptr inbounds %struct.point* %p, i32 0, i32 1
  store i32 %1, i32* %y2, align 4
  %2 = bitcast %struct.point* %retval to i8*
  %3 = bitcast %struct.point* %p to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 8, i32 4, i1 false)
  %4 = bitcast %struct.point* %retval to i64*
  %5 = load i64* %4, align 1
  ret i64 %5
}

define { i64, i64 } @makerect(i64 %p1.coerce, i64 %p2.coerce) nounwind uwtable {
entry:
  %retval = alloca %struct.rect, align 4
  %p1 = alloca %struct.point, align 8
  %p2 = alloca %struct.point, align 8
  %r = alloca %struct.rect, align 4
  %0 = bitcast %struct.point* %p1 to i64*
  store i64 %p1.coerce, i64* %0, align 1
  %1 = bitcast %struct.point* %p2 to i64*
  store i64 %p2.coerce, i64* %1, align 1
  %pt1 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %2 = bitcast %struct.point* %pt1 to i8*
  %3 = bitcast %struct.point* %p1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 8, i32 4, i1 false)
  %pt2 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %4 = bitcast %struct.point* %pt2 to i8*
  %5 = bitcast %struct.point* %p2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 8, i32 4, i1 false)
  %6 = bitcast %struct.rect* %r to { i64, i64 }*
  %7 = getelementptr { i64, i64 }* %6, i32 0, i32 0
  %8 = load i64* %7, align 1
  %9 = getelementptr { i64, i64 }* %6, i32 0, i32 1
  %10 = load i64* %9, align 1
  %call = call { i64, i64 } @canonrect(i64 %8, i64 %10)
  %11 = bitcast %struct.rect* %retval to { i64, i64 }*
  %12 = getelementptr { i64, i64 }* %11, i32 0, i32 0
  %13 = extractvalue { i64, i64 } %call, 0
  store i64 %13, i64* %12, align 1
  %14 = getelementptr { i64, i64 }* %11, i32 0, i32 1
  %15 = extractvalue { i64, i64 } %call, 1
  store i64 %15, i64* %14, align 1
  %16 = bitcast %struct.rect* %retval to { i64, i64 }*
  %17 = load { i64, i64 }* %16, align 1
  ret { i64, i64 } %17
}

define i32 @ptinrect(i64 %p.coerce, i64 %r.coerce0, i64 %r.coerce1) nounwind uwtable {
entry:
  %p = alloca %struct.point, align 8
  %r = alloca %struct.rect, align 8
  %0 = bitcast %struct.point* %p to i64*
  store i64 %p.coerce, i64* %0, align 1
  %1 = bitcast %struct.rect* %r to { i64, i64 }*
  %2 = getelementptr { i64, i64 }* %1, i32 0, i32 0
  store i64 %r.coerce0, i64* %2
  %3 = getelementptr { i64, i64 }* %1, i32 0, i32 1
  store i64 %r.coerce1, i64* %3
  %x = getelementptr inbounds %struct.point* %p, i32 0, i32 0
  %4 = load i32* %x, align 4
  %pt1 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %x1 = getelementptr inbounds %struct.point* %pt1, i32 0, i32 0
  %5 = load i32* %x1, align 4
  %cmp = icmp sge i32 %4, %5
  br i1 %cmp, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %x2 = getelementptr inbounds %struct.point* %p, i32 0, i32 0
  %6 = load i32* %x2, align 4
  %pt2 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %x3 = getelementptr inbounds %struct.point* %pt2, i32 0, i32 0
  %7 = load i32* %x3, align 4
  %cmp4 = icmp slt i32 %6, %7
  br i1 %cmp4, label %land.lhs.true5, label %land.end

land.lhs.true5:                                   ; preds = %land.lhs.true
  %y = getelementptr inbounds %struct.point* %p, i32 0, i32 1
  %8 = load i32* %y, align 4
  %pt16 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %y7 = getelementptr inbounds %struct.point* %pt16, i32 0, i32 1
  %9 = load i32* %y7, align 4
  %cmp8 = icmp sge i32 %8, %9
  br i1 %cmp8, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true5
  %y9 = getelementptr inbounds %struct.point* %p, i32 0, i32 1
  %10 = load i32* %y9, align 4
  %pt210 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %y11 = getelementptr inbounds %struct.point* %pt210, i32 0, i32 1
  %11 = load i32* %y11, align 4
  %cmp12 = icmp slt i32 %10, %11
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true5, %land.lhs.true, %entry
  %12 = phi i1 [ false, %land.lhs.true5 ], [ false, %land.lhs.true ], [ false, %entry ], [ %cmp12, %land.rhs ]
  %land.ext = zext i1 %12 to i32
  ret i32 %land.ext
}

define void @odd(i24 %y.coerce) nounwind uwtable {
entry:
  %y = alloca %struct.odd, align 4
  %tmp = alloca i24
  %x = alloca %struct.odd, align 1
  %coerce.dive = getelementptr %struct.odd* %y, i32 0, i32 0
  store i24 %y.coerce, i24* %tmp
  %0 = bitcast i24* %tmp to [3 x i8]*
  %1 = load [3 x i8]* %0, align 1
  store [3 x i8] %1, [3 x i8]* %coerce.dive
  %2 = bitcast %struct.odd* %x to i8*
  %3 = bitcast %struct.odd* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 3, i32 1, i1 false)
  %a = getelementptr inbounds %struct.odd* %x, i32 0, i32 0
  %arraydecay = getelementptr inbounds [3 x i8]* %a, i32 0, i32 0
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8* %arraydecay)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.point, align 4
  %origin = alloca %struct.point, align 4
  %maxpt = alloca %struct.point, align 4
  %pts = alloca [4 x %struct.point], align 16
  %screen = alloca %struct.rect, align 4
  %agg.tmp = alloca %struct.point, align 4
  %agg.tmp1 = alloca %struct.point, align 4
  %agg.tmp3 = alloca %struct.point, align 4
  %agg.tmp4 = alloca %struct.point, align 4
  %tmp = alloca %struct.point, align 4
  %coerce = alloca %struct.point, align 4
  %tmp29 = alloca i24
  store i32 0, i32* %retval
  %0 = bitcast %struct.point* %origin to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 8, i32 4, i1 false)
  %1 = bitcast %struct.point* %maxpt to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast (%struct.point* @main.maxpt to i8*), i64 8, i32 4, i1 false)
  %2 = bitcast [4 x %struct.point]* %pts to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([4 x %struct.point]* @main.pts to i8*), i64 32, i32 16, i1 false)
  %call = call i64 @makepoint(i32 -10, i32 -10)
  %3 = bitcast %struct.point* %agg.tmp1 to i64*
  store i64 %call, i64* %3, align 1
  %4 = bitcast %struct.point* %maxpt to i64*
  %5 = load i64* %4, align 1
  %6 = bitcast %struct.point* %agg.tmp1 to i64*
  %7 = load i64* %6, align 1
  %call2 = call i64 @addpoint(i64 %5, i64 %7)
  %8 = bitcast %struct.point* %agg.tmp to i64*
  store i64 %call2, i64* %8, align 1
  %call5 = call i64 @makepoint(i32 10, i32 10)
  %9 = bitcast %struct.point* %agg.tmp4 to i64*
  store i64 %call5, i64* %9, align 1
  %10 = bitcast %struct.point* %origin to i64*
  %11 = load i64* %10, align 1
  %12 = bitcast %struct.point* %agg.tmp4 to i64*
  %13 = load i64* %12, align 1
  %call6 = call i64 @addpoint(i64 %11, i64 %13)
  %14 = bitcast %struct.point* %agg.tmp3 to i64*
  store i64 %call6, i64* %14, align 1
  %15 = bitcast %struct.point* %agg.tmp to i64*
  %16 = load i64* %15, align 1
  %17 = bitcast %struct.point* %agg.tmp3 to i64*
  %18 = load i64* %17, align 1
  %call7 = call { i64, i64 } @makerect(i64 %16, i64 %18)
  %19 = bitcast %struct.rect* %screen to { i64, i64 }*
  %20 = getelementptr { i64, i64 }* %19, i32 0, i32 0
  %21 = extractvalue { i64, i64 } %call7, 0
  store i64 %21, i64* %20, align 1
  %22 = getelementptr { i64, i64 }* %19, i32 0, i32 1
  %23 = extractvalue { i64, i64 } %call7, 1
  store i64 %23, i64* %22, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %24 = load i32* %i, align 4
  %conv = sext i32 %24 to i64
  %cmp = icmp ult i64 %conv, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %25 = load i32* %i, align 4
  %idxprom = sext i32 %25 to i64
  %arrayidx = getelementptr inbounds [4 x %struct.point]* %pts, i32 0, i64 %idxprom
  %x9 = getelementptr inbounds %struct.point* %arrayidx, i32 0, i32 0
  %26 = load i32* %x9, align 4
  %27 = load i32* %i, align 4
  %idxprom10 = sext i32 %27 to i64
  %arrayidx11 = getelementptr inbounds [4 x %struct.point]* %pts, i32 0, i64 %idxprom10
  %x12 = getelementptr inbounds %struct.point* %arrayidx11, i32 0, i32 0
  %28 = load i32* %x12, align 4
  %29 = load i32* %i, align 4
  %idxprom13 = sext i32 %29 to i64
  %arrayidx14 = getelementptr inbounds [4 x %struct.point]* %pts, i32 0, i64 %idxprom13
  %y = getelementptr inbounds %struct.point* %arrayidx14, i32 0, i32 1
  %30 = load i32* %y, align 4
  %call15 = call i64 @makepoint(i32 %28, i32 %30)
  %31 = bitcast %struct.point* %coerce to i64*
  store i64 %call15, i64* %31, align 1
  %32 = bitcast %struct.point* %x to i8*
  %33 = bitcast %struct.point* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 8, i32 4, i1 false)
  %34 = bitcast %struct.point* %tmp to i8*
  %35 = bitcast %struct.point* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %34, i8* %35, i64 8, i32 4, i1 false)
  %y16 = getelementptr inbounds %struct.point* %tmp, i32 0, i32 1
  %36 = load i32* %y16, align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 %26, i32 %36)
  %37 = bitcast %struct.point* %x to i64*
  %38 = load i64* %37, align 1
  %39 = bitcast %struct.rect* %screen to { i64, i64 }*
  %40 = getelementptr { i64, i64 }* %39, i32 0, i32 0
  %41 = load i64* %40, align 1
  %42 = getelementptr { i64, i64 }* %39, i32 0, i32 1
  %43 = load i64* %42, align 1
  %call18 = call i32 @ptinrect(i64 %38, i64 %41, i64 %43)
  %cmp19 = icmp eq i32 %call18, 0
  br i1 %cmp19, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %pt1 = getelementptr inbounds %struct.rect* %screen, i32 0, i32 0
  %x22 = getelementptr inbounds %struct.point* %pt1, i32 0, i32 0
  %44 = load i32* %x22, align 4
  %pt123 = getelementptr inbounds %struct.rect* %screen, i32 0, i32 0
  %y24 = getelementptr inbounds %struct.point* %pt123, i32 0, i32 1
  %45 = load i32* %y24, align 4
  %pt2 = getelementptr inbounds %struct.rect* %screen, i32 0, i32 1
  %x25 = getelementptr inbounds %struct.point* %pt2, i32 0, i32 0
  %46 = load i32* %x25, align 4
  %pt226 = getelementptr inbounds %struct.rect* %screen, i32 0, i32 1
  %y27 = getelementptr inbounds %struct.point* %pt226, i32 0, i32 1
  %47 = load i32* %y27, align 4
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %44, i32 %45, i32 %46, i32 %47)
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %48 = load i32* %i, align 4
  %inc = add nsw i32 %48, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %49 = bitcast i24* %tmp29 to [3 x i8]*
  %50 = load [3 x i8]* getelementptr inbounds (%struct.odd* @y, i32 0, i32 0)
  store [3 x i8] %50, [3 x i8]* %49, align 1
  %51 = load i24* %tmp29
  call void @odd(i24 %51)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %52 = load i32* %retval
  ret i32 %52
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @exit(i32) noreturn nounwind
