; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950607-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i64 }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %h = alloca %struct.anon, align 8
  store i32 0, i32* %retval
  %status = getelementptr inbounds %struct.anon* %h, i32 0, i32 0
  store i64 0, i64* %status, align 8
  %status1 = getelementptr inbounds %struct.anon* %h, i32 0, i32 0
  %0 = load i64* %status1, align 8
  %and = and i64 %0, 128
  %cmp = icmp eq i64 %and, 1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %status2 = getelementptr inbounds %struct.anon* %h, i32 0, i32 0
  %1 = load i64* %status2, align 8
  %and3 = and i64 %1, 32
  %cmp4 = icmp eq i64 %and3, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.lhs.true, %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
