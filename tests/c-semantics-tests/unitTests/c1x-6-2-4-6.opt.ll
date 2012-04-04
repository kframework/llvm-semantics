; ModuleID = '/home/david/src/c-semantics/tests/unitTests/c1x-6-2-4-6.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"1i = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"2i = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"3i = %d\0A\00", align 1

define i32 @f1() nounwind uwtable {
if.then:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), i32 16) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @f2() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  br label %label

label:                                            ; preds = %if.then1, %entry
  %p.0 = phi i32* [ null, %entry ], [ %i.p.0, %if.then1 ]
  %count.0 = phi i32 [ 0, %entry ], [ %inc, %if.then1 ]
  %tobool = icmp eq i32* %p.0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %label
  %0 = load i32* %p.0, align 4, !tbaa !0
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 %0) nounwind
  br label %if.end

if.end:                                           ; preds = %label, %if.then
  %cmp = icmp slt i32 %count.0, 3
  br i1 %cmp, label %if.then1, label %end

if.then1:                                         ; preds = %if.end
  store i32 %count.0, i32* %i, align 4, !tbaa !0
  %inc = add nsw i32 %count.0, 1
  %i.p.0 = select i1 %tobool, i32* %i, i32* %p.0
  br label %label

end:                                              ; preds = %if.end
  ret i32 0
}

define i32 @f3() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  br label %label

label:                                            ; preds = %if.then1, %entry
  %p.0 = phi i32* [ null, %entry ], [ %i.p.0, %if.then1 ]
  %count.0 = phi i32 [ 0, %entry ], [ %inc, %if.then1 ]
  %tobool = icmp eq i32* %p.0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %label
  %0 = load i32* %p.0, align 4, !tbaa !0
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i64 0, i64 0), i32 %0) nounwind
  br label %if.end

if.end:                                           ; preds = %label, %if.then
  store i32 5, i32* %i, align 4, !tbaa !0
  %cmp = icmp slt i32 %count.0, 3
  br i1 %cmp, label %if.then1, label %if.end5

if.then1:                                         ; preds = %if.end
  %inc = add nsw i32 %count.0, 1
  %i.p.0 = select i1 %tobool, i32* %i, i32* %p.0
  br label %label

if.end5:                                          ; preds = %if.end
  ret i32 0
}

define i32 @f4() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %i.i5 = alloca i32, align 4
  %i.i = alloca i32, align 4
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), i32 16) nounwind
  %0 = bitcast i32* %i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  br label %label.i

label.i:                                          ; preds = %if.then1.i, %entry
  %p.0.i = phi i32* [ null, %entry ], [ %i.p.0.i, %if.then1.i ]
  %count.0.i = phi i32 [ 0, %entry ], [ %inc.i, %if.then1.i ]
  %tobool.i = icmp eq i32* %p.0.i, null
  br i1 %tobool.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %label.i
  %1 = load i32* %p.0.i, align 4, !tbaa !0
  %call.i4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 %1) nounwind
  br label %if.end.i

if.end.i:                                         ; preds = %if.then.i, %label.i
  %cmp.i = icmp slt i32 %count.0.i, 3
  br i1 %cmp.i, label %if.then1.i, label %f2.exit

if.then1.i:                                       ; preds = %if.end.i
  store i32 %count.0.i, i32* %i.i, align 4, !tbaa !0
  %inc.i = add nsw i32 %count.0.i, 1
  %i.p.0.i = select i1 %tobool.i, i32* %i.i, i32* %p.0.i
  br label %label.i

f2.exit:                                          ; preds = %if.end.i
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %2 = bitcast i32* %i.i5 to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %2) nounwind
  br label %label.i9

label.i9:                                         ; preds = %if.then1.i16, %f2.exit
  %p.0.i6 = phi i32* [ null, %f2.exit ], [ %i.p.0.i15, %if.then1.i16 ]
  %count.0.i7 = phi i32 [ 0, %f2.exit ], [ %inc.i14, %if.then1.i16 ]
  %tobool.i8 = icmp eq i32* %p.0.i6, null
  br i1 %tobool.i8, label %if.end.i13, label %if.then.i11

if.then.i11:                                      ; preds = %label.i9
  %3 = load i32* %p.0.i6, align 4, !tbaa !0
  %call.i10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i64 0, i64 0), i32 %3) nounwind
  br label %if.end.i13

if.end.i13:                                       ; preds = %if.then.i11, %label.i9
  store i32 5, i32* %i.i5, align 4, !tbaa !0
  %cmp.i12 = icmp slt i32 %count.0.i7, 3
  br i1 %cmp.i12, label %if.then1.i16, label %f3.exit

if.then1.i16:                                     ; preds = %if.end.i13
  %inc.i14 = add nsw i32 %count.0.i7, 1
  %i.p.0.i15 = select i1 %tobool.i8, i32* %i.i5, i32* %p.0.i6
  br label %label.i9

f3.exit:                                          ; preds = %if.end.i13
  call void @llvm.lifetime.end(i64 -1, i8* %2) nounwind
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
