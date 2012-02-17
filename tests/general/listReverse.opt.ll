; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/listReverse.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1

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

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 12) nounwind
  %0 = bitcast i8* %call to i32*
  store i32 20, i32* %0, align 4
  %add.ptr = getelementptr inbounds i8* %call, i64 4
  %1 = bitcast i8* %add.ptr to i32**
  store i32* null, i32** %1, align 8
  %cmp.i = icmp eq i8* %call, null
  br i1 %cmp.i, label %while.end.thread, label %while.cond.i

while.cond.i:                                     ; preds = %entry, %while.cond.i
  %storemerge.i = phi i32* [ %tmp3.i, %while.cond.i ], [ %0, %entry ]
  %add.ptr.i = getelementptr inbounds i32* %storemerge.i, i64 1
  %2 = bitcast i32* %add.ptr.i to i32**
  %tmp3.i = load i32** %2, align 8
  %cmp4.i = icmp eq i32* %tmp3.i, null
  br i1 %cmp4.i, label %listAppend.exit, label %while.cond.i

listAppend.exit:                                  ; preds = %while.cond.i
  %call.i = tail call noalias i8* @malloc(i64 12) nounwind
  %3 = bitcast i8* %call.i to i32*
  store i32* %3, i32** %2, align 8
  store i32 25, i32* %3, align 4
  %add.ptr15.i = getelementptr inbounds i8* %call.i, i64 4
  %4 = bitcast i8* %add.ptr15.i to i32**
  store i32* null, i32** %4, align 8
  br i1 %cmp.i, label %while.end.thread, label %while.cond.i7

while.cond.i7:                                    ; preds = %listAppend.exit, %while.cond.i7
  %storemerge.i3 = phi i32* [ %tmp3.i5, %while.cond.i7 ], [ %0, %listAppend.exit ]
  %add.ptr.i4 = getelementptr inbounds i32* %storemerge.i3, i64 1
  %5 = bitcast i32* %add.ptr.i4 to i32**
  %tmp3.i5 = load i32** %5, align 8
  %cmp4.i6 = icmp eq i32* %tmp3.i5, null
  br i1 %cmp4.i6, label %listAppend.exit11, label %while.cond.i7

listAppend.exit11:                                ; preds = %while.cond.i7
  %call.i8 = tail call noalias i8* @malloc(i64 12) nounwind
  %6 = bitcast i8* %call.i8 to i32*
  store i32* %6, i32** %5, align 8
  store i32 15, i32* %6, align 4
  %add.ptr15.i9 = getelementptr inbounds i8* %call.i8, i64 4
  %7 = bitcast i8* %add.ptr15.i9 to i32**
  store i32* null, i32** %7, align 8
  br i1 %cmp.i, label %while.end.thread, label %while.cond.i17

while.cond.i17:                                   ; preds = %listAppend.exit11, %while.cond.i17
  %storemerge.i13 = phi i32* [ %tmp3.i15, %while.cond.i17 ], [ %0, %listAppend.exit11 ]
  %add.ptr.i14 = getelementptr inbounds i32* %storemerge.i13, i64 1
  %8 = bitcast i32* %add.ptr.i14 to i32**
  %tmp3.i15 = load i32** %8, align 8
  %cmp4.i16 = icmp eq i32* %tmp3.i15, null
  br i1 %cmp4.i16, label %listAppend.exit21, label %while.cond.i17

listAppend.exit21:                                ; preds = %while.cond.i17
  %call.i18 = tail call noalias i8* @malloc(i64 12) nounwind
  %9 = bitcast i8* %call.i18 to i32*
  store i32* %9, i32** %8, align 8
  store i32 30, i32* %9, align 4
  %add.ptr15.i19 = getelementptr inbounds i8* %call.i18, i64 4
  %10 = bitcast i8* %add.ptr15.i19 to i32**
  store i32* null, i32** %10, align 8
  br i1 %cmp.i, label %while.end.thread, label %while.cond.i27

while.cond.i27:                                   ; preds = %listAppend.exit21, %while.cond.i27
  %storemerge.i23 = phi i32* [ %tmp3.i25, %while.cond.i27 ], [ %0, %listAppend.exit21 ]
  %add.ptr.i24 = getelementptr inbounds i32* %storemerge.i23, i64 1
  %11 = bitcast i32* %add.ptr.i24 to i32**
  %tmp3.i25 = load i32** %11, align 8
  %cmp4.i26 = icmp eq i32* %tmp3.i25, null
  br i1 %cmp4.i26, label %listAppend.exit31, label %while.cond.i27

