; ModuleID = '/home/david/src/c-semantics/tests/unitTests/passArray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = private unnamed_addr constant [5 x i8] c"Bug1\00"
@str4 = private unnamed_addr constant [5 x i8] c"Bug2\00"
@str5 = private unnamed_addr constant [5 x i8] c"Bug3\00"
@str6 = private unnamed_addr constant [5 x i8] c"Bug4\00"

define i32 @array(i32* nocapture %a, i32 %size, i32 %start) nounwind uwtable readonly {
entry:
  %0 = zext i32 %start to i64
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %1 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %1, %size
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i32* %a, i64 %indvars.iv
  %2 = load i32* %arrayidx, align 4, !tbaa !0
  %3 = add nsw i64 %indvars.iv, %0
  %4 = trunc i64 %3 to i32
  %cmp1 = icmp eq i32 %2, %4
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp1, label %for.cond, label %return

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ 1, %for.body ], [ 0, %for.cond ]
  ret i32 %retval.0
}

define i32 @main() nounwind uwtable {
entry:
  %x3d = alloca [3 x [5 x [7 x i32]]], align 16
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.cond1.preheader ]
  %0 = mul nsw i64 %indvars.iv, 35
  %arrayidx12 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 0, i64 0
  %1 = trunc i64 %0 to i32
  store i32 %1, i32* %arrayidx12, align 4, !tbaa !0
  %2 = add i64 %0, 1
  %arrayidx12.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 0, i64 1
  %3 = trunc i64 %2 to i32
  store i32 %3, i32* %arrayidx12.1, align 4, !tbaa !0
  %4 = add i64 %0, 2
  %arrayidx12.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 0, i64 2
  %5 = trunc i64 %4 to i32
  store i32 %5, i32* %arrayidx12.2, align 4, !tbaa !0
  %6 = add i64 %0, 3
  %arrayidx12.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 0, i64 3
  %7 = trunc i64 %6 to i32
  store i32 %7, i32* %arrayidx12.3, align 4, !tbaa !0
  %8 = add i64 %0, 4
  %arrayidx12.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 0, i64 4
  %9 = trunc i64 %8 to i32
  store i32 %9, i32* %arrayidx12.4, align 4, !tbaa !0
  %10 = add i64 %0, 5
  %arrayidx12.5 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 0, i64 5
  %11 = trunc i64 %10 to i32
  store i32 %11, i32* %arrayidx12.5, align 4, !tbaa !0
  %12 = add i64 %0, 6
  %arrayidx12.6 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 0, i64 6
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %arrayidx12.6, align 4, !tbaa !0
  %14 = add i64 %0, 7
  %arrayidx12.187 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 1, i64 0
  %15 = trunc i64 %14 to i32
  store i32 %15, i32* %arrayidx12.187, align 4, !tbaa !0
  %16 = add i64 %0, 8
  %arrayidx12.1.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 1, i64 1
  %17 = trunc i64 %16 to i32
  store i32 %17, i32* %arrayidx12.1.1, align 4, !tbaa !0
  %18 = add i64 %0, 9
  %arrayidx12.2.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 1, i64 2
  %19 = trunc i64 %18 to i32
  store i32 %19, i32* %arrayidx12.2.1, align 4, !tbaa !0
  %20 = add i64 %0, 10
  %arrayidx12.3.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 1, i64 3
  %21 = trunc i64 %20 to i32
  store i32 %21, i32* %arrayidx12.3.1, align 4, !tbaa !0
  %22 = add i64 %0, 11
  %arrayidx12.4.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 1, i64 4
  %23 = trunc i64 %22 to i32
  store i32 %23, i32* %arrayidx12.4.1, align 4, !tbaa !0
  %24 = add i64 %0, 12
  %arrayidx12.5.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 1, i64 5
  %25 = trunc i64 %24 to i32
  store i32 %25, i32* %arrayidx12.5.1, align 4, !tbaa !0
  %26 = add i64 %0, 13
  %arrayidx12.6.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 1, i64 6
  %27 = trunc i64 %26 to i32
  store i32 %27, i32* %arrayidx12.6.1, align 4, !tbaa !0
  %28 = add i64 %0, 14
  %arrayidx12.288 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 2, i64 0
  %29 = trunc i64 %28 to i32
  store i32 %29, i32* %arrayidx12.288, align 4, !tbaa !0
  %30 = add i64 %0, 15
  %arrayidx12.1.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 2, i64 1
  %31 = trunc i64 %30 to i32
  store i32 %31, i32* %arrayidx12.1.2, align 4, !tbaa !0
  %32 = add i64 %0, 16
  %arrayidx12.2.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 2, i64 2
  %33 = trunc i64 %32 to i32
  store i32 %33, i32* %arrayidx12.2.2, align 4, !tbaa !0
  %34 = add i64 %0, 17
  %arrayidx12.3.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 2, i64 3
  %35 = trunc i64 %34 to i32
  store i32 %35, i32* %arrayidx12.3.2, align 4, !tbaa !0
  %36 = add i64 %0, 18
  %arrayidx12.4.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 2, i64 4
  %37 = trunc i64 %36 to i32
  store i32 %37, i32* %arrayidx12.4.2, align 4, !tbaa !0
  %38 = add i64 %0, 19
  %arrayidx12.5.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 2, i64 5
  %39 = trunc i64 %38 to i32
  store i32 %39, i32* %arrayidx12.5.2, align 4, !tbaa !0
  %40 = add i64 %0, 20
  %arrayidx12.6.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 2, i64 6
  %41 = trunc i64 %40 to i32
  store i32 %41, i32* %arrayidx12.6.2, align 4, !tbaa !0
  %42 = add i64 %0, 21
  %arrayidx12.389 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 3, i64 0
  %43 = trunc i64 %42 to i32
  store i32 %43, i32* %arrayidx12.389, align 4, !tbaa !0
  %44 = add i64 %0, 22
  %arrayidx12.1.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 3, i64 1
  %45 = trunc i64 %44 to i32
  store i32 %45, i32* %arrayidx12.1.3, align 4, !tbaa !0
  %46 = add i64 %0, 23
  %arrayidx12.2.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 3, i64 2
  %47 = trunc i64 %46 to i32
  store i32 %47, i32* %arrayidx12.2.3, align 4, !tbaa !0
  %48 = add i64 %0, 24
  %arrayidx12.3.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 3, i64 3
  %49 = trunc i64 %48 to i32
  store i32 %49, i32* %arrayidx12.3.3, align 4, !tbaa !0
  %50 = add i64 %0, 25
  %arrayidx12.4.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 3, i64 4
  %51 = trunc i64 %50 to i32
  store i32 %51, i32* %arrayidx12.4.3, align 4, !tbaa !0
  %52 = add i64 %0, 26
  %arrayidx12.5.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 3, i64 5
  %53 = trunc i64 %52 to i32
  store i32 %53, i32* %arrayidx12.5.3, align 4, !tbaa !0
  %54 = add i64 %0, 27
  %arrayidx12.6.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 3, i64 6
  %55 = trunc i64 %54 to i32
  store i32 %55, i32* %arrayidx12.6.3, align 4, !tbaa !0
  %56 = add i64 %0, 28
  %arrayidx12.490 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 4, i64 0
  %57 = trunc i64 %56 to i32
  store i32 %57, i32* %arrayidx12.490, align 4, !tbaa !0
  %58 = add i64 %0, 29
  %arrayidx12.1.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 4, i64 1
  %59 = trunc i64 %58 to i32
  store i32 %59, i32* %arrayidx12.1.4, align 4, !tbaa !0
  %60 = add i64 %0, 30
  %arrayidx12.2.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 4, i64 2
  %61 = trunc i64 %60 to i32
  store i32 %61, i32* %arrayidx12.2.4, align 4, !tbaa !0
  %62 = add i64 %0, 31
  %arrayidx12.3.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 4, i64 3
  %63 = trunc i64 %62 to i32
  store i32 %63, i32* %arrayidx12.3.4, align 4, !tbaa !0
  %64 = add i64 %0, 32
  %arrayidx12.4.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 4, i64 4
  %65 = trunc i64 %64 to i32
  store i32 %65, i32* %arrayidx12.4.4, align 4, !tbaa !0
  %66 = add i64 %0, 33
  %arrayidx12.5.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 4, i64 5
  %67 = trunc i64 %66 to i32
  store i32 %67, i32* %arrayidx12.5.4, align 4, !tbaa !0
  %68 = add i64 %0, 34
  %arrayidx12.6.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 %indvars.iv, i64 4, i64 6
  %69 = trunc i64 %68 to i32
  store i32 %69, i32* %arrayidx12.6.4, align 4, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 3
  br i1 %exitcond, label %for.cond.i, label %for.cond1.preheader

