; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr19005.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@v = common global i32 0, align 4
@s = common global i32 0, align 4

define void @bar(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %x = alloca i8, align 1
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %tmp = load i32* @v, align 4
  %conv = trunc i32 %tmp to i8
  store i8 %conv, i8* %x, align 1
  %tmp1 = load i32* @s, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %a.addr, align 4
  %tmp3 = load i8* %x, align 1
  %conv4 = zext i8 %tmp3 to i32
  %cmp = icmp ne i32 %tmp2, %conv4
  br i1 %cmp, label %if.then13, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %tmp6 = load i32* %b.addr, align 4
  %tmp7 = load i8* %x, align 1
  %conv8 = zext i8 %tmp7 to i32
  %add = add nsw i32 %conv8, 1
  %conv9 = trunc i32 %add to i8
  %conv10 = zext i8 %conv9 to i32
  %cmp11 = icmp ne i32 %tmp6, %conv10
  br i1 %cmp11, label %if.then13, label %if.end

if.then13:                                        ; preds = %lor.lhs.false, %if.then
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  br label %if.end30

if.else:                                          ; preds = %entry
  %tmp14 = load i32* %a.addr, align 4
  %tmp15 = load i8* %x, align 1
  %conv16 = zext i8 %tmp15 to i32
  %add17 = add nsw i32 %conv16, 1
  %conv18 = trunc i32 %add17 to i8
  %conv19 = zext i8 %conv18 to i32
  %cmp20 = icmp ne i32 %tmp14, %conv19
  br i1 %cmp20, label %if.then28, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %if.else
  %tmp23 = load i32* %b.addr, align 4
  %tmp24 = load i8* %x, align 1
  %conv25 = zext i8 %tmp24 to i32
  %cmp26 = icmp ne i32 %tmp23, %conv25
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %lor.lhs.false22, %if.else
  call void @abort() noreturn
  unreachable

if.end29:                                         ; preds = %lor.lhs.false22
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.end
  %tmp31 = load i32* @s, align 4
  %xor = xor i32 %tmp31, 1
  store i32 %xor, i32* @s, align 4
  ret void
}

declare void @abort() noreturn

define i32 @foo(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i8, align 1
  %b = alloca i8, align 1
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %conv = trunc i32 %tmp to i8
  store i8 %conv, i8* %a, align 1
  %tmp2 = load i32* %x.addr, align 4
  %add = add nsw i32 %tmp2, 1
  %conv3 = trunc i32 %add to i8
  store i8 %conv3, i8* %b, align 1
  %tmp4 = load i8* %a, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i8* %b, align 1
  %conv7 = zext i8 %tmp6 to i32
  call void @bar(i32 %conv5, i32 %conv7)
  %tmp8 = load i8* %b, align 1
  %conv9 = zext i8 %tmp8 to i32
  %tmp10 = load i8* %a, align 1
  %conv11 = zext i8 %tmp10 to i32
  %xor = xor i32 %conv11, %conv9
  %conv12 = trunc i32 %xor to i8
  store i8 %conv12, i8* %a, align 1
  %tmp13 = load i8* %a, align 1
  %conv14 = zext i8 %tmp13 to i32
  %tmp15 = load i8* %b, align 1
  %conv16 = zext i8 %tmp15 to i32
  %xor17 = xor i32 %conv16, %conv14
  %conv18 = trunc i32 %xor17 to i8
  store i8 %conv18, i8* %b, align 1
  %tmp19 = load i8* %b, align 1
  %conv20 = zext i8 %tmp19 to i32
  %tmp21 = load i8* %a, align 1
  %conv22 = zext i8 %tmp21 to i32
  %xor23 = xor i32 %conv22, %conv20
  %conv24 = trunc i32 %xor23 to i8
  store i8 %conv24, i8* %a, align 1
  %tmp25 = load i8* %a, align 1
  %conv26 = zext i8 %tmp25 to i32
  %tmp27 = load i8* %b, align 1
  %conv28 = zext i8 %tmp27 to i32
  call void @bar(i32 %conv26, i32 %conv28)
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -10, i32* @v, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* @v, align 4
  %cmp = icmp slt i32 %tmp, 266
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* @v, align 4
  %call = call i32 @foo(i32 %tmp1)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* @v, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* @v, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}
