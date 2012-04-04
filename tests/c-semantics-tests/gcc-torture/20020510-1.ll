; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020510-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @testc(i8 zeroext %c, i32 %ok) nounwind uwtable {
entry:
  %c.addr = alloca i8, align 1
  %ok.addr = alloca i32, align 4
  store i8 %c, i8* %c.addr, align 1
  store i32 %ok, i32* %ok.addr, align 4
  %0 = load i8* %c.addr, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp sge i32 %conv, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i8* %c.addr, align 1
  %conv2 = zext i8 %1 to i32
  %cmp3 = icmp sle i32 %conv2, 127
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.end, label %if.then5

if.then5:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end9

if.else:                                          ; preds = %land.lhs.true, %entry
  %3 = load i32* %ok.addr, align 4
  %tobool6 = icmp ne i32 %3, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.end
  ret void
}

declare void @abort() noreturn nounwind

define void @tests(i16 zeroext %s, i32 %ok) nounwind uwtable {
entry:
  %s.addr = alloca i16, align 2
  %ok.addr = alloca i32, align 4
  store i16 %s, i16* %s.addr, align 2
  store i32 %ok, i32* %ok.addr, align 4
  %0 = load i16* %s.addr, align 2
  %conv = zext i16 %0 to i32
  %cmp = icmp sge i32 %conv, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i16* %s.addr, align 2
  %conv2 = zext i16 %1 to i32
  %cmp3 = icmp sle i32 %conv2, 32767
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.end, label %if.then5

if.then5:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end9

if.else:                                          ; preds = %land.lhs.true, %entry
  %3 = load i32* %ok.addr, align 4
  %tobool6 = icmp ne i32 %3, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.end
  ret void
}

define void @testi(i32 %i, i32 %ok) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %0 = load i32* %i.addr, align 4
  %cmp = icmp uge i32 %0, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32* %i.addr, align 4
  %cmp1 = icmp ule i32 %1, 2147483647
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %land.lhs.true, %entry
  %3 = load i32* %ok.addr, align 4
  %tobool3 = icmp ne i32 %3, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  ret void
}

define void @testl(i64 %l, i32 %ok) nounwind uwtable {
entry:
  %l.addr = alloca i64, align 8
  %ok.addr = alloca i32, align 4
  store i64 %l, i64* %l.addr, align 8
  store i32 %ok, i32* %ok.addr, align 4
  %0 = load i64* %l.addr, align 8
  %cmp = icmp uge i64 %0, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i64* %l.addr, align 8
  %cmp1 = icmp ule i64 %1, 9223372036854775807
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %land.lhs.true, %entry
  %3 = load i32* %ok.addr, align 4
  %tobool3 = icmp ne i32 %3, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @testc(i8 zeroext 0, i32 0)
  call void @testc(i8 zeroext 1, i32 1)
  call void @testc(i8 zeroext 127, i32 1)
  call void @testc(i8 zeroext -128, i32 0)
  call void @testc(i8 zeroext -1, i32 0)
  call void @tests(i16 zeroext 0, i32 0)
  call void @tests(i16 zeroext 1, i32 1)
  call void @tests(i16 zeroext 32767, i32 1)
  call void @tests(i16 zeroext -32768, i32 0)
  call void @tests(i16 zeroext -1, i32 0)
  call void @testi(i32 0, i32 0)
  call void @testi(i32 1, i32 1)
  call void @testi(i32 2147483647, i32 1)
  call void @testi(i32 -2147483648, i32 0)
  call void @testi(i32 -1, i32 0)
  call void @testl(i64 0, i32 0)
  call void @testl(i64 1, i32 1)
  call void @testl(i64 9223372036854775807, i32 1)
  call void @testl(i64 -9223372036854775808, i32 0)
  call void @testl(i64 -1, i32 0)
  ret i32 0
}
