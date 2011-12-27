; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/passArray.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@str = internal constant [5 x i8] c"Bug1\00"
@str1 = internal constant [5 x i8] c"Bug2\00"
@str2 = internal constant [5 x i8] c"Bug3\00"
@str3 = internal constant [5 x i8] c"Bug4\00"

define i32 @array(i32* %a, i32 %size, i32 %start) nounwind uwtable readonly {
entry:
  %tmp = zext i32 %start to i64
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, %size
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %tmp2 = add i64 %tmp, %indvar
  %arrayidx = getelementptr i32* %a, i64 %indvar
  %add = trunc i64 %tmp2 to i32
  %tmp4 = load i32* %arrayidx, align 4
  %cmp7 = icmp eq i32 %tmp4, %add
  br i1 %cmp7, label %for.inc, label %return

for.inc:                                          ; preds = %for.body
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body
  %storemerge1 = phi i32 [ 1, %for.body ], [ 0, %for.cond ]
  ret i32 %storemerge1
}

define i32 @main() nounwind uwtable {
entry:
  %x3d = alloca [3 x [5 x [7 x i32]]], align 16
  br label %for.cond7.preheader

for.cond7.preheader:                              ; preds = %for.cond7.preheader, %entry
  %indvar54 = phi i64 [ 0, %entry ], [ %indvar.next55, %for.cond7.preheader ]
  %arrayidx22 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 0, i64 %indvar54, i64 0
  %tmp89 = mul i64 %indvar54, 7
  %tmp92 = add i64 %tmp89, 1
  %add15.1 = trunc i64 %tmp92 to i32
  %tmp95 = add i64 %tmp89, 2
  %add15.2 = trunc i64 %tmp95 to i32
  %tmp98 = add i64 %tmp89, 3
  %add15.3 = trunc i64 %tmp98 to i32
  %tmp101 = add i64 %tmp89, 4
  %add15.4 = trunc i64 %tmp101 to i32
  %tmp104 = add i64 %tmp89, 5
  %add15.5 = trunc i64 %tmp104 to i32
  %tmp107 = add i64 %tmp89, 6
  %add15.6 = trunc i64 %tmp107 to i32
  %add15 = trunc i64 %tmp89 to i32
  %arrayidx22.1 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 0, i64 %indvar54, i64 1
  %arrayidx22.2 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 0, i64 %indvar54, i64 2
  %arrayidx22.3 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 0, i64 %indvar54, i64 3
  %arrayidx22.4 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 0, i64 %indvar54, i64 4
  %arrayidx22.5 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 0, i64 %indvar54, i64 5
  %arrayidx22.6 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 0, i64 %indvar54, i64 6
  store i32 %add15, i32* %arrayidx22, align 4
  store i32 %add15.1, i32* %arrayidx22.1, align 4
  store i32 %add15.2, i32* %arrayidx22.2, align 4
  store i32 %add15.3, i32* %arrayidx22.3, align 4
  store i32 %add15.4, i32* %arrayidx22.4, align 4
  store i32 %add15.5, i32* %arrayidx22.5, align 4
  store i32 %add15.6, i32* %arrayidx22.6, align 4
  %indvar.next55 = add i64 %indvar54, 1
  %exitcond = icmp eq i64 %indvar.next55, 5
  br i1 %exitcond, label %for.cond7.preheader.1, label %for.cond7.preheader

for.cond.i:                                       ; preds = %for.cond7.preheader.2, %for.inc.i
  %indvar.i = phi i64 [ %indvar.next.i, %for.inc.i ], [ 0, %for.cond7.preheader.2 ]
  %storemerge.i = trunc i64 %indvar.i to i32
  %cmp.i = icmp slt i32 %storemerge.i, 105
  br i1 %cmp.i, label %for.body.i, label %for.cond.i20

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 0, i64 0, i64 %indvar.i
  %tmp4.i = load i32* %arrayidx.i, align 4
  %cmp7.i = icmp eq i32 %tmp4.i, %storemerge.i
  br i1 %cmp7.i, label %for.inc.i, label %if.then

for.inc.i:                                        ; preds = %for.body.i
  %indvar.next.i = add i64 %indvar.i, 1
  br label %for.cond.i

if.then:                                          ; preds = %for.body.i
  %puts = call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @str, i64 0, i64 0))
  br label %for.cond.i20

