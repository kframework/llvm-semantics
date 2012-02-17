; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr19005.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@v = common global i32 0, align 4
@s = common global i32 0, align 4

define void @bar(i32 %a, i32 %b) nounwind uwtable {
entry:
  %tmp = load i32* @v, align 4
  %conv = trunc i32 %tmp to i8
  %tmp1 = load i32* @s, align 4
  %tobool = icmp eq i32 %tmp1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %conv4 = and i32 %tmp, 255
  %cmp = icmp eq i32 %conv4, %a
  br i1 %cmp, label %lor.lhs.false, label %if.then13

lor.lhs.false:                                    ; preds = %if.then
  %add = add i8 %conv, 1
  %conv10 = zext i8 %add to i32
  %cmp11 = icmp eq i32 %conv10, %b
  br i1 %cmp11, label %if.end30, label %if.then13

if.then13:                                        ; preds = %lor.lhs.false, %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  %add17 = add i8 %conv, 1
  %conv19 = zext i8 %add17 to i32
  %cmp20 = icmp eq i32 %conv19, %a
  %conv25 = and i32 %tmp, 255
  %cmp26 = icmp eq i32 %conv25, %b
  %or.cond = and i1 %cmp20, %cmp26
  br i1 %or.cond, label %if.end30, label %if.then28

if.then28:                                        ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.else, %lor.lhs.false
  %xor = xor i32 %tmp1, 1
  store i32 %xor, i32* @s, align 4
  ret void
}

declare void @abort() noreturn

define i32 @foo(i32 %x) nounwind uwtable {
entry:
  %add = add nsw i32 %x, 1
  %conv5 = and i32 %x, 255
  %conv7 = and i32 %add, 255
  %tmp.i = load i32* @v, align 4
  %conv.i = trunc i32 %tmp.i to i8
  %tmp1.i = load i32* @s, align 4
  %tobool.i = icmp eq i32 %tmp1.i, 0
  br i1 %tobool.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %conv4.i = and i32 %tmp.i, 255
  %cmp.i = icmp eq i32 %conv4.i, %conv5
  br i1 %cmp.i, label %lor.lhs.false.i, label %if.then13.i

lor.lhs.false.i:                                  ; preds = %if.then.i
  %add.i = add i8 %conv.i, 1
  %conv10.i = zext i8 %add.i to i32
  %cmp11.i = icmp eq i32 %conv10.i, %conv7
  br i1 %cmp11.i, label %bar.exit, label %if.then13.i

if.then13.i:                                      ; preds = %lor.lhs.false.i, %if.then.i
  tail call void @abort() noreturn nounwind
  unreachable

if.else.i:                                        ; preds = %entry
  %add17.i = add i8 %conv.i, 1
  %conv19.i = zext i8 %add17.i to i32
  %cmp20.i = icmp eq i32 %conv19.i, %conv5
  %conv25.i = and i32 %tmp.i, 255
  %cmp26.i = icmp eq i32 %conv25.i, %conv7
  %or.cond.i = and i1 %cmp20.i, %cmp26.i
  br i1 %or.cond.i, label %bar.exit, label %if.then28.i

if.then28.i:                                      ; preds = %if.else.i
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %lor.lhs.false.i, %if.else.i
  %xor.i = xor i32 %tmp1.i, 1
  store i32 %xor.i, i32* @s, align 4
  %tobool.i7 = icmp eq i32 %tmp1.i, 1
  br i1 %tobool.i7, label %if.then.i10, label %if.else.i22

if.then.i10:                                      ; preds = %bar.exit
  %conv4.i8 = and i32 %tmp.i, 255
  %cmp.i9 = icmp eq i32 %conv4.i8, %conv7
  br i1 %cmp.i9, label %lor.lhs.false.i14, label %if.then13.i15

lor.lhs.false.i14:                                ; preds = %if.then.i10
  %add.i11 = add i8 %conv.i, 1
  %conv10.i12 = zext i8 %add.i11 to i32
  %cmp11.i13 = icmp eq i32 %conv10.i12, %conv5
  br i1 %cmp11.i13, label %bar.exit25, label %if.then13.i15

if.then13.i15:                                    ; preds = %lor.lhs.false.i14, %if.then.i10
  tail call void @abort() noreturn nounwind
  unreachable

if.else.i22:                                      ; preds = %bar.exit
  %add17.i16 = add i8 %conv.i, 1
  %conv19.i17 = zext i8 %add17.i16 to i32
  %cmp20.i18 = icmp eq i32 %conv19.i17, %conv7
  %conv25.i19 = and i32 %tmp.i, 255
  %cmp26.i20 = icmp eq i32 %conv25.i19, %conv5
  %or.cond.i21 = and i1 %cmp20.i18, %cmp26.i20
  br i1 %or.cond.i21, label %bar.exit25, label %if.then28.i23

if.then28.i23:                                    ; preds = %if.else.i22
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit25:                                       ; preds = %lor.lhs.false.i14, %if.else.i22
  store i32 %tmp1.i, i32* @s, align 4
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  store i32 -10, i32* @v, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %storemerge1 = phi i32 [ -10, %entry ], [ %inc, %for.body ]
  %call = tail call i32 @foo(i32 %storemerge1)
  %tmp2 = load i32* @v, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* @v, align 4
  %cmp = icmp slt i32 %inc, 266
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  ret i32 0
}
