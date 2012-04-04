; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr35800.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"short\00", align 1
@.str33 = private unnamed_addr constant [10 x i8] c"integer*8\00", align 1

define i32 @stab_xcoff_builtin_type(i32 %typenum) nounwind uwtable readonly {
entry:
  %0 = icmp ult i32 %typenum, -34
  br i1 %0, label %return, label %if.end

if.end:                                           ; preds = %entry
  %sub = sub nsw i32 0, %typenum
  switch i32 %sub, label %sw.epilog [
    i32 1, label %sw.bb
    i32 2, label %sw.bb3
    i32 3, label %sw.bb3
    i32 4, label %sw.bb34
    i32 5, label %sw.bb34
    i32 6, label %sw.bb34
    i32 7, label %sw.bb34
    i32 8, label %sw.bb34
    i32 9, label %sw.bb34
    i32 10, label %sw.bb34
    i32 11, label %sw.bb34
    i32 12, label %sw.bb34
    i32 13, label %sw.bb34
    i32 14, label %sw.bb34
    i32 15, label %sw.bb34
    i32 16, label %sw.bb34
    i32 17, label %sw.bb34
    i32 18, label %sw.bb34
    i32 19, label %sw.bb34
    i32 20, label %sw.bb34
    i32 21, label %sw.bb34
    i32 22, label %sw.bb34
    i32 23, label %sw.bb34
    i32 24, label %sw.bb34
    i32 25, label %sw.bb34
    i32 26, label %sw.bb34
    i32 27, label %sw.bb34
    i32 28, label %sw.bb34
    i32 29, label %sw.bb34
    i32 30, label %sw.bb34
    i32 31, label %sw.bb34
    i32 32, label %sw.bb34
    i32 33, label %sw.bb34
    i32 34, label %sw.bb34
  ]

sw.bb:                                            ; preds = %if.end
  br label %sw.epilog

sw.bb3:                                           ; preds = %if.end, %if.end
  br label %sw.epilog

sw.bb34:                                          ; preds = %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb34, %if.end, %sw.bb3, %sw.bb
  %name.0 = phi i8* [ undef, %if.end ], [ getelementptr inbounds ([10 x i8]* @.str33, i64 0, i64 0), %sw.bb34 ], [ getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0), %sw.bb3 ], [ getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), %sw.bb ]
  %1 = load i8* %name.0, align 1, !tbaa !0
  %conv = sext i8 %1 to i32
  br label %return

return:                                           ; preds = %entry, %sw.epilog
  %retval.0 = phi i32 [ %conv, %sw.epilog ], [ 0, %entry ]
  ret i32 %retval.0
}

define i32 @main() nounwind uwtable {
if.end8:
  br label %for.cond

for.cond:                                         ; preds = %stab_xcoff_builtin_type.exit, %if.end8
  %i.0 = phi i32 [ %dec, %stab_xcoff_builtin_type.exit ], [ -4, %if.end8 ]
  %cmp13 = icmp sgt i32 %i.0, -35
  br i1 %cmp13, label %for.body, label %if.end21

for.body:                                         ; preds = %for.cond
  %0 = icmp ult i32 %i.0, -34
  br i1 %0, label %if.then16, label %if.end.i

if.end.i:                                         ; preds = %for.body
  %sub.i = sub nsw i32 0, %i.0
  switch i32 %sub.i, label %stab_xcoff_builtin_type.exit [
    i32 1, label %sw.bb.i
    i32 2, label %sw.bb3.i
    i32 3, label %sw.bb3.i
    i32 4, label %sw.bb34.i
    i32 5, label %sw.bb34.i
    i32 6, label %sw.bb34.i
    i32 7, label %sw.bb34.i
    i32 8, label %sw.bb34.i
    i32 9, label %sw.bb34.i
    i32 10, label %sw.bb34.i
    i32 11, label %sw.bb34.i
    i32 12, label %sw.bb34.i
    i32 13, label %sw.bb34.i
    i32 14, label %sw.bb34.i
    i32 15, label %sw.bb34.i
    i32 16, label %sw.bb34.i
    i32 17, label %sw.bb34.i
    i32 18, label %sw.bb34.i
    i32 19, label %sw.bb34.i
    i32 20, label %sw.bb34.i
    i32 21, label %sw.bb34.i
    i32 22, label %sw.bb34.i
    i32 23, label %sw.bb34.i
    i32 24, label %sw.bb34.i
    i32 25, label %sw.bb34.i
    i32 26, label %sw.bb34.i
    i32 27, label %sw.bb34.i
    i32 28, label %sw.bb34.i
    i32 29, label %sw.bb34.i
    i32 30, label %sw.bb34.i
    i32 31, label %sw.bb34.i
    i32 32, label %sw.bb34.i
    i32 33, label %sw.bb34.i
    i32 34, label %sw.bb34.i
  ]

sw.bb.i:                                          ; preds = %if.end.i
  br label %stab_xcoff_builtin_type.exit

sw.bb3.i:                                         ; preds = %if.end.i, %if.end.i
  br label %stab_xcoff_builtin_type.exit

sw.bb34.i:                                        ; preds = %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i
  br label %stab_xcoff_builtin_type.exit

stab_xcoff_builtin_type.exit:                     ; preds = %if.end.i, %sw.bb.i, %sw.bb3.i, %sw.bb34.i
  %name.0.i = phi i8* [ undef, %if.end.i ], [ getelementptr inbounds ([10 x i8]* @.str33, i64 0, i64 0), %sw.bb34.i ], [ getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0), %sw.bb3.i ], [ getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), %sw.bb.i ]
  %1 = load i8* %name.0.i, align 1, !tbaa !0
  %cmp15 = icmp eq i8 %1, 105
  %dec = add nsw i32 %i.0, -1
  br i1 %cmp15, label %for.cond, label %if.then16

if.then16:                                        ; preds = %for.body, %stab_xcoff_builtin_type.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
