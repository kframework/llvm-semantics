; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060929-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32** %p, i32* %q) nounwind uwtable {
entry:
  %p.addr = alloca i32**, align 8
  %q.addr = alloca i32*, align 8
  store i32** %p, i32*** %p.addr, align 8
  store i32* %q, i32** %q.addr, align 8
  %0 = load i32** %q.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %0, i32 1
  store i32* %incdec.ptr, i32** %q.addr, align 8
  %1 = load i32* %0, align 4
  %2 = load i32*** %p.addr, align 8
  %incdec.ptr1 = getelementptr inbounds i32** %2, i32 1
  store i32** %incdec.ptr1, i32*** %p.addr, align 8
  %3 = load i32** %2, align 8
  %incdec.ptr2 = getelementptr inbounds i32* %3, i32 1
  store i32* %incdec.ptr2, i32** %2, align 8
  store i32 %1, i32* %3, align 4
  ret void
}

define void @bar(i32** %p, i32* %q) nounwind uwtable {
entry:
  %p.addr = alloca i32**, align 8
  %q.addr = alloca i32*, align 8
  store i32** %p, i32*** %p.addr, align 8
  store i32* %q, i32** %q.addr, align 8
  %0 = load i32** %q.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %0, i32 1
  store i32* %incdec.ptr, i32** %q.addr, align 8
  %1 = load i32* %0, align 4
  %2 = load i32*** %p.addr, align 8
  %3 = load i32** %2, align 8
  store i32 %1, i32* %3, align 4
  %4 = load i32*** %p.addr, align 8
  %incdec.ptr1 = getelementptr inbounds i32** %4, i32 1
  store i32** %incdec.ptr1, i32*** %p.addr, align 8
  %5 = load i32** %4, align 8
  %incdec.ptr2 = getelementptr inbounds i32* %5, i32 1
  store i32* %incdec.ptr2, i32** %4, align 8
  %6 = load i32* %5, align 4
  ret void
}

define void @baz(i32** %p, i32* %q) nounwind uwtable {
entry:
  %p.addr = alloca i32**, align 8
  %q.addr = alloca i32*, align 8
  store i32** %p, i32*** %p.addr, align 8
  store i32* %q, i32** %q.addr, align 8
  %0 = load i32** %q.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %0, i32 1
  store i32* %incdec.ptr, i32** %q.addr, align 8
  %1 = load i32* %0, align 4
  %2 = load i32*** %p.addr, align 8
  %3 = load i32** %2, align 8
  store i32 %1, i32* %3, align 4
  %4 = load i32*** %p.addr, align 8
  %incdec.ptr1 = getelementptr inbounds i32** %4, i32 1
  store i32** %incdec.ptr1, i32*** %p.addr, align 8
  %5 = load i32** %4, align 8
  %incdec.ptr2 = getelementptr inbounds i32* %5, i32 1
  store i32* %incdec.ptr2, i32** %4, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 42, i32* %i, align 4
  store i32 0, i32* %j, align 4
  store i32* %i, i32** %p, align 8
  call void @foo(i32** %p, i32* %j)
  %0 = load i32** %p, align 8
  %add.ptr = getelementptr inbounds i32* %0, i64 -1
  %cmp = icmp ne i32* %add.ptr, %i
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %j, align 4
  %cmp1 = icmp ne i32 %1, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32* %i, align 4
  %cmp3 = icmp ne i32 %2, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false2
  store i32 43, i32* %i, align 4
  store i32* %i, i32** %p, align 8
  call void @bar(i32** %p, i32* %j)
  %3 = load i32** %p, align 8
  %add.ptr4 = getelementptr inbounds i32* %3, i64 -1
  %cmp5 = icmp ne i32* %add.ptr4, %i
  br i1 %cmp5, label %if.then10, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %if.end
  %4 = load i32* %j, align 4
  %cmp7 = icmp ne i32 %4, 0
  br i1 %cmp7, label %if.then10, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %5 = load i32* %i, align 4
  %cmp9 = icmp ne i32 %5, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %lor.lhs.false8, %lor.lhs.false6, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %lor.lhs.false8
  store i32 44, i32* %i, align 4
  store i32* %i, i32** %p, align 8
  call void @baz(i32** %p, i32* %j)
  %6 = load i32** %p, align 8
  %add.ptr12 = getelementptr inbounds i32* %6, i64 -1
  %cmp13 = icmp ne i32* %add.ptr12, %i
  br i1 %cmp13, label %if.then18, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %if.end11
  %7 = load i32* %j, align 4
  %cmp15 = icmp ne i32 %7, 0
  br i1 %cmp15, label %if.then18, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %lor.lhs.false14
  %8 = load i32* %i, align 4
  %cmp17 = icmp ne i32 %8, 0
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %lor.lhs.false16, %lor.lhs.false14, %if.end11
  call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %lor.lhs.false16
  ret i32 0
}

declare void @abort() noreturn nounwind
