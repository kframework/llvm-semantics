; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000412-6.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buf = global [5 x i16] [i16 1, i16 4, i16 16, i16 64, i16 256], align 2

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %entry
  %value.addr.06.i = phi i16 [ %sub.i, %for.body.i ], [ 512, %entry ]
  %tmp.05.i = phi i16* [ %incdec.ptr.i, %for.body.i ], [ getelementptr inbounds ([5 x i16]* @buf, i64 0, i64 0), %entry ]
  %0 = load i16* %tmp.05.i, align 2, !tbaa !0
  %sub.i = sub i16 %value.addr.06.i, %0
  %incdec.ptr.i = getelementptr inbounds i16* %tmp.05.i, i64 1
  %cmp.i = icmp ult i16* %incdec.ptr.i, getelementptr inbounds ([5 x i16]* @buf, i64 0, i64 3)
  br i1 %cmp.i, label %for.body.i, label %bug.exit

bug.exit:                                         ; preds = %for.body.i
  %cmp = icmp eq i16 %sub.i, 491
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %bug.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %bug.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define i32 @bug(i16 zeroext %value, i16* %buffer, i16* %bufend) nounwind uwtable readonly {
entry:
  %cmp4 = icmp ult i16* %buffer, %bufend
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %value.addr.06 = phi i16 [ %sub, %for.body ], [ %value, %entry ]
  %tmp.05 = phi i16* [ %incdec.ptr, %for.body ], [ %buffer, %entry ]
  %0 = load i16* %tmp.05, align 2, !tbaa !0
  %sub = sub i16 %value.addr.06, %0
  %incdec.ptr = getelementptr inbounds i16* %tmp.05, i64 1
  %cmp = icmp ult i16* %incdec.ptr, %bufend
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  %value.addr.0.lcssa = phi i16 [ %value, %entry ], [ %sub, %for.body ]
  %conv3 = zext i16 %value.addr.0.lcssa to i32
  ret i32 %conv3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