for.cond.i:                                       ; preds = %for.cond1.preheader, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.cond1.preheader ]
  %70 = trunc i64 %indvars.iv.i to i32
  %cmp.i = icmp slt i32 %70, 105
  br i1 %cmp.i, label %for.body.i, label %for.cond.i62

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 0, i64 0, i64 %indvars.iv.i
  %71 = load i32* %arrayidx.i, align 4, !tbaa !0
  %cmp1.i = icmp eq i32 %71, %70
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  br i1 %cmp1.i, label %for.cond.i, label %if.then

if.then:                                          ; preds = %for.body.i
  %puts = call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @str, i64 0, i64 0))
  br label %for.cond.i62

for.cond.i62:                                     ; preds = %if.then, %for.cond.i, %for.body.i66
  %indvars.iv.i60 = phi i64 [ %indvars.iv.next.i65, %for.body.i66 ], [ 0, %for.cond.i ], [ 0, %if.then ]
  %72 = trunc i64 %indvars.iv.i60 to i32
  %cmp.i61 = icmp slt i32 %72, 35
  br i1 %cmp.i61, label %for.body.i66, label %for.cond.i53

for.body.i66:                                     ; preds = %for.cond.i62
  %arrayidx.i63 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 0, i64 %indvars.iv.i60
  %73 = load i32* %arrayidx.i63, align 4, !tbaa !0
  %74 = add nsw i64 %indvars.iv.i60, 35
  %75 = trunc i64 %74 to i32
  %cmp1.i64 = icmp eq i32 %73, %75
  %indvars.iv.next.i65 = add i64 %indvars.iv.i60, 1
  br i1 %cmp1.i64, label %for.cond.i62, label %if.then28

