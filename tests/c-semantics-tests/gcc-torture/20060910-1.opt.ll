; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060910-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.input_ty = type { i8*, i8* }

@b = common global [6 x i8] zeroinitializer, align 1
@s = common global %struct.input_ty zeroinitializer, align 8

define i32 @input_getc_complicated(%struct.input_ty* nocapture %x) nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @check_header(%struct.input_ty* nocapture %deeper) nounwind uwtable {
entry:
  %buffer_position = getelementptr inbounds %struct.input_ty* %deeper, i64 0, i32 0
  %buffer_end = getelementptr inbounds %struct.input_ty* %deeper, i64 0, i32 1
  %0 = load i8** %buffer_end, align 8, !tbaa !0
  %1 = load i8** %buffer_position, align 8, !tbaa !0
  %cmp1 = icmp ult i8* %1, %0
  br i1 %cmp1, label %cond.true, label %for.inc

cond.true:                                        ; preds = %entry
  %incdec.ptr = getelementptr inbounds i8* %1, i64 1
  store i8* %incdec.ptr, i8** %buffer_position, align 8, !tbaa !0
  br label %for.inc

for.inc:                                          ; preds = %entry, %cond.true
  %2 = phi i8* [ %1, %entry ], [ %incdec.ptr, %cond.true ]
  %cmp1.1 = icmp ult i8* %2, %0
  br i1 %cmp1.1, label %cond.true.1, label %for.inc.1

cond.true.1:                                      ; preds = %for.inc
  %incdec.ptr.1 = getelementptr inbounds i8* %2, i64 1
  store i8* %incdec.ptr.1, i8** %buffer_position, align 8, !tbaa !0
  br label %for.inc.1

for.inc.1:                                        ; preds = %cond.true.1, %for.inc
  %3 = phi i8* [ %incdec.ptr.1, %cond.true.1 ], [ %2, %for.inc ]
  %cmp1.2 = icmp ult i8* %3, %0
  br i1 %cmp1.2, label %cond.true.2, label %for.inc.2

cond.true.2:                                      ; preds = %for.inc.1
  %incdec.ptr.2 = getelementptr inbounds i8* %3, i64 1
  store i8* %incdec.ptr.2, i8** %buffer_position, align 8, !tbaa !0
  br label %for.inc.2

for.inc.2:                                        ; preds = %cond.true.2, %for.inc.1
  %4 = phi i8* [ %incdec.ptr.2, %cond.true.2 ], [ %3, %for.inc.1 ]
  %cmp1.3 = icmp ult i8* %4, %0
  br i1 %cmp1.3, label %cond.true.3, label %for.inc.3

cond.true.3:                                      ; preds = %for.inc.2
  %incdec.ptr.3 = getelementptr inbounds i8* %4, i64 1
  store i8* %incdec.ptr.3, i8** %buffer_position, align 8, !tbaa !0
  br label %for.inc.3

for.inc.3:                                        ; preds = %cond.true.3, %for.inc.2
  %5 = phi i8* [ %incdec.ptr.3, %cond.true.3 ], [ %4, %for.inc.2 ]
  %cmp1.4 = icmp ult i8* %5, %0
  br i1 %cmp1.4, label %cond.true.4, label %for.inc.4

cond.true.4:                                      ; preds = %for.inc.3
  %incdec.ptr.4 = getelementptr inbounds i8* %5, i64 1
  store i8* %incdec.ptr.4, i8** %buffer_position, align 8, !tbaa !0
  br label %for.inc.4

for.inc.4:                                        ; preds = %cond.true.4, %for.inc.3
  %6 = phi i8* [ %incdec.ptr.4, %cond.true.4 ], [ %5, %for.inc.3 ]
  %cmp1.5 = icmp ult i8* %6, %0
  br i1 %cmp1.5, label %cond.true.5, label %for.inc.5

cond.true.5:                                      ; preds = %for.inc.4
  %incdec.ptr.5 = getelementptr inbounds i8* %6, i64 1
  store i8* %incdec.ptr.5, i8** %buffer_position, align 8, !tbaa !0
  br label %for.inc.5

for.inc.5:                                        ; preds = %cond.true.5, %for.inc.4
  ret i32 1
}

define i32 @main() nounwind uwtable {
if.end2:
  store i8* getelementptr inbounds ([6 x i8]* @b, i64 1, i64 0), i8** getelementptr inbounds (%struct.input_ty* @s, i64 0, i32 1), align 8, !tbaa !0
  store i8* getelementptr inbounds ([6 x i8]* @b, i64 1, i64 0), i8** getelementptr inbounds (%struct.input_ty* @s, i64 0, i32 0), align 8, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
