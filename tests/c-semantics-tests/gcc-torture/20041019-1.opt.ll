; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041019-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @test_store_ccp(i32 %i) nounwind uwtable readnone {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %cmp = icmp slt i32 %i, 5
  br i1 %cmp, label %if.end4, label %if.else

if.else:                                          ; preds = %entry
  %cmp1 = icmp sgt i32 %i, 8
  %b.c = select i1 %cmp1, i32* %b, i32* %c
  br label %if.end4

if.end4:                                          ; preds = %if.else, %entry
  %p.0 = phi i32* [ %a, %entry ], [ %b.c, %if.else ]
  store i32 10, i32* %p.0, align 4, !tbaa !0
  store i32 3, i32* %b, align 4, !tbaa !0
  %0 = load i32* %p.0, align 4, !tbaa !0
  %add = add nsw i32 %0, 2
  ret i32 %add
}

define i32 @test_store_copy_prop(i32 %i) nounwind uwtable readnone {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %cmp = icmp slt i32 %i, 5
  br i1 %cmp, label %if.end4, label %if.else

if.else:                                          ; preds = %entry
  %cmp1 = icmp sgt i32 %i, 8
  %b.c = select i1 %cmp1, i32* %b, i32* %c
  br label %if.end4

if.end4:                                          ; preds = %if.else, %entry
  %p.0 = phi i32* [ %a, %entry ], [ %b.c, %if.else ]
  store i32 %i, i32* %p.0, align 4, !tbaa !0
  %add = add nsw i32 %i, 1
  store i32 %add, i32* %b, align 4, !tbaa !0
  %0 = load i32* %p.0, align 4, !tbaa !0
  ret i32 %0
}

define i32 @main() nounwind uwtable {
if.end4:
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