if.then28:                                        ; preds = %for.body.i66
  %puts69 = call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @str4, i64 0, i64 0))
  br label %for.cond.i53

for.cond.i53:                                     ; preds = %if.then28, %for.cond.i62, %for.body.i57
  %indvars.iv.i51 = phi i64 [ %indvars.iv.next.i56, %for.body.i57 ], [ 0, %for.cond.i62 ], [ 0, %if.then28 ]
  %76 = trunc i64 %indvars.iv.i51 to i32
  %cmp.i52 = icmp slt i32 %76, 7
  br i1 %cmp.i52, label %for.body.i57, label %if.end40

for.body.i57:                                     ; preds = %for.cond.i53
  %arrayidx.i54 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 2, i64 %indvars.iv.i51
  %77 = load i32* %arrayidx.i54, align 4, !tbaa !0
  %78 = add nsw i64 %indvars.iv.i51, 49
  %79 = trunc i64 %78 to i32
  %cmp1.i55 = icmp eq i32 %77, %79
  %indvars.iv.next.i56 = add i64 %indvars.iv.i51, 1
  br i1 %cmp1.i55, label %for.cond.i53, label %if.then38

if.then38:                                        ; preds = %for.body.i57
  %puts70 = call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @str5, i64 0, i64 0))
  br label %if.end40

if.end40:                                         ; preds = %for.cond.i53, %if.then38
  %arrayidx46 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 2, i64 3
  %80 = load i32* %arrayidx46, align 4, !tbaa !0
  %tobool47 = icmp eq i32 %80, 52
  br i1 %tobool47, label %if.end50, label %if.then48

if.then48:                                        ; preds = %if.end40
  %puts71 = call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @str6, i64 0, i64 0))
  br label %if.end50

if.end50:                                         ; preds = %if.end40, %if.then48
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