for.cond.i20:                                     ; preds = %if.then, %for.cond.i, %for.inc.i28
  %indvar.i17 = phi i64 [ %indvar.next.i27, %for.inc.i28 ], [ 0, %for.cond.i ], [ 0, %if.then ]
  %storemerge.i18 = trunc i64 %indvar.i17 to i32
  %cmp.i19 = icmp slt i32 %storemerge.i18, 35
  br i1 %cmp.i19, label %for.body.i26, label %for.cond.i6

for.body.i26:                                     ; preds = %for.cond.i20
  %tmp48 = add i64 %indvar.i17, 35
  %arrayidx.i22 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 0, i64 %indvar.i17
  %add.i23 = trunc i64 %tmp48 to i32
  %tmp4.i24 = load i32* %arrayidx.i22, align 4
  %cmp7.i25 = icmp eq i32 %tmp4.i24, %add.i23
  br i1 %cmp7.i25, label %for.inc.i28, label %if.then45

for.inc.i28:                                      ; preds = %for.body.i26
  %indvar.next.i27 = add i64 %indvar.i17, 1
  br label %for.cond.i20

if.then45:                                        ; preds = %for.body.i26
  %puts31 = call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @str1, i64 0, i64 0))
  br label %for.cond.i6

for.cond.i6:                                      ; preds = %if.then45, %for.cond.i20, %for.inc.i14
  %indvar.i3 = phi i64 [ %indvar.next.i13, %for.inc.i14 ], [ 0, %for.cond.i20 ], [ 0, %if.then45 ]
  %storemerge.i4 = trunc i64 %indvar.i3 to i32
  %cmp.i5 = icmp slt i32 %storemerge.i4, 7
  br i1 %cmp.i5, label %for.body.i12, label %if.end59

for.body.i12:                                     ; preds = %for.cond.i6
  %tmp = add i64 %indvar.i3, 49
  %arrayidx.i8 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 2, i64 %indvar.i3
  %add.i9 = trunc i64 %tmp to i32
  %tmp4.i10 = load i32* %arrayidx.i8, align 4
  %cmp7.i11 = icmp eq i32 %tmp4.i10, %add.i9
  br i1 %cmp7.i11, label %for.inc.i14, label %if.then57

for.inc.i14:                                      ; preds = %for.body.i12
  %indvar.next.i13 = add i64 %indvar.i3, 1
  br label %for.cond.i6

if.then57:                                        ; preds = %for.body.i12
  %puts32 = call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @str2, i64 0, i64 0))
  br label %if.end59

if.end59:                                         ; preds = %for.cond.i6, %if.then57
  %arrayidx68 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 2, i64 3
  %tmp69 = load i32* %arrayidx68, align 4
  %tobool70 = icmp eq i32 %tmp69, 52
  br i1 %tobool70, label %if.end73, label %if.then71

if.then71:                                        ; preds = %if.end59
  %puts33 = call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @str3, i64 0, i64 0))
  br label %if.end73

if.end73:                                         ; preds = %if.end59, %if.then71
  ret i32 0