listAppend.exit31:                                ; preds = %while.cond.i27
  %call.i28 = tail call noalias i8* @malloc(i64 12) nounwind
  %12 = bitcast i8* %call.i28 to i32*
  store i32* %12, i32** %11, align 8
  store i32 10, i32* %12, align 4
  %add.ptr15.i29 = getelementptr inbounds i8* %call.i28, i64 4
  %13 = bitcast i8* %add.ptr15.i29 to i32**
  store i32* null, i32** %13, align 8
  br i1 %cmp.i, label %while.end.thread, label %while.cond.i37

while.cond.i37:                                   ; preds = %listAppend.exit31, %while.cond.i37
  %storemerge.i33 = phi i32* [ %tmp3.i35, %while.cond.i37 ], [ %0, %listAppend.exit31 ]
  %add.ptr.i34 = getelementptr inbounds i32* %storemerge.i33, i64 1
  %14 = bitcast i32* %add.ptr.i34 to i32**
  %tmp3.i35 = load i32** %14, align 8
  %cmp4.i36 = icmp eq i32* %tmp3.i35, null
  br i1 %cmp4.i36, label %while.cond.preheader, label %while.cond.i37

while.cond.preheader:                             ; preds = %while.cond.i37
  %call.i38 = tail call noalias i8* @malloc(i64 12) nounwind
  %15 = bitcast i8* %call.i38 to i32*
  store i32* %15, i32** %14, align 8
  store i32 35, i32* %15, align 4
  %add.ptr15.i39 = getelementptr inbounds i8* %call.i38, i64 4
  %16 = bitcast i8* %add.ptr15.i39 to i32**
  store i32* null, i32** %16, align 8
  %cmp82 = icmp eq i8* %call, null
  br i1 %cmp82, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond.preheader, %while.body
  %storemerge83 = phi i32* [ %tmp20, %while.body ], [ %0, %while.cond.preheader ]
  %tmp16 = load i32* %storemerge83, align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp16) nounwind
  %add.ptr19 = getelementptr inbounds i32* %storemerge83, i64 1
  %17 = bitcast i32* %add.ptr19 to i32**
  %tmp20 = load i32** %17, align 8
  %cmp = icmp eq i32* %tmp20, null
  br i1 %cmp, label %while.end, label %while.body

while.end.thread:                                 ; preds = %listAppend.exit31, %listAppend.exit21, %listAppend.exit11, %entry, %listAppend.exit
  %putchar102 = tail call i32 @putchar(i32 10) nounwind
  br label %listSum.exit.thread

while.end:                                        ; preds = %while.body, %while.cond.preheader
  %putchar = tail call i32 @putchar(i32 10) nounwind
  br i1 %cmp.i, label %listSum.exit.thread, label %if.then.i

listSum.exit.thread:                              ; preds = %while.end.thread, %while.end
  call void @llvm.trap()
  unreachable

if.then.i:                                        ; preds = %while.end
  %tmp3.i43 = load i32* %0, align 4
  %tmp64.i = load i32** %1, align 8
  %cmp75.i = icmp eq i32* %tmp64.i, null
  br i1 %cmp75.i, label %if.then.i64.thread, label %while.body.i

if.then.i64.thread:                               ; preds = %if.then.i
  store i32* null, i32** %1, align 8
  br label %listReverse.exit.thread

while.body.i:                                     ; preds = %if.then.i, %while.body.i
  %tmp67.i = phi i32* [ %tmp6.i, %while.body.i ], [ %tmp64.i, %if.then.i ]
  %storemerge6.i = phi i32 [ %add14.i, %while.body.i ], [ %tmp3.i43, %if.then.i ]
  %tmp12.i = load i32* %tmp67.i, align 4
  %add14.i = add nsw i32 %tmp12.i, %storemerge6.i
  %add.ptr.i44 = getelementptr inbounds i32* %tmp67.i, i64 1
  %18 = bitcast i32* %add.ptr.i44 to i32**
  %tmp6.i = load i32** %18, align 8
  %cmp7.i = icmp eq i32* %tmp6.i, null
  br i1 %cmp7.i, label %listSum.exit, label %while.body.i

listSum.exit:                                     ; preds = %while.body.i
  br i1 %cmp.i, label %while.end41.thread, label %if.then.i64

if.then.i64:                                      ; preds = %listSum.exit
  store i32* null, i32** %1, align 8
  br i1 %cmp75.i, label %listReverse.exit, label %while.body.i67

