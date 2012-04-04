; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000722-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i8*, i32 }

@.str = private unnamed_addr constant [3 x i8] c"hi\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @bar()
  call void @bar()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define void @bar() nounwind uwtable {
entry:
  %.compoundliteral = alloca %struct.s, align 8
  %p = getelementptr inbounds %struct.s* %.compoundliteral, i32 0, i32 0
  store i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i8** %p, align 8
  %t = getelementptr inbounds %struct.s* %.compoundliteral, i32 0, i32 1
  store i32 1, i32* %t, align 4
  call void @foo(%struct.s* %.compoundliteral)
  ret void
}

declare void @exit(i32) noreturn nounwind

define void @foo(%struct.s* %p) nounwind uwtable {
entry:
  %p.addr = alloca %struct.s*, align 8
  store %struct.s* %p, %struct.s** %p.addr, align 8
  %0 = load %struct.s** %p.addr, align 8
  %t = getelementptr inbounds %struct.s* %0, i32 0, i32 1
  %1 = load i32* %t, align 4
  %cmp = icmp ne i32 %1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %2 = load %struct.s** %p.addr, align 8
  %t1 = getelementptr inbounds %struct.s* %2, i32 0, i32 1
  store i32 2, i32* %t1, align 4
  ret void
}

declare void @abort() noreturn nounwind
