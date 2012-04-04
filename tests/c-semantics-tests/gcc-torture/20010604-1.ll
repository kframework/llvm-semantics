; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010604-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %a, i32 %b, i32 %c, i1 zeroext %d, i1 zeroext %e, i1 zeroext %f, i8 signext %g) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i8, align 1
  %e.addr = alloca i8, align 1
  %f.addr = alloca i8, align 1
  %g.addr = alloca i8, align 1
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %frombool = zext i1 %d to i8
  store i8 %frombool, i8* %d.addr, align 1
  %frombool1 = zext i1 %e to i8
  store i8 %frombool1, i8* %e.addr, align 1
  %frombool2 = zext i1 %f to i8
  store i8 %frombool2, i8* %f.addr, align 1
  store i8 %g, i8* %g.addr, align 1
  %0 = load i8* %g.addr, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8* %d.addr, align 1
  %tobool = trunc i8 %1 to i1
  %conv4 = zext i1 %tobool to i32
  %cmp5 = icmp ne i32 %conv4, 1
  br i1 %cmp5, label %if.then, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false
  %2 = load i8* %e.addr, align 1
  %tobool8 = trunc i8 %2 to i1
  %conv9 = zext i1 %tobool8 to i32
  %cmp10 = icmp ne i32 %conv9, 1
  br i1 %cmp10, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false7
  %3 = load i8* %f.addr, align 1
  %tobool13 = trunc i8 %3 to i1
  %conv14 = zext i1 %tobool13 to i32
  %cmp15 = icmp ne i32 %conv14, 1
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false12, %lor.lhs.false7, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false12
  %4 = load i32* %a.addr, align 4
  %5 = load i32* %b.addr, align 4
  %add = add nsw i32 %4, %5
  %6 = load i32* %c.addr, align 4
  %add17 = add nsw i32 %add, %6
  ret i32 %add17
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f(i32 1, i32 2, i32 -3, i1 zeroext true, i1 zeroext true, i1 zeroext true, i8 signext 1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

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

declare void @exit(i32) noreturn nounwind
