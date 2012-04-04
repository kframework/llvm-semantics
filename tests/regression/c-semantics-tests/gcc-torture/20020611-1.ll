; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020611-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@n = global i32 30, align 4
@p = common global i32 0, align 4
@k = common global i32 0, align 4

define void @x() nounwind uwtable {
entry:
  %h = alloca i32, align 4
  %0 = load i32* @n, align 4
  %cmp = icmp ule i32 %0, 30
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %h, align 4
  %1 = load i32* %h, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* @p, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 0, i32* @p, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32* %h, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  store i32 1, i32* @k, align 4
  br label %if.end4

if.else3:                                         ; preds = %if.end
  store i32 0, i32* @k, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @x()
  %0 = load i32* @p, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* @k, align 4
  %cmp1 = icmp ne i32 %1, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
