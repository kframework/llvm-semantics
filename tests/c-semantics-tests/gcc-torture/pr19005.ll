; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr19005.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %0 = load i32* @v, align 4
  %conv = trunc i32 %0 to i8
  store i8 %conv, i8* %x, align 1
  %1 = load i32* @s, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %2 = load i32* %a.addr, align 4
  %3 = load i8* %x, align 1
  %conv1 = zext i8 %3 to i32
  %cmp = icmp ne i32 %2, %conv1
  br i1 %cmp, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %4 = load i32* %b.addr, align 4
  %5 = load i8* %x, align 1
  %conv3 = zext i8 %5 to i32
  %add = add nsw i32 %conv3, 1
  %conv4 = trunc i32 %add to i8
  %conv5 = zext i8 %conv4 to i32
  %cmp6 = icmp ne i32 %4, %conv5
  br i1 %cmp6, label %if.then8, label %if.end

if.then8:                                         ; preds = %lor.lhs.false, %if.then
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  br label %if.end21

if.else:                                          ; preds = %entry
  %6 = load i32* %a.addr, align 4
  %7 = load i8* %x, align 1
  %conv9 = zext i8 %7 to i32
  %add10 = add nsw i32 %conv9, 1
  %conv11 = trunc i32 %add10 to i8
  %conv12 = zext i8 %conv11 to i32
  %cmp13 = icmp ne i32 %6, %conv12
  br i1 %cmp13, label %if.then19, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %if.else
  %8 = load i32* %b.addr, align 4
  %9 = load i8* %x, align 1
  %conv16 = zext i8 %9 to i32
  %cmp17 = icmp ne i32 %8, %conv16
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %lor.lhs.false15, %if.else
  call void @abort() noreturn
  unreachable

if.end20:                                         ; preds = %lor.lhs.false15
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end
  %10 = load i32* @s, align 4
  %xor = xor i32 %10, 1
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
  %0 = load i32* %x.addr, align 4
  %conv = trunc i32 %0 to i8
  store i8 %conv, i8* %a, align 1
  %1 = load i32* %x.addr, align 4
  %add = add nsw i32 %1, 1
  %conv1 = trunc i32 %add to i8
  store i8 %conv1, i8* %b, align 1
  %2 = load i8* %a, align 1
  %conv2 = zext i8 %2 to i32
  %3 = load i8* %b, align 1
  %conv3 = zext i8 %3 to i32
  call void @bar(i32 %conv2, i32 %conv3)
  %4 = load i8* %b, align 1
  %conv4 = zext i8 %4 to i32
  %5 = load i8* %a, align 1
  %conv5 = zext i8 %5 to i32
  %xor = xor i32 %conv5, %conv4
  %conv6 = trunc i32 %xor to i8
  store i8 %conv6, i8* %a, align 1
  %6 = load i8* %a, align 1
  %conv7 = zext i8 %6 to i32
  %7 = load i8* %b, align 1
  %conv8 = zext i8 %7 to i32
  %xor9 = xor i32 %conv8, %conv7
  %conv10 = trunc i32 %xor9 to i8
  store i8 %conv10, i8* %b, align 1
  %8 = load i8* %b, align 1
  %conv11 = zext i8 %8 to i32
  %9 = load i8* %a, align 1
  %conv12 = zext i8 %9 to i32
  %xor13 = xor i32 %conv12, %conv11
  %conv14 = trunc i32 %xor13 to i8
  store i8 %conv14, i8* %a, align 1
  %10 = load i8* %a, align 1
  %conv15 = zext i8 %10 to i32
  %11 = load i8* %b, align 1
  %conv16 = zext i8 %11 to i32
  call void @bar(i32 %conv15, i32 %conv16)
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -10, i32* @v, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* @v, align 4
  %cmp = icmp slt i32 %0, 266
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* @v, align 4
  %call = call i32 @foo(i32 %1)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* @v, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @v, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}
