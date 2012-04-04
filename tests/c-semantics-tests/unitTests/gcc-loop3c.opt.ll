; ModuleID = '/home/david/src/c-semantics/tests/unitTests/gcc-loop3c.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [255 x i8*] zeroinitializer, align 16
@.str = private unnamed_addr constant [26 x i8] c"a[0x10] || a[0x08] == %d\0A\00", align 1

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
lor.end:
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16, !tbaa !0
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16, !tbaa !0
  store i8* bitcast ([255 x i8*]* @a to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 128), align 16, !tbaa !0
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  %0 = load i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16, !tbaa !0
  %tobool2 = icmp ne i8* %0, null
  %1 = load i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16, !tbaa !0
  %tobool3 = icmp ne i8* %1, null
  %or.cond = or i1 %tobool2, %tobool3
  br i1 %or.cond, label %if.then, label %lor.end7

if.then:                                          ; preds = %lor.end
  tail call void @abort() noreturn nounwind
  unreachable

lor.end7:                                         ; preds = %lor.end
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16, !tbaa !0
  store i8* bitcast ([255 x i8*]* @a to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 128), align 16, !tbaa !0
  store i8* bitcast (i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 4) to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 64), align 16, !tbaa !0
  store i8* bitcast (i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8) to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 32), align 16, !tbaa !0
  store i8* bitcast (i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 12) to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16, !tbaa !0
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i64 0, i64 0), i32 1) nounwind
  %2 = load i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16, !tbaa !0
  %tobool10 = icmp eq i8* %2, null
  %3 = load i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16, !tbaa !0
  %tobool12 = icmp ne i8* %3, null
  %or.cond15 = or i1 %tobool10, %tobool12
  br i1 %or.cond15, label %if.then13, label %if.end14

if.then13:                                        ; preds = %lor.end7
  tail call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %lor.end7
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
