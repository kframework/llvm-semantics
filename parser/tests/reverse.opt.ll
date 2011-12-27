; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/reverse.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.list_el = type { i32, %struct.list_el* }

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

define %struct.list_el* @listAppend(%struct.list_el* %p, i32 %n) nounwind uwtable {
entry:
  %cmp = icmp eq %struct.list_el* %p, null
  br i1 %cmp, label %if.then, label %while.cond

if.then:                                          ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.list_el*
  %val = bitcast i8* %call to i32*
  store i32 %n, i32* %val, align 4
  %next = getelementptr inbounds i8* %call, i64 8
  %1 = bitcast i8* %next to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %1, align 8
  br label %if.end

while.cond:                                       ; preds = %entry, %while.cond
  %storemerge = phi %struct.list_el* [ %tmp7, %while.cond ], [ %p, %entry ]
  %next6 = getelementptr inbounds %struct.list_el* %storemerge, i64 0, i32 1
  %tmp7 = load %struct.list_el** %next6, align 8
  %cmp8 = icmp eq %struct.list_el* %tmp7, null
  br i1 %cmp8, label %while.end, label %while.cond

while.end:                                        ; preds = %while.cond
  %call14 = tail call noalias i8* @malloc(i64 16) nounwind
  %2 = bitcast i8* %call14 to %struct.list_el*
  store %struct.list_el* %2, %struct.list_el** %next6, align 8
  %val20 = bitcast i8* %call14 to i32*
  store i32 %n, i32* %val20, align 4
  %next22 = getelementptr inbounds i8* %call14, i64 8
  %3 = bitcast i8* %next22 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %3, align 8
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  %tmp231 = phi %struct.list_el* [ %p, %while.end ], [ %0, %if.then ]
  ret %struct.list_el* %tmp231
}

declare noalias i8* @malloc(i64) nounwind

define %struct.list_el* @listReverse(%struct.list_el* %p) nounwind uwtable {
entry:
  %cmp = icmp eq %struct.list_el* %p, null
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %next = getelementptr inbounds %struct.list_el* %p, i64 0, i32 1
  %tmp3 = load %struct.list_el** %next, align 8
  store %struct.list_el* null, %struct.list_el** %next, align 8
  %cmp74 = icmp eq %struct.list_el* %tmp3, null
  br i1 %cmp74, label %if.end, label %while.body

while.body:                                       ; preds = %if.then, %while.body
  %tmp1816 = phi %struct.list_el* [ %tmp1735, %while.body ], [ %p, %if.then ]
  %tmp1735 = phi %struct.list_el* [ %tmp12, %while.body ], [ %tmp3, %if.then ]
  %next11 = getelementptr inbounds %struct.list_el* %tmp1735, i64 0, i32 1
  %tmp12 = load %struct.list_el** %next11, align 8
  store %struct.list_el* %tmp1816, %struct.list_el** %next11, align 8
  %cmp7 = icmp eq %struct.list_el* %tmp12, null
  br i1 %cmp7, label %if.end, label %while.body

if.end:                                           ; preds = %if.then, %while.body, %entry
  %tmp182 = phi %struct.list_el* [ null, %entry ], [ %p, %if.then ], [ %tmp1735, %while.body ]
  ret %struct.list_el* %tmp182
}

