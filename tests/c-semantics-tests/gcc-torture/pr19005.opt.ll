; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr19005.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@v = common global i32 0, align 4
@s = common global i32 0, align 4

define void @bar(i32 %a, i32 %b) nounwind uwtable {
entry:
  %0 = load i32* @v, align 4, !tbaa !0
  %1 = load i32* @s, align 4, !tbaa !0
  %tobool = icmp eq i32 %1, 0
  %conv9 = and i32 %0, 255
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp = icmp eq i32 %conv9, %a
  br i1 %cmp, label %lor.lhs.false, label %if.then8

lor.lhs.false:                                    ; preds = %if.then
  %add = add nsw i32 %0, 1
  %conv5 = and i32 %add, 255
  %cmp6 = icmp eq i32 %conv5, %b
  br i1 %cmp6, label %if.end21, label %if.then8

if.then8:                                         ; preds = %lor.lhs.false, %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  %add10 = add nsw i32 %0, 1
  %conv12 = and i32 %add10, 255
  %cmp13 = icmp eq i32 %conv12, %a
  %cmp17 = icmp eq i32 %conv9, %b
  %or.cond = and i1 %cmp13, %cmp17
  br i1 %or.cond, label %if.end21, label %if.then19

if.then19:                                        ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %if.else, %lor.lhs.false
  %xor = xor i32 %1, 1
  store i32 %xor, i32* @s, align 4, !tbaa !0
  ret void
}

declare void @abort() noreturn

define i32 @foo(i32 %x) nounwind uwtable {
entry:
  %add = add nsw i32 %x, 1
  %conv2 = and i32 %x, 255
  %conv3 = and i32 %add, 255
  %0 = load i32* @v, align 4, !tbaa !0
  %1 = load i32* @s, align 4, !tbaa !0
  %tobool.i = icmp eq i32 %1, 0
  %conv9.i = and i32 %0, 255
  br i1 %tobool.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %cmp.i = icmp eq i32 %conv9.i, %conv2
  br i1 %cmp.i, label %lor.lhs.false.i, label %if.then8.i

lor.lhs.false.i:                                  ; preds = %if.then.i
  %add.i = add nsw i32 %0, 1
  %conv5.i = and i32 %add.i, 255
  %cmp6.i = icmp eq i32 %conv5.i, %conv3
  br i1 %cmp6.i, label %bar.exit, label %if.then8.i

if.then8.i:                                       ; preds = %lor.lhs.false.i, %if.then.i
  tail call void @abort() noreturn nounwind
  unreachable

if.else.i:                                        ; preds = %entry
  %add10.i = add nsw i32 %0, 1
  %conv12.i = and i32 %add10.i, 255
  %cmp13.i = icmp eq i32 %conv12.i, %conv2
  %cmp17.i = icmp eq i32 %conv9.i, %conv3
  %or.cond.i = and i1 %cmp13.i, %cmp17.i
  br i1 %or.cond.i, label %bar.exit, label %if.then19.i

if.then19.i:                                      ; preds = %if.else.i
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %lor.lhs.false.i, %if.else.i
  %xor.i = xor i32 %1, 1
  store i32 %xor.i, i32* @s, align 4, !tbaa !0
  %tobool.i17 = icmp eq i32 %1, 1
  br i1 %tobool.i17, label %if.then.i20, label %if.else.i31

if.then.i20:                                      ; preds = %bar.exit
  %cmp.i19 = icmp eq i32 %conv9.i, %conv3
  br i1 %cmp.i19, label %lor.lhs.false.i24, label %if.then8.i25

lor.lhs.false.i24:                                ; preds = %if.then.i20
  %add.i21 = add nsw i32 %0, 1
  %conv5.i22 = and i32 %add.i21, 255
  %cmp6.i23 = icmp eq i32 %conv5.i22, %conv2
  br i1 %cmp6.i23, label %bar.exit34, label %if.then8.i25

if.then8.i25:                                     ; preds = %lor.lhs.false.i24, %if.then.i20
  tail call void @abort() noreturn nounwind
  unreachable

if.else.i31:                                      ; preds = %bar.exit
  %add10.i26 = add nsw i32 %0, 1
  %conv12.i27 = and i32 %add10.i26, 255
  %cmp13.i28 = icmp eq i32 %conv12.i27, %conv3
  %cmp17.i29 = icmp eq i32 %conv9.i, %conv2
  %or.cond.i30 = and i1 %cmp13.i28, %cmp17.i29
  br i1 %or.cond.i30, label %bar.exit34, label %if.then19.i32

if.then19.i32:                                    ; preds = %if.else.i31
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit34:                                       ; preds = %lor.lhs.false.i24, %if.else.i31
  store i32 %1, i32* @s, align 4, !tbaa !0
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  store i32 -10, i32* @v, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %storemerge1 = phi i32 [ -10, %entry ], [ %inc, %for.body ]
  %call = tail call i32 @foo(i32 %storemerge1)
  %0 = load i32* @v, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @v, align 4
  %cmp = icmp slt i32 %inc, 266
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