while.body.i67:                                   ; preds = %if.then.i64, %while.body.i67
  %tmp1816.i = phi i32* [ %tmp1735.i, %while.body.i67 ], [ %0, %if.then.i64 ]
  %tmp1735.i = phi i32* [ %tmp12.i65, %while.body.i67 ], [ %tmp64.i, %if.then.i64 ]
  %add.ptr11.i = getelementptr inbounds i32* %tmp1735.i, i64 1
  %19 = bitcast i32* %add.ptr11.i to i32**
  %tmp12.i65 = load i32** %19, align 8
  store i32* %tmp1816.i, i32** %19, align 8
  %cmp7.i66 = icmp eq i32* %tmp12.i65, null
  br i1 %cmp7.i66, label %listReverse.exit.thread, label %while.body.i67

listReverse.exit.thread:                          ; preds = %if.then.i64.thread, %while.body.i67
  %tmp182.i.ph = phi i32* [ %0, %if.then.i64.thread ], [ %tmp1735.i, %while.body.i67 ]
  %storemerge1.i70.ph = phi i32 [ %tmp3.i43, %if.then.i64.thread ], [ %add14.i, %while.body.i67 ]
  %cmp338089 = icmp eq i32* %tmp182.i.ph, null
  br label %while.body34.lr.ph

listReverse.exit:                                 ; preds = %if.then.i64
  %cmp3380 = icmp eq i8* %call, null
  br i1 %cmp3380, label %while.end41.thread, label %while.body34.lr.ph

while.body34.lr.ph:                               ; preds = %listReverse.exit.thread, %listReverse.exit
  %cmp338094 = phi i1 [ %cmp338089, %listReverse.exit.thread ], [ false, %listReverse.exit ]
  %tmp182.i92 = phi i32* [ %tmp182.i.ph, %listReverse.exit.thread ], [ %0, %listReverse.exit ]
  %storemerge1.i7090 = phi i32 [ %storemerge1.i70.ph, %listReverse.exit.thread ], [ %add14.i, %listReverse.exit ]
  br label %while.body34

while.body34:                                     ; preds = %while.body34.lr.ph, %while.body34
  %storemerge181 = phi i32* [ %tmp182.i92, %while.body34.lr.ph ], [ %tmp40, %while.body34 ]
  %tmp36 = load i32* %storemerge181, align 4
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp36) nounwind
  %add.ptr39 = getelementptr inbounds i32* %storemerge181, i64 1
  %20 = bitcast i32* %add.ptr39 to i32**
  %tmp40 = load i32** %20, align 8
  %cmp33 = icmp eq i32* %tmp40, null
  br i1 %cmp33, label %while.end41, label %while.body34

while.end41.thread:                               ; preds = %listReverse.exit, %listSum.exit
  %putchar6898 = tail call i32 @putchar(i32 10) nounwind
  store i32 undef, i32* null, align 536870912
  br label %listSum.exit60

while.end41:                                      ; preds = %while.body34
  %putchar68 = tail call i32 @putchar(i32 10) nounwind
  %tmp45 = load i32* %tmp182.i92, align 4
  br i1 %cmp338094, label %listSum.exit60, label %if.then.i50

if.then.i50:                                      ; preds = %while.end41
  %add.ptr3.i47 = getelementptr inbounds i32* %tmp182.i92, i64 1
  %21 = bitcast i32* %add.ptr3.i47 to i32**
  %tmp64.i48 = load i32** %21, align 8
  %cmp75.i49 = icmp eq i32* %tmp64.i48, null
  br i1 %cmp75.i49, label %listSum.exit60, label %while.body.i58

while.body.i58:                                   ; preds = %if.then.i50, %while.body.i58
  %tmp67.i51 = phi i32* [ %tmp6.i56, %while.body.i58 ], [ %tmp64.i48, %if.then.i50 ]
  %storemerge6.i52 = phi i32 [ %add14.i54, %while.body.i58 ], [ %tmp45, %if.then.i50 ]
  %tmp12.i53 = load i32* %tmp67.i51, align 4
  %add14.i54 = add nsw i32 %tmp12.i53, %storemerge6.i52
  %add.ptr.i55 = getelementptr inbounds i32* %tmp67.i51, i64 1
  %22 = bitcast i32* %add.ptr.i55 to i32**
  %tmp6.i56 = load i32** %22, align 8
  %cmp7.i57 = icmp eq i32* %tmp6.i56, null
  br i1 %cmp7.i57, label %listSum.exit60, label %while.body.i58

