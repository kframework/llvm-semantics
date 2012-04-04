; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-3c.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [255 x i8*] zeroinitializer, align 16

define void @f(i32 %m) nounwind uwtable {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %i.0 = phi i32 [ %m, %entry ], [ %add, %do.body ]
  %sh.0 = phi i32 [ 256, %entry ], [ %shr, %do.body ]
  %shl = shl i32 %i.0, 3
  %idx.ext = zext i32 %shl to i64
  %add.ptr = getelementptr inbounds i8* bitcast ([255 x i8*]* @a to i8*), i64 %idx.ext
  %shr = ashr i32 %sh.0, 1
  %idxprom = sext i32 %shr to i64
  %arrayidx = getelementptr inbounds [255 x i8*]* @a, i64 0, i64 %idxprom
  store i8* %add.ptr, i8** %arrayidx, align 8, !tbaa !0
  %add = add nsw i32 %i.0, 4
  %cmp = icmp slt i32 %add, 1073741840
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end6:
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16, !tbaa !0
  store i8* bitcast ([255 x i8*]* @a to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 128), align 16, !tbaa !0
  store i8* bitcast (i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 4) to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 64), align 16, !tbaa !0
  store i8* bitcast (i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8) to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 32), align 16, !tbaa !0
  store i8* bitcast (i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 12) to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
