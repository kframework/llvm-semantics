; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960311-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = common global i32 0, align 4

define void @a1() nounwind uwtable {
entry:
  %0 = load i32* @count, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @count, align 4
  ret void
}

define void @b(i16 zeroext %data) nounwind uwtable {
entry:
  %data.addr = alloca i16, align 2
  store i16 %data, i16* %data.addr, align 2
  %0 = load i16* %data.addr, align 2
  %conv = zext i16 %0 to i32
  %and = and i32 %conv, 32768
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @a1()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i16* %data.addr, align 2
  %conv1 = zext i16 %1 to i32
  %shl = shl i32 %conv1, 1
  %conv2 = trunc i32 %shl to i16
  store i16 %conv2, i16* %data.addr, align 2
  %2 = load i16* %data.addr, align 2
  %conv3 = zext i16 %2 to i32
  %and4 = and i32 %conv3, 32768
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  call void @a1()
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  %3 = load i16* %data.addr, align 2
  %conv8 = zext i16 %3 to i32
  %shl9 = shl i32 %conv8, 1
  %conv10 = trunc i32 %shl9 to i16
  store i16 %conv10, i16* %data.addr, align 2
  %4 = load i16* %data.addr, align 2
  %conv11 = zext i16 %4 to i32
  %and12 = and i32 %conv11, 32768
  %tobool13 = icmp ne i32 %and12, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end7
  call void @a1()
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end7
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext 0)
  %0 = load i32* @count, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext -32768)
  %1 = load i32* @count, align 4
  %cmp1 = icmp ne i32 %1, 1
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext 16384)
  %2 = load i32* @count, align 4
  %cmp4 = icmp ne i32 %2, 1
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end3
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext 8192)
  %3 = load i32* @count, align 4
  %cmp7 = icmp ne i32 %3, 1
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end6
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext -16384)
  %4 = load i32* @count, align 4
  %cmp10 = icmp ne i32 %4, 2
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end9
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end9
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext -24576)
  %5 = load i32* @count, align 4
  %cmp13 = icmp ne i32 %5, 2
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end12
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext 24576)
  %6 = load i32* @count, align 4
  %cmp16 = icmp ne i32 %6, 2
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end15
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext -8192)
  %7 = load i32* @count, align 4
  %cmp19 = icmp ne i32 %7, 3
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %if.end18
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
