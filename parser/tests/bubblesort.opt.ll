; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/bubblesort.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.arr = internal unnamed_addr constant [7 x i32] [i32 -1, i32 2, i32 1, i32 3, i32 5, i32 -10, i32 -11], align 16
@.str = private unnamed_addr constant [23 x i8] c"array before sorting: \00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"array after bubblesort: \00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1

define void @bubble_sort(i8* %base, i64 %nmemb, i64 %size, i32 (i8*, i8*)* %compar) nounwind uwtable {
entry:
  %sub = add i64 %nmemb, 4294967295
  %conv = trunc i64 %sub to i32
  %cmp4 = icmp sgt i32 %conv, 0
  br i1 %cmp4, label %for.cond6.preheader.lr.ph, label %for.end34

for.cond6.preheader.lr.ph:                        ; preds = %entry
  %cmp1.i = icmp eq i64 %size, 0
  %tmp49 = and i64 %sub, 4294967295
  %tmp53 = sub i64 0, %size
  %tmp55 = sext i32 %conv to i64
  %tmp56 = mul i64 %tmp55, %size
  br label %for.body11.lr.ph

for.body11.lr.ph:                                 ; preds = %for.cond6.preheader.lr.ph, %for.inc32
  %indvar8 = phi i64 [ 0, %for.cond6.preheader.lr.ph ], [ %indvar.next9, %for.inc32 ]
  %tmp13 = sub i64 %tmp49, %indvar8
  %tmp54 = mul i64 %indvar8, %tmp53
  %tmp57 = add i64 %tmp56, %tmp54
  %add.ptr = getelementptr i8* %base, i64 %tmp57
  br i1 %cmp1.i, label %for.inc.us, label %for.body11

for.inc.us:                                       ; preds = %for.inc.us, %for.body11.lr.ph
  %indvar = phi i64 [ %indvar.next, %for.inc.us ], [ 0, %for.body11.lr.ph ]
  %tmp16 = mul i64 %indvar, %size
  %add.ptr21.us = getelementptr i8* %base, i64 %tmp16
  %call.us = tail call i32 %compar(i8* %add.ptr, i8* %add.ptr21.us) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp13
  br i1 %exitcond, label %for.inc32, label %for.inc.us

for.body11:                                       ; preds = %for.body11.lr.ph, %for.inc
  %indvar19 = phi i64 [ %indvar.next20, %for.inc ], [ 0, %for.body11.lr.ph ]
  %tmp44 = mul i64 %indvar19, %size
  %add.ptr21 = getelementptr i8* %base, i64 %tmp44
  %call = tail call i32 %compar(i8* %add.ptr, i8* %add.ptr21) nounwind
  %cmp25 = icmp sgt i32 %call, -1
  br i1 %cmp25, label %for.inc, label %for.body.i

for.body.i:                                       ; preds = %for.body11, %for.body.i
  %indvar.i = phi i64 [ %0, %for.body.i ], [ 0, %for.body11 ]
  %tmp58 = add i64 %tmp57, %indvar.i
  %arrayidx.i = getelementptr i8* %base, i64 %tmp58
  %tmp45 = add i64 %tmp44, %indvar.i
  %arrayidx22.i = getelementptr i8* %base, i64 %tmp45
  %tmp13.i = load i8* %arrayidx.i, align 1
  %tmp23.i = load i8* %arrayidx22.i, align 1
  store i8 %tmp23.i, i8* %arrayidx.i, align 1
  store i8 %tmp13.i, i8* %arrayidx22.i, align 1
  %0 = add i64 %indvar.i, 1
  %exitcond17 = icmp eq i64 %0, %size
  br i1 %exitcond17, label %for.inc, label %for.body.i

for.inc:                                          ; preds = %for.body.i, %for.body11
  %indvar.next20 = add i64 %indvar19, 1
  %exitcond43 = icmp eq i64 %indvar.next20, %tmp13
  br i1 %exitcond43, label %for.inc32, label %for.body11

for.inc32:                                        ; preds = %for.inc.us, %for.inc
  %indvar.next9 = add i64 %indvar8, 1
  %exitcond50 = icmp eq i64 %indvar.next9, %tmp49
  br i1 %exitcond50, label %for.end34, label %for.body11.lr.ph

for.end34:                                        ; preds = %for.inc32, %entry
  ret void
}

define i32 @int_cmp_fun(i8* %v1, i8* %v2) nounwind uwtable readonly {
entry:
  %0 = bitcast i8* %v1 to i32*
  %1 = bitcast i8* %v2 to i32*
  %tmp5 = load i32* %0, align 4
  %tmp7 = load i32* %1, align 4
  %cmp = icmp eq i32 %tmp5, %tmp7
  br i1 %cmp, label %if.end15, label %if.else

if.else:                                          ; preds = %entry
  %cmp12 = icmp slt i32 %tmp5, %tmp7
  %. = select i1 %cmp12, i32 -1, i32 1
  br label %if.end15

if.end15:                                         ; preds = %entry, %if.else
  %storemerge1 = phi i32 [ %., %if.else ], [ 0, %entry ]
  ret i32 %storemerge1
}

define i32 @main() nounwind uwtable {
entry:
  %arr = alloca [7 x i32], align 16
  %tmp = bitcast [7 x i32]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([7 x i32]* @main.arr to i8*), i64 28, i32 16, i1 false)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0)) nounwind
  %arraydecay = getelementptr inbounds [7 x i32]* %arr, i64 0, i64 0
  call fastcc void @print_int_arr(i32* %arraydecay)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %for.body11.lr.ph.i

