; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr17078-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @test(i32* %ptr) nounwind uwtable {
entry:
  %ptr.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %ptr, i32** %ptr.addr, align 8
  store i32 1, i32* %i, align 4
  br label %useless
                                                  ; No predecessors!
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %0
  br label %useless

useless:                                          ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4
  br label %if.end

if.else:                                          ; preds = %0
  store i32 1, i32* %i, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %useless
  %1 = load i32* %i, align 4
  %2 = load i32** %ptr.addr, align 8
  store i32 %1, i32* %2, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %i, align 4
  call void @test(i32* %i)
  %0 = load i32* %i, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