listSum.exit60:                                   ; preds = %while.body.i58, %while.end41.thread, %while.end41, %if.then.i50
  %tmp45101 = phi i32 [ %tmp45, %while.end41 ], [ %tmp45, %if.then.i50 ], [ undef, %while.end41.thread ], [ %tmp45, %while.body.i58 ]
  %storemerge1.i7091100 = phi i32 [ %storemerge1.i7090, %while.end41 ], [ %storemerge1.i7090, %if.then.i50 ], [ %add14.i, %while.end41.thread ], [ %storemerge1.i7090, %while.body.i58 ]
  %storemerge1.i59 = phi i32 [ 0, %while.end41 ], [ %tmp45, %if.then.i50 ], [ 0, %while.end41.thread ], [ %add14.i54, %while.body.i58 ]
  %sub = sub i32 %storemerge1.i7091100, %tmp3.i43
  %sub53 = add i32 %sub, %tmp45101
  %add = sub i32 %sub53, %storemerge1.i59
  ret i32 %add
}

declare noalias i8* @malloc(i64) nounwind

define i32* @listAppend(i32* %p, i32 %n) nounwind uwtable {
entry:
  %cmp = icmp eq i32* %p, null
  br i1 %cmp, label %if.end, label %while.cond

while.cond:                                       ; preds = %entry, %while.cond
  %storemerge = phi i32* [ %tmp3, %while.cond ], [ %p, %entry ]
  %add.ptr = getelementptr inbounds i32* %storemerge, i64 1
  %0 = bitcast i32* %add.ptr to i32**
  %tmp3 = load i32** %0, align 8
  %cmp4 = icmp eq i32* %tmp3, null
  br i1 %cmp4, label %while.end, label %while.cond

while.end:                                        ; preds = %while.cond
  %call = tail call noalias i8* @malloc(i64 12) nounwind
  %1 = bitcast i8* %call to i32*
  store i32* %1, i32** %0, align 8
  store i32 %n, i32* %1, align 4
  %add.ptr15 = getelementptr inbounds i8* %call, i64 4
  %2 = bitcast i8* %add.ptr15 to i32**
  store i32* null, i32** %2, align 8
  br label %if.end

if.end:                                           ; preds = %entry, %while.end
  ret i32* %p
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @listSum(i32* %p) nounwind uwtable readonly {
entry:
  %cmp = icmp eq i32* %p, null
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %tmp3 = load i32* %p, align 4
  %add.ptr3 = getelementptr inbounds i32* %p, i64 1
  %0 = bitcast i32* %add.ptr3 to i32**
  %tmp64 = load i32** %0, align 8
  %cmp75 = icmp eq i32* %tmp64, null
  br i1 %cmp75, label %if.end, label %while.body

while.body:                                       ; preds = %if.then, %while.body
  %tmp67 = phi i32* [ %tmp6, %while.body ], [ %tmp64, %if.then ]
  %storemerge6 = phi i32 [ %add14, %while.body ], [ %tmp3, %if.then ]
  %tmp12 = load i32* %tmp67, align 4
  %add14 = add nsw i32 %tmp12, %storemerge6
  %add.ptr = getelementptr inbounds i32* %tmp67, i64 1
  %1 = bitcast i32* %add.ptr to i32**
  %tmp6 = load i32** %1, align 8
  %cmp7 = icmp eq i32* %tmp6, null
  br i1 %cmp7, label %if.end, label %while.body

if.end:                                           ; preds = %if.then, %while.body, %entry
  %storemerge1 = phi i32 [ 0, %entry ], [ %tmp3, %if.then ], [ %add14, %while.body ]
  ret i32 %storemerge1
}

define i32* @listReverse(i32* %p) nounwind uwtable {
entry:
  %cmp = icmp eq i32* %p, null
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %add.ptr = getelementptr inbounds i32* %p, i64 1
  %0 = bitcast i32* %add.ptr to i32**
  %tmp3 = load i32** %0, align 8
  store i32* null, i32** %0, align 8
  %cmp74 = icmp eq i32* %tmp3, null
  br i1 %cmp74, label %if.end, label %while.body

while.body:                                       ; preds = %if.then, %while.body
  %tmp1816 = phi i32* [ %tmp1735, %while.body ], [ %p, %if.then ]
  %tmp1735 = phi i32* [ %tmp12, %while.body ], [ %tmp3, %if.then ]
  %add.ptr11 = getelementptr inbounds i32* %tmp1735, i64 1
  %1 = bitcast i32* %add.ptr11 to i32**
  %tmp12 = load i32** %1, align 8
  store i32* %tmp1816, i32** %1, align 8
  %cmp7 = icmp eq i32* %tmp12, null
  br i1 %cmp7, label %if.end, label %while.body

if.end:                                           ; preds = %if.then, %while.body, %entry
  %tmp182 = phi i32* [ null, %entry ], [ %p, %if.then ], [ %tmp1735, %while.body ]
  ret i32* %tmp182
}

declare i32 @putchar(i32)

declare void @llvm.trap() nounwind