for.body11.lr.ph.i:                               ; preds = %for.inc32.i, %entry
  %indvar8.i = phi i64 [ 0, %entry ], [ %2, %for.inc32.i ]
  %tmp16 = sub i64 6, %indvar8.i
  %scevgep = getelementptr [7 x i32]* %arr, i64 0, i64 %tmp16
  %scevgep78 = bitcast i32* %scevgep to i8*
  %arrayidx.i.i.3 = getelementptr i8* %scevgep78, i64 3
  %arrayidx.i.i.2 = getelementptr i8* %scevgep78, i64 2
  %arrayidx.i.i.1 = getelementptr i8* %scevgep78, i64 1
  br label %for.body11.i

for.body11.i:                                     ; preds = %for.inc.i, %for.body11.lr.ph.i
  %indvar19.i = phi i64 [ 0, %for.body11.lr.ph.i ], [ %1, %for.inc.i ]
  %add.ptr21.i2 = getelementptr [7 x i32]* %arr, i64 0, i64 %indvar19.i
  %scevgep4 = bitcast i32* %add.ptr21.i2 to i8*
  %arrayidx22.i.i.3 = getelementptr i8* %scevgep4, i64 3
  %arrayidx22.i.i.2 = getelementptr i8* %scevgep4, i64 2
  %arrayidx22.i.i.1 = getelementptr i8* %scevgep4, i64 1
  %tmp5.i = load i32* %scevgep, align 4
  %tmp7.i = load i32* %add.ptr21.i2, align 4
  %0 = icmp slt i32 %tmp5.i, %tmp7.i
  br i1 %0, label %for.body.i.i.preheader, label %for.inc.i

for.body.i.i.preheader:                           ; preds = %for.body11.i
  %tmp38 = trunc i32 %tmp7.i to i8
  %tmp37 = trunc i32 %tmp5.i to i8
  store i8 %tmp38, i8* %scevgep78, align 4
  store i8 %tmp37, i8* %scevgep4, align 4
  %tmp13.i.i.1 = load i8* %arrayidx.i.i.1, align 1
  %tmp23.i.i.1 = load i8* %arrayidx22.i.i.1, align 1
  store i8 %tmp23.i.i.1, i8* %arrayidx.i.i.1, align 1
  store i8 %tmp13.i.i.1, i8* %arrayidx22.i.i.1, align 1
  %tmp13.i.i.2 = load i8* %arrayidx.i.i.2, align 2
  %tmp23.i.i.2 = load i8* %arrayidx22.i.i.2, align 2
  store i8 %tmp23.i.i.2, i8* %arrayidx.i.i.2, align 2
  store i8 %tmp13.i.i.2, i8* %arrayidx22.i.i.2, align 2
  %tmp13.i.i.3 = load i8* %arrayidx.i.i.3, align 1
  %tmp23.i.i.3 = load i8* %arrayidx22.i.i.3, align 1
  store i8 %tmp23.i.i.3, i8* %arrayidx.i.i.3, align 1
  store i8 %tmp13.i.i.3, i8* %arrayidx22.i.i.3, align 1
  br label %for.inc.i

for.inc.i:                                        ; preds = %for.body.i.i.preheader, %for.body11.i
  %1 = add i64 %indvar19.i, 1
  %exitcond = icmp eq i64 %1, %tmp16
  br i1 %exitcond, label %for.inc32.i, label %for.body11.i

for.inc32.i:                                      ; preds = %for.inc.i
  %2 = add i64 %indvar8.i, 1
  %exitcond26 = icmp eq i64 %2, 6
  br i1 %exitcond26, label %bubble_sort.exit, label %for.body11.lr.ph.i

bubble_sort.exit:                                 ; preds = %for.inc32.i
  call fastcc void @print_int_arr(i32* %arraydecay)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define internal fastcc void @print_int_arr(i32* %arr) nounwind uwtable {
entry:
  %tmp5 = load i32* %arr, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %tmp5) nounwind
  %arrayidx.1 = getelementptr i32* %arr, i64 1
  %tmp5.1 = load i32* %arrayidx.1, align 4
  %call.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %tmp5.1) nounwind
  %arrayidx.2 = getelementptr i32* %arr, i64 2
  %tmp5.2 = load i32* %arrayidx.2, align 4
  %call.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %tmp5.2) nounwind
  %arrayidx.3 = getelementptr i32* %arr, i64 3
  %tmp5.3 = load i32* %arrayidx.3, align 4
  %call.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %tmp5.3) nounwind
  %arrayidx.4 = getelementptr i32* %arr, i64 4
  %tmp5.4 = load i32* %arrayidx.4, align 4
  %call.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %tmp5.4) nounwind
  %arrayidx.5 = getelementptr i32* %arr, i64 5
  %tmp5.5 = load i32* %arrayidx.5, align 4
  %call.5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %tmp5.5) nounwind
  %arrayidx.6 = getelementptr i32* %arr, i64 6
  %tmp5.6 = load i32* %arrayidx.6, align 4
  %call.6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %tmp5.6) nounwind
  %call7 = tail call i32 @putchar(i32 10) nounwind
  ret void
}

declare i32 @putchar(i32) nounwind