define i32 @main() nounwind uwtable {
listAppend.exit:
  %call.i = tail call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call.i to %struct.list_el*
  %val.i = bitcast i8* %call.i to i32*
  store i32 20, i32* %val.i, align 4
  %next.i = getelementptr inbounds i8* %call.i, i64 8
  %1 = bitcast i8* %next.i to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %1, align 8
  %cmp.i = icmp eq i8* %call.i, null
  br i1 %cmp.i, label %listAppend.exit6.thread, label %while.cond.i

listAppend.exit6.thread:                          ; preds = %listAppend.exit
  %call.i2 = tail call noalias i8* @malloc(i64 16) nounwind
  %val.i3 = bitcast i8* %call.i2 to i32*
  store i32 25, i32* %val.i3, align 4
  %next.i4 = getelementptr inbounds i8* %call.i2, i64 8
  %2 = bitcast i8* %next.i4 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %2, align 8
  br label %if.then.i11

while.cond.i:                                     ; preds = %listAppend.exit, %while.cond.i
  %storemerge.i = phi %struct.list_el* [ %tmp7.i, %while.cond.i ], [ %0, %listAppend.exit ]
  %next6.i = getelementptr inbounds %struct.list_el* %storemerge.i, i64 0, i32 1
  %tmp7.i = load %struct.list_el** %next6.i, align 8
  %cmp8.i = icmp eq %struct.list_el* %tmp7.i, null
  br i1 %cmp8.i, label %listAppend.exit6, label %while.cond.i

listAppend.exit6:                                 ; preds = %while.cond.i
  %call14.i = tail call noalias i8* @malloc(i64 16) nounwind
  %3 = bitcast i8* %call14.i to %struct.list_el*
  store %struct.list_el* %3, %struct.list_el** %next6.i, align 8
  %val20.i = bitcast i8* %call14.i to i32*
  store i32 25, i32* %val20.i, align 4
  %next22.i = getelementptr inbounds i8* %call14.i, i64 8
  %4 = bitcast i8* %next22.i to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %4, align 8
  br i1 %cmp.i, label %if.then.i11, label %while.cond.i16

if.then.i11:                                      ; preds = %listAppend.exit6.thread, %listAppend.exit6
  %call.i8 = tail call noalias i8* @malloc(i64 16) nounwind
  %val.i9 = bitcast i8* %call.i8 to i32*
  store i32 15, i32* %val.i9, align 4
  %next.i10 = getelementptr inbounds i8* %call.i8, i64 8
  %5 = bitcast i8* %next.i10 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %5, align 8
  br label %listAppend.exit22

while.cond.i16:                                   ; preds = %listAppend.exit6, %while.cond.i16
  %storemerge.i12 = phi %struct.list_el* [ %tmp7.i14, %while.cond.i16 ], [ %0, %listAppend.exit6 ]
  %next6.i13 = getelementptr inbounds %struct.list_el* %storemerge.i12, i64 0, i32 1
  %tmp7.i14 = load %struct.list_el** %next6.i13, align 8
  %cmp8.i15 = icmp eq %struct.list_el* %tmp7.i14, null
  br i1 %cmp8.i15, label %while.end.i20, label %while.cond.i16

while.end.i20:                                    ; preds = %while.cond.i16
  %call14.i17 = tail call noalias i8* @malloc(i64 16) nounwind
  %6 = bitcast i8* %call14.i17 to %struct.list_el*
  store %struct.list_el* %6, %struct.list_el** %next6.i13, align 8
  %val20.i18 = bitcast i8* %call14.i17 to i32*
  store i32 15, i32* %val20.i18, align 4
  %next22.i19 = getelementptr inbounds i8* %call14.i17, i64 8
  %7 = bitcast i8* %next22.i19 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %7, align 8
  br label %listAppend.exit22

listAppend.exit22:                                ; preds = %if.then.i11, %while.end.i20
  br i1 %cmp.i, label %listAppend.exit38.thread, label %while.cond.i32

listAppend.exit38.thread:                         ; preds = %listAppend.exit22
  %call.i24 = tail call noalias i8* @malloc(i64 16) nounwind
  %val.i25 = bitcast i8* %call.i24 to i32*
  store i32 30, i32* %val.i25, align 4
  %next.i26 = getelementptr inbounds i8* %call.i24, i64 8
  %8 = bitcast i8* %next.i26 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %8, align 8
  br label %if.then.i43

while.cond.i32:                                   ; preds = %listAppend.exit22, %while.cond.i32
  %storemerge.i28 = phi %struct.list_el* [ %tmp7.i30, %while.cond.i32 ], [ %0, %listAppend.exit22 ]
  %next6.i29 = getelementptr inbounds %struct.list_el* %storemerge.i28, i64 0, i32 1
  %tmp7.i30 = load %struct.list_el** %next6.i29, align 8
  %cmp8.i31 = icmp eq %struct.list_el* %tmp7.i30, null
  br i1 %cmp8.i31, label %listAppend.exit38, label %while.cond.i32

listAppend.exit38:                                ; preds = %while.cond.i32
  %call14.i33 = tail call noalias i8* @malloc(i64 16) nounwind
  %9 = bitcast i8* %call14.i33 to %struct.list_el*
  store %struct.list_el* %9, %struct.list_el** %next6.i29, align 8
  %val20.i34 = bitcast i8* %call14.i33 to i32*
  store i32 30, i32* %val20.i34, align 4
  %next22.i35 = getelementptr inbounds i8* %call14.i33, i64 8
  %10 = bitcast i8* %next22.i35 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %10, align 8
  br i1 %cmp.i, label %if.then.i43, label %while.cond.i48

if.then.i43:                                      ; preds = %listAppend.exit38.thread, %listAppend.exit38
  %call.i40 = tail call noalias i8* @malloc(i64 16) nounwind
  %val.i41 = bitcast i8* %call.i40 to i32*
  store i32 10, i32* %val.i41, align 4
  %next.i42 = getelementptr inbounds i8* %call.i40, i64 8
  %11 = bitcast i8* %next.i42 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %11, align 8
  br label %listAppend.exit54

while.cond.i48:                                   ; preds = %listAppend.exit38, %while.cond.i48
  %storemerge.i44 = phi %struct.list_el* [ %tmp7.i46, %while.cond.i48 ], [ %0, %listAppend.exit38 ]
  %next6.i45 = getelementptr inbounds %struct.list_el* %storemerge.i44, i64 0, i32 1
  %tmp7.i46 = load %struct.list_el** %next6.i45, align 8
  %cmp8.i47 = icmp eq %struct.list_el* %tmp7.i46, null
  br i1 %cmp8.i47, label %while.end.i52, label %while.cond.i48

while.end.i52:                                    ; preds = %while.cond.i48
  %call14.i49 = tail call noalias i8* @malloc(i64 16) nounwind
  %12 = bitcast i8* %call14.i49 to %struct.list_el*
  store %struct.list_el* %12, %struct.list_el** %next6.i45, align 8
  %val20.i50 = bitcast i8* %call14.i49 to i32*
  store i32 10, i32* %val20.i50, align 4
  %next22.i51 = getelementptr inbounds i8* %call14.i49, i64 8
  %13 = bitcast i8* %next22.i51 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %13, align 8
  br label %listAppend.exit54

listAppend.exit54:                                ; preds = %if.then.i43, %while.end.i52
  br i1 %cmp.i, label %while.cond.preheader.thread, label %while.cond.i64

while.cond.preheader.thread:                      ; preds = %listAppend.exit54
  %call.i56 = tail call noalias i8* @malloc(i64 16) nounwind
  %val.i57 = bitcast i8* %call.i56 to i32*
  store i32 35, i32* %val.i57, align 4
  %next.i58 = getelementptr inbounds i8* %call.i56, i64 8
  %14 = bitcast i8* %next.i58 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %14, align 8
  br label %while.end

while.cond.i64:                                   ; preds = %listAppend.exit54, %while.cond.i64
  %storemerge.i60 = phi %struct.list_el* [ %tmp7.i62, %while.cond.i64 ], [ %0, %listAppend.exit54 ]
  %next6.i61 = getelementptr inbounds %struct.list_el* %storemerge.i60, i64 0, i32 1
  %tmp7.i62 = load %struct.list_el** %next6.i61, align 8
  %cmp8.i63 = icmp eq %struct.list_el* %tmp7.i62, null
  br i1 %cmp8.i63, label %while.cond.preheader, label %while.cond.i64

while.cond.preheader:                             ; preds = %while.cond.i64
  %call14.i65 = tail call noalias i8* @malloc(i64 16) nounwind
  %15 = bitcast i8* %call14.i65 to %struct.list_el*
  store %struct.list_el* %15, %struct.list_el** %next6.i61, align 8
  %val20.i66 = bitcast i8* %call14.i65 to i32*
  store i32 35, i32* %val20.i66, align 4
  %next22.i67 = getelementptr inbounds i8* %call14.i65, i64 8
  %16 = bitcast i8* %next22.i67 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %16, align 8
  %cmp77 = icmp eq i8* %call.i, null
  br i1 %cmp77, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond.preheader, %while.body
  %storemerge78 = phi %struct.list_el* [ %tmp17, %while.body ], [ %0, %while.cond.preheader ]
  %val = getelementptr inbounds %struct.list_el* %storemerge78, i64 0, i32 0
  %tmp14 = load i32* %val, align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp14) nounwind
  %next = getelementptr inbounds %struct.list_el* %storemerge78, i64 0, i32 1
  %tmp17 = load %struct.list_el** %next, align 8
  %cmp = icmp eq %struct.list_el* %tmp17, null
  br i1 %cmp, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %while.cond.preheader.thread, %while.cond.preheader
  %putchar = tail call i32 @putchar(i32 10) nounwind
  br i1 %cmp.i, label %while.end37, label %if.then.i73

