; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030120-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define zeroext i16 @test1(i16 zeroext %w) nounwind uwtable {
entry:
  %w.addr = alloca i16, align 2
  store i16 %w, i16* %w.addr, align 2
  %0 = load i16* %w.addr, align 2
  %conv = zext i16 %0 to i32
  %and = and i32 %conv, 65280
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end6

if.then:                                          ; preds = %entry
  %1 = load i16* %w.addr, align 2
  %conv2 = zext i16 %1 to i32
  %cmp3 = icmp eq i32 %conv2, 0
  br i1 %cmp3, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  store i16 2, i16* %w.addr, align 2
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then
  br label %if.end6

if.end6:                                          ; preds = %if.end, %entry
  %2 = load i16* %w.addr, align 2
  ret i16 %2
}

define i64 @test2(i64 %w) nounwind uwtable {
entry:
  %w.addr = alloca i64, align 8
  store i64 %w, i64* %w.addr, align 8
  %0 = load i64* %w.addr, align 8
  %and = and i64 %0, 4294901760
  %cmp = icmp eq i64 %and, 0
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i64* %w.addr, align 8
  %cmp1 = icmp eq i64 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i64 2, i64* %w.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  %2 = load i64* %w.addr, align 8
  ret i64 %2
}

define i32 @test3(i16 zeroext %a) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i16, align 2
  store i16 %a, i16* %a.addr, align 2
  %0 = load i16* %a.addr, align 2
  %conv = zext i16 %0 to i32
  %and = and i32 %conv, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %1 = load i16* %a.addr, align 2
  %tobool1 = icmp ne i16 %1, 0
  br i1 %tobool1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  store i32 1, i32* %retval
  br label %return

if.else3:                                         ; preds = %if.else
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call zeroext i16 @test1(i16 zeroext 1)
  %conv = zext i16 %call to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call2 = call i64 @test2(i64 1)
  %cmp3 = icmp ne i64 %call2, 1
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %call7 = call i32 @test3(i16 zeroext 2)
  %cmp8 = icmp ne i32 %call7, 1
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end6
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
