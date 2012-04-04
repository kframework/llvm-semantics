; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr37924.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global i8 0, align 1
@b = common global i8 0, align 1

define i32 @test1() nounwind uwtable {
entry:
  %c = alloca i32, align 4
  store i32 -1, i32* %c, align 4
  %0 = load i8* @a, align 1
  %conv = sext i8 %0 to i32
  %1 = load i32* %c, align 4
  %xor = xor i32 %conv, %1
  %shr = lshr i32 %xor, 9
  ret i32 %shr
}

define i32 @test2() nounwind uwtable {
entry:
  %c = alloca i32, align 4
  store i32 -1, i32* %c, align 4
  %0 = load i8* @b, align 1
  %conv = zext i8 %0 to i32
  %1 = load i32* %c, align 4
  %xor = xor i32 %conv, %1
  %shr = lshr i32 %xor, 9
  ret i32 %shr
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i8 0, i8* @a, align 1
  %call = call i32 @test1()
  %cmp = icmp ne i32 %call, 8388607
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  store i8 64, i8* @a, align 1
  %call1 = call i32 @test1()
  %cmp2 = icmp ne i32 %call1, 8388607
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  store i8 -128, i8* @a, align 1
  %call5 = call i32 @test1()
  %0 = load i8* @a, align 1
  %conv = sext i8 %0 to i32
  %cmp6 = icmp slt i32 %conv, 0
  %conv7 = zext i1 %cmp6 to i32
  %cmp8 = icmp ne i32 %call5, %conv7
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end4
  br i1 false, label %if.then10, label %if.end11

cond.false:                                       ; preds = %if.end4
  br i1 true, label %if.then10, label %if.end11

if.then10:                                        ; preds = %cond.false, %cond.true
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %cond.false, %cond.true
  store i8 -1, i8* @a, align 1
  %call12 = call i32 @test1()
  %1 = load i8* @a, align 1
  %conv13 = sext i8 %1 to i32
  %cmp14 = icmp slt i32 %conv13, 0
  %conv15 = zext i1 %cmp14 to i32
  %cmp16 = icmp ne i32 %call12, %conv15
  br i1 %cmp16, label %cond.true18, label %cond.false19

cond.true18:                                      ; preds = %if.end11
  br i1 false, label %if.then20, label %if.end21

cond.false19:                                     ; preds = %if.end11
  br i1 true, label %if.then20, label %if.end21

if.then20:                                        ; preds = %cond.false19, %cond.true18
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %cond.false19, %cond.true18
  store i8 0, i8* @b, align 1
  %call22 = call i32 @test2()
  %cmp23 = icmp ne i32 %call22, 8388607
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end21
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end21
  store i8 64, i8* @b, align 1
  %call27 = call i32 @test2()
  %cmp28 = icmp ne i32 %call27, 8388607
  br i1 %cmp28, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end26
  call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %if.end26
  store i8 -128, i8* @b, align 1
  %call32 = call i32 @test2()
  %cmp33 = icmp ne i32 %call32, 8388607
  br i1 %cmp33, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end31
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end31
  store i8 -1, i8* @b, align 1
  %call37 = call i32 @test2()
  %cmp38 = icmp ne i32 %call37, 8388607
  br i1 %cmp38, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end36
  call void @abort() noreturn nounwind
  unreachable

if.end41:                                         ; preds = %if.end36
  ret i32 0
}

declare void @abort() noreturn nounwind
