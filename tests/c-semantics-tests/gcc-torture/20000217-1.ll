; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000217-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define zeroext i16 @showbug(i16* %a, i16* %b) nounwind uwtable {
entry:
  %a.addr = alloca i16*, align 8
  %b.addr = alloca i16*, align 8
  store i16* %a, i16** %a.addr, align 8
  store i16* %b, i16** %b.addr, align 8
  %0 = load i16** %b.addr, align 8
  %1 = load i16* %0, align 2
  %conv = zext i16 %1 to i32
  %sub = sub nsw i32 %conv, 8
  %2 = load i16** %a.addr, align 8
  %3 = load i16* %2, align 2
  %conv1 = zext i16 %3 to i32
  %add = add nsw i32 %conv1, %sub
  %conv2 = trunc i32 %add to i16
  store i16 %conv2, i16* %2, align 2
  %4 = load i16** %a.addr, align 8
  %5 = load i16* %4, align 2
  %conv3 = zext i16 %5 to i32
  %cmp = icmp sge i32 %conv3, 8
  %conv4 = zext i1 %cmp to i32
  %conv5 = trunc i32 %conv4 to i16
  ret i16 %conv5
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i16, align 2
  %y = alloca i16, align 2
  store i32 0, i32* %retval
  store i16 0, i16* %x, align 2
  store i16 10, i16* %y, align 2
  %call = call zeroext i16 @showbug(i16* %x, i16* %y)
  %conv = zext i16 %call to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
