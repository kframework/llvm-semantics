; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980612-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fd = type { i8, i8 }

@f = global %struct.fd { i8 5, i8 0 }, align 1

define %struct.fd* @g() nounwind uwtable {
entry:
  ret %struct.fd* @f
}

define i32 @h() nounwind uwtable {
entry:
  ret i32 -1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %f = alloca %struct.fd*, align 8
  store i32 0, i32* %retval
  %call = call %struct.fd* @g()
  store %struct.fd* %call, %struct.fd** %f, align 8
  %call1 = call i32 @h()
  %conv = trunc i32 %call1 to i8
  %0 = load %struct.fd** %f, align 8
  %b = getelementptr inbounds %struct.fd* %0, i32 0, i32 1
  store i8 %conv, i8* %b, align 1
  %1 = load %struct.fd** %f, align 8
  %a = getelementptr inbounds %struct.fd* %1, i32 0, i32 0
  %2 = load i8* %a, align 1
  %conv2 = zext i8 %2 to i32
  %and = and i32 %conv2, 127
  %and3 = and i32 %and, -17
  %cmp = icmp sle i32 %and3, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
