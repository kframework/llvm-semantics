; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991227-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"\00wrong\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"\00right\0A\00", align 1

define i8* @doit(i32 %flag) nounwind uwtable readnone {
entry:
  %tobool = icmp ne i32 %flag, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0)
  %add.ptr = getelementptr inbounds i8* %cond, i64 1
  ret i8* %add.ptr
}

define i32 @main() noreturn nounwind uwtable {
if.then:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
