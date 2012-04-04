; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/structLinkedList.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.list_el = type { i32, %struct.list_el* }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

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
  %call = tail call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.list_el*
  %val = bitcast i8* %call to i32*
  store i32 1, i32* %val, align 4
  %next = getelementptr inbounds i8* %call, i64 8
  %1 = bitcast i8* %next to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %1, align 8
  %call.1 = tail call noalias i8* @malloc(i64 16) nounwind
  %2 = bitcast i8* %call.1 to %struct.list_el*
  %val.1 = bitcast i8* %call.1 to i32*
  store i32 2, i32* %val.1, align 4
  %next.1 = getelementptr inbounds i8* %call.1, i64 8
  %3 = bitcast i8* %next.1 to %struct.list_el**
  store %struct.list_el* %0, %struct.list_el** %3, align 8
  %call.2 = tail call noalias i8* @malloc(i64 16) nounwind
  %4 = bitcast i8* %call.2 to %struct.list_el*
  %val.2 = bitcast i8* %call.2 to i32*
  store i32 3, i32* %val.2, align 4
  %next.2 = getelementptr inbounds i8* %call.2, i64 8
  %5 = bitcast i8* %next.2 to %struct.list_el**
  store %struct.list_el* %2, %struct.list_el** %5, align 8
  %call.3 = tail call noalias i8* @malloc(i64 16) nounwind
  %6 = bitcast i8* %call.3 to %struct.list_el*
  %val.3 = bitcast i8* %call.3 to i32*
  store i32 4, i32* %val.3, align 4
  %next.3 = getelementptr inbounds i8* %call.3, i64 8
  %7 = bitcast i8* %next.3 to %struct.list_el**
  store %struct.list_el* %4, %struct.list_el** %7, align 8
  %call.4 = tail call noalias i8* @malloc(i64 16) nounwind
  %8 = bitcast i8* %call.4 to %struct.list_el*
  %val.4 = bitcast i8* %call.4 to i32*
  store i32 5, i32* %val.4, align 4
  %next.4 = getelementptr inbounds i8* %call.4, i64 8
  %9 = bitcast i8* %next.4 to %struct.list_el**
  store %struct.list_el* %6, %struct.list_el** %9, align 8
  %call.5 = tail call noalias i8* @malloc(i64 16) nounwind
  %10 = bitcast i8* %call.5 to %struct.list_el*
  %val.5 = bitcast i8* %call.5 to i32*
  store i32 6, i32* %val.5, align 4
  %next.5 = getelementptr inbounds i8* %call.5, i64 8
  %11 = bitcast i8* %next.5 to %struct.list_el**
  store %struct.list_el* %8, %struct.list_el** %11, align 8
  %call.6 = tail call noalias i8* @malloc(i64 16) nounwind
  %12 = bitcast i8* %call.6 to %struct.list_el*
  %val.6 = bitcast i8* %call.6 to i32*
  store i32 7, i32* %val.6, align 4
  %next.6 = getelementptr inbounds i8* %call.6, i64 8
  %13 = bitcast i8* %next.6 to %struct.list_el**
  store %struct.list_el* %10, %struct.list_el** %13, align 8
  %call.7 = tail call noalias i8* @malloc(i64 16) nounwind
  %14 = bitcast i8* %call.7 to %struct.list_el*
  %val.7 = bitcast i8* %call.7 to i32*
  store i32 8, i32* %val.7, align 4
  %next.7 = getelementptr inbounds i8* %call.7, i64 8
  %15 = bitcast i8* %next.7 to %struct.list_el**
  store %struct.list_el* %12, %struct.list_el** %15, align 8
  %call.8 = tail call noalias i8* @malloc(i64 16) nounwind
  %16 = bitcast i8* %call.8 to %struct.list_el*
  %val.8 = bitcast i8* %call.8 to i32*
  store i32 9, i32* %val.8, align 4
  %next.8 = getelementptr inbounds i8* %call.8, i64 8
  %17 = bitcast i8* %next.8 to %struct.list_el**
  store %struct.list_el* %14, %struct.list_el** %17, align 8
  %call.9 = tail call noalias i8* @malloc(i64 16) nounwind
  %val.9 = bitcast i8* %call.9 to i32*
  store i32 10, i32* %val.9, align 4
  %next.9 = getelementptr inbounds i8* %call.9, i64 8
  %18 = bitcast i8* %next.9 to %struct.list_el**
  store %struct.list_el* %16, %struct.list_el** %18, align 8
  %tobool3 = icmp eq i8* %call.9, null
  br i1 %tobool3, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %19 = bitcast i8* %call.9 to %struct.list_el*
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %storemerge14 = phi %struct.list_el* [ %19, %while.body.lr.ph ], [ %tmp15, %while.body ]
  %val10 = getelementptr inbounds %struct.list_el* %storemerge14, i64 0, i32 0
  %tmp11 = load i32* %val10, align 4
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp11) nounwind
  %next14 = getelementptr inbounds %struct.list_el* %storemerge14, i64 0, i32 1
  %tmp15 = load %struct.list_el** %next14, align 8
  %tobool = icmp eq %struct.list_el* %tmp15, null
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
