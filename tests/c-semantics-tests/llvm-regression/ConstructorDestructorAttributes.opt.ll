; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/ConstructorDestructorAttributes.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 65535, void ()* @ctor }]
@llvm.global_dtors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 65535, void ()* @dtor }]
@str1 = private unnamed_addr constant [8 x i8] c"Create!\00"

define void @ctor() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str1, i64 0, i64 0))
  ret void
}

define void @dtor() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str1, i64 0, i64 0))
  ret void
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
