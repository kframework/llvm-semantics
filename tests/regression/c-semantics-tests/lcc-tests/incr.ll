; ModuleID = '/home/david/src/c-semantics/tests/lcc-tests/incr.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  ret i32 0
}

define void @memchar() nounwind uwtable {
entry:
  %x = alloca i8, align 1
  %p = alloca i8*, align 8
  %0 = load i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8* %0, i32 1
  store i8* %incdec.ptr, i8** %p, align 8
  %1 = load i8* %0, align 1
  store i8 %1, i8* %x, align 1
  %2 = load i8** %p, align 8
  %incdec.ptr1 = getelementptr inbounds i8* %2, i32 1
  store i8* %incdec.ptr1, i8** %p, align 8
  %3 = load i8* %incdec.ptr1, align 1
  store i8 %3, i8* %x, align 1
  %4 = load i8** %p, align 8
  %incdec.ptr2 = getelementptr inbounds i8* %4, i32 -1
  store i8* %incdec.ptr2, i8** %p, align 8
  %5 = load i8* %4, align 1
  store i8 %5, i8* %x, align 1
  %6 = load i8** %p, align 8
  %incdec.ptr3 = getelementptr inbounds i8* %6, i32 -1
  store i8* %incdec.ptr3, i8** %p, align 8
  %7 = load i8* %incdec.ptr3, align 1
  store i8 %7, i8* %x, align 1
  ret void
}

define void @memint() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  %p = alloca i32*, align 8
  %0 = load i32** %p, align 8
  %incdec.ptr = getelementptr inbounds i32* %0, i32 1
  store i32* %incdec.ptr, i32** %p, align 8
  %1 = load i32* %0, align 4
  store i32 %1, i32* %x, align 4
  %2 = load i32** %p, align 8
  %incdec.ptr1 = getelementptr inbounds i32* %2, i32 1
  store i32* %incdec.ptr1, i32** %p, align 8
  %3 = load i32* %incdec.ptr1, align 4
  store i32 %3, i32* %x, align 4
  %4 = load i32** %p, align 8
  %incdec.ptr2 = getelementptr inbounds i32* %4, i32 -1
  store i32* %incdec.ptr2, i32** %p, align 8
  %5 = load i32* %4, align 4
  store i32 %5, i32* %x, align 4
  %6 = load i32** %p, align 8
  %incdec.ptr3 = getelementptr inbounds i32* %6, i32 -1
  store i32* %incdec.ptr3, i32** %p, align 8
  %7 = load i32* %incdec.ptr3, align 4
  store i32 %7, i32* %x, align 4
  ret void
}

define void @regchar() nounwind uwtable {
entry:
  %x = alloca i8, align 1
  %p = alloca i8*, align 8
  %0 = load i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8* %0, i32 1
  store i8* %incdec.ptr, i8** %p, align 8
  %1 = load i8* %0, align 1
  store i8 %1, i8* %x, align 1
  %2 = load i8** %p, align 8
  %incdec.ptr1 = getelementptr inbounds i8* %2, i32 1
  store i8* %incdec.ptr1, i8** %p, align 8
  %3 = load i8* %incdec.ptr1, align 1
  store i8 %3, i8* %x, align 1
  %4 = load i8** %p, align 8
  %incdec.ptr2 = getelementptr inbounds i8* %4, i32 -1
  store i8* %incdec.ptr2, i8** %p, align 8
  %5 = load i8* %4, align 1
  store i8 %5, i8* %x, align 1
  %6 = load i8** %p, align 8
  %incdec.ptr3 = getelementptr inbounds i8* %6, i32 -1
  store i8* %incdec.ptr3, i8** %p, align 8
  %7 = load i8* %incdec.ptr3, align 1
  store i8 %7, i8* %x, align 1
  ret void
}

define void @regint() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  %p = alloca i32*, align 8
  %0 = load i32** %p, align 8
  %incdec.ptr = getelementptr inbounds i32* %0, i32 1
  store i32* %incdec.ptr, i32** %p, align 8
  %1 = load i32* %0, align 4
  store i32 %1, i32* %x, align 4
  %2 = load i32** %p, align 8
  %incdec.ptr1 = getelementptr inbounds i32* %2, i32 1
  store i32* %incdec.ptr1, i32** %p, align 8
  %3 = load i32* %incdec.ptr1, align 4
  store i32 %3, i32* %x, align 4
  %4 = load i32** %p, align 8
  %incdec.ptr2 = getelementptr inbounds i32* %4, i32 -1
  store i32* %incdec.ptr2, i32** %p, align 8
  %5 = load i32* %4, align 4
  store i32 %5, i32* %x, align 4
  %6 = load i32** %p, align 8
  %incdec.ptr3 = getelementptr inbounds i32* %6, i32 -1
  store i32* %incdec.ptr3, i32** %p, align 8
  %7 = load i32* %incdec.ptr3, align 4
  store i32 %7, i32* %x, align 4
  ret void
}
