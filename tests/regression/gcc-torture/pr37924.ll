; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr37924.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = common global i8 0, align 1
@b = common global i8 0, align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @test1() nounwind uwtable {
entry:
  %c = alloca i32, align 4
  store i32 -1, i32* %c, align 4
  %tmp = load i8* @a, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i32* %c, align 4
  %xor = xor i32 %conv, %tmp1
  %shr = lshr i32 %xor, 9
  ret i32 %shr
}

define i32 @test2() nounwind uwtable {
entry:
  %c = alloca i32, align 4
  store i32 -1, i32* %c, align 4
  %tmp = load i8* @b, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i32* %c, align 4
  %xor = xor i32 %conv, %tmp1
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
  %tmp = load i8* @a, align 1
  %conv = sext i8 %tmp to i32
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
  %tmp13 = load i8* @a, align 1
  %conv14 = sext i8 %tmp13 to i32
  %cmp15 = icmp slt i32 %conv14, 0
  %conv16 = zext i1 %cmp15 to i32
  %cmp17 = icmp ne i32 %call12, %conv16
  br i1 %cmp17, label %cond.true19, label %cond.false20

cond.true19:                                      ; preds = %if.end11
  br i1 false, label %if.then21, label %if.end22

cond.false20:                                     ; preds = %if.end11
  br i1 true, label %if.then21, label %if.end22

if.then21:                                        ; preds = %cond.false20, %cond.true19
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %cond.false20, %cond.true19
  store i8 0, i8* @b, align 1
  %call23 = call i32 @test2()
  %cmp24 = icmp ne i32 %call23, 8388607
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.end22
  store i8 64, i8* @b, align 1
  %call28 = call i32 @test2()
  %cmp29 = icmp ne i32 %call28, 8388607
  br i1 %cmp29, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end27
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end27
  store i8 -128, i8* @b, align 1
  %call33 = call i32 @test2()
  %cmp34 = icmp ne i32 %call33, 8388607
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.end32
  store i8 -1, i8* @b, align 1
  %call38 = call i32 @test2()
  %cmp39 = icmp ne i32 %call38, 8388607
  br i1 %cmp39, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.end37
  call void @abort() noreturn nounwind
  unreachable

if.end42:                                         ; preds = %if.end37
  ret i32 0
}

declare void @abort() noreturn nounwind
