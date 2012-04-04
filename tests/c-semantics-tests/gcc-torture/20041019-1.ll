; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041019-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @test_store_ccp(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %p = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32* %a, i32** %p, align 8
  br label %if.end4

if.else:                                          ; preds = %entry
  %1 = load i32* %i.addr, align 4
  %cmp1 = icmp sgt i32 %1, 8
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  store i32* %b, i32** %p, align 8
  br label %if.end

if.else3:                                         ; preds = %if.else
  store i32* %c, i32** %p, align 8
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load i32** %p, align 8
  store i32 10, i32* %2, align 4
  store i32 3, i32* %b, align 4
  %3 = load i32** %p, align 8
  %4 = load i32* %3, align 4
  %add = add nsw i32 %4, 2
  ret i32 %add
}

define i32 @test_store_copy_prop(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %p = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32* %a, i32** %p, align 8
  br label %if.end4

if.else:                                          ; preds = %entry
  %1 = load i32* %i.addr, align 4
  %cmp1 = icmp sgt i32 %1, 8
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  store i32* %b, i32** %p, align 8
  br label %if.end

if.else3:                                         ; preds = %if.else
  store i32* %c, i32** %p, align 8
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load i32* %i.addr, align 4
  %3 = load i32** %p, align 8
  store i32 %2, i32* %3, align 4
  %4 = load i32* %i.addr, align 4
  %add = add nsw i32 %4, 1
  store i32 %add, i32* %b, align 4
  %5 = load i32** %p, align 8
  %6 = load i32* %5, align 4
  ret i32 %6
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test_store_ccp(i32 10)
  store i32 %call, i32* %x, align 4
  %0 = load i32* %x, align 4
  %cmp = icmp eq i32 %0, 12
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @test_store_copy_prop(i32 9)
  store i32 %call1, i32* %x, align 4
  %1 = load i32* %x, align 4
  %cmp2 = icmp eq i32 %1, 9
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