for.cond7.preheader.1:                            ; preds = %for.cond7.preheader, %for.cond7.preheader.1
  %indvar54.1 = phi i64 [ %indvar.next55.1, %for.cond7.preheader.1 ], [ 0, %for.cond7.preheader ]
  %arrayidx22.1113 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 %indvar54.1, i64 0
  %tmp89.1 = mul i64 %indvar54.1, 7
  %tmp92.1 = add i64 %tmp89.1, 36
  %add15.1.1 = trunc i64 %tmp92.1 to i32
  %tmp95.1 = add i64 %tmp89.1, 37
  %add15.2.1 = trunc i64 %tmp95.1 to i32
  %tmp98.1 = add i64 %tmp89.1, 38
  %add15.3.1 = trunc i64 %tmp98.1 to i32
  %tmp101.1 = add i64 %tmp89.1, 39
  %add15.4.1 = trunc i64 %tmp101.1 to i32
  %tmp104.1 = add i64 %tmp89.1, 40
  %add15.5.1 = trunc i64 %tmp104.1 to i32
  %tmp107.1 = add i64 %tmp89.1, 41
  %add15.6.1 = trunc i64 %tmp107.1 to i32
  %tmp109.1 = add i64 %tmp89.1, 35
  %add15.1114 = trunc i64 %tmp109.1 to i32
  %arrayidx22.1.1 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 %indvar54.1, i64 1
  %arrayidx22.2.1 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 %indvar54.1, i64 2
  %arrayidx22.3.1 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 %indvar54.1, i64 3
  %arrayidx22.4.1 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 %indvar54.1, i64 4
  %arrayidx22.5.1 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 %indvar54.1, i64 5
  %arrayidx22.6.1 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 1, i64 %indvar54.1, i64 6
  store i32 %add15.1114, i32* %arrayidx22.1113, align 4
  store i32 %add15.1.1, i32* %arrayidx22.1.1, align 4
  store i32 %add15.2.1, i32* %arrayidx22.2.1, align 4
  store i32 %add15.3.1, i32* %arrayidx22.3.1, align 4
  store i32 %add15.4.1, i32* %arrayidx22.4.1, align 4
  store i32 %add15.5.1, i32* %arrayidx22.5.1, align 4
  store i32 %add15.6.1, i32* %arrayidx22.6.1, align 4
  %indvar.next55.1 = add i64 %indvar54.1, 1
  %exitcond.1 = icmp eq i64 %indvar.next55.1, 5
  br i1 %exitcond.1, label %for.cond7.preheader.2, label %for.cond7.preheader.1

for.cond7.preheader.2:                            ; preds = %for.cond7.preheader.1, %for.cond7.preheader.2
  %indvar54.2 = phi i64 [ %indvar.next55.2, %for.cond7.preheader.2 ], [ 0, %for.cond7.preheader.1 ]
  %arrayidx22.2115 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 2, i64 %indvar54.2, i64 0
  %tmp89.2 = mul i64 %indvar54.2, 7
  %tmp92.2 = add i64 %tmp89.2, 71
  %add15.1.2 = trunc i64 %tmp92.2 to i32
  %tmp95.2 = add i64 %tmp89.2, 72
  %add15.2.2 = trunc i64 %tmp95.2 to i32
  %tmp98.2 = add i64 %tmp89.2, 73
  %add15.3.2 = trunc i64 %tmp98.2 to i32
  %tmp101.2 = add i64 %tmp89.2, 74
  %add15.4.2 = trunc i64 %tmp101.2 to i32
  %tmp104.2 = add i64 %tmp89.2, 75
  %add15.5.2 = trunc i64 %tmp104.2 to i32
  %tmp107.2 = add i64 %tmp89.2, 76
  %add15.6.2 = trunc i64 %tmp107.2 to i32
  %tmp109.2 = add i64 %tmp89.2, 70
  %add15.2116 = trunc i64 %tmp109.2 to i32
  %arrayidx22.1.2 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 2, i64 %indvar54.2, i64 1
  %arrayidx22.2.2 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 2, i64 %indvar54.2, i64 2
  %arrayidx22.3.2 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 2, i64 %indvar54.2, i64 3
  %arrayidx22.4.2 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 2, i64 %indvar54.2, i64 4
  %arrayidx22.5.2 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 2, i64 %indvar54.2, i64 5
  %arrayidx22.6.2 = getelementptr [3 x [5 x [7 x i32]]]* %x3d, i64 0, i64 2, i64 %indvar54.2, i64 6
  store i32 %add15.2116, i32* %arrayidx22.2115, align 4
  store i32 %add15.1.2, i32* %arrayidx22.1.2, align 4
  store i32 %add15.2.2, i32* %arrayidx22.2.2, align 4
  store i32 %add15.3.2, i32* %arrayidx22.3.2, align 4
  store i32 %add15.4.2, i32* %arrayidx22.4.2, align 4
  store i32 %add15.5.2, i32* %arrayidx22.5.2, align 4
  store i32 %add15.6.2, i32* %arrayidx22.6.2, align 4
  %indvar.next55.2 = add i64 %indvar54.2, 1
  %exitcond.2 = icmp eq i64 %indvar.next55.2, 5
  br i1 %exitcond.2, label %for.cond.i, label %for.cond7.preheader.2
}

declare i32 @puts(i8* nocapture) nounwind