if.then.i73:                                      ; preds = %while.end
  %tmp3.i = load %struct.list_el** %1, align 8
  store %struct.list_el* null, %struct.list_el** %1, align 8
  %cmp74.i = icmp eq %struct.list_el* %tmp3.i, null
  br i1 %cmp74.i, label %while.cond26.preheader, label %while.body.i

while.body.i:                                     ; preds = %if.then.i73, %while.body.i
  %tmp1816.i = phi %struct.list_el* [ %tmp1735.i, %while.body.i ], [ %0, %if.then.i73 ]
  %tmp1735.i = phi %struct.list_el* [ %tmp12.i, %while.body.i ], [ %tmp3.i, %if.then.i73 ]
  %next11.i = getelementptr inbounds %struct.list_el* %tmp1735.i, i64 0, i32 1
  %tmp12.i = load %struct.list_el** %next11.i, align 8
  store %struct.list_el* %tmp1816.i, %struct.list_el** %next11.i, align 8
  %cmp7.i = icmp eq %struct.list_el* %tmp12.i, null
  br i1 %cmp7.i, label %while.body29, label %while.body.i

while.cond26.preheader:                           ; preds = %if.then.i73
  %cmp2875 = icmp eq i8* %call.i, null
  br i1 %cmp2875, label %while.end37, label %while.body29

while.body29:                                     ; preds = %while.body.i, %while.cond26.preheader, %while.body29
  %storemerge176 = phi %struct.list_el* [ %tmp36, %while.body29 ], [ %0, %while.cond26.preheader ], [ %tmp1735.i, %while.body.i ]
  %val31 = getelementptr inbounds %struct.list_el* %storemerge176, i64 0, i32 0
  %tmp32 = load i32* %val31, align 4
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp32) nounwind
  %next35 = getelementptr inbounds %struct.list_el* %storemerge176, i64 0, i32 1
  %tmp36 = load %struct.list_el** %next35, align 8
  %cmp28 = icmp eq %struct.list_el* %tmp36, null
  br i1 %cmp28, label %while.end37, label %while.body29

while.end37:                                      ; preds = %while.end, %while.body29, %while.cond26.preheader
  %putchar74 = tail call i32 @putchar(i32 10) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @putchar(i32)
