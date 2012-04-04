; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921123-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.four_quarters = type { i16, i16, i16, i16 }

@b = common global i32 0, align 4
@a = common global i32 0, align 4
@x = common global %struct.four_quarters zeroinitializer, align 2

define void @f(i64 %j.coerce) nounwind uwtable {
entry:
  %j = alloca %struct.four_quarters, align 8
  %0 = bitcast %struct.four_quarters* %j to i64*
  store i64 %j.coerce, i64* %0, align 1
  %b2 = getelementptr inbounds %struct.four_quarters* %j, i32 0, i32 2
  %1 = load i16* %b2, align 2
  %conv = zext i16 %1 to i32
  store i32 %conv, i32* @b, align 4
  %b3 = getelementptr inbounds %struct.four_quarters* %j, i32 0, i32 3
  %2 = load i16* %b3, align 2
  %conv1 = zext i16 %2 to i32
  store i32 %conv1, i32* @a, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.four_quarters, align 2
  store i32 0, i32* %retval
  %b2 = getelementptr inbounds %struct.four_quarters* %x, i32 0, i32 2
  store i16 0, i16* %b2, align 2
  %b1 = getelementptr inbounds %struct.four_quarters* %x, i32 0, i32 1
  store i16 0, i16* %b1, align 2
  %b0 = getelementptr inbounds %struct.four_quarters* %x, i32 0, i32 0
  store i16 0, i16* %b0, align 2
  %b3 = getelementptr inbounds %struct.four_quarters* %x, i32 0, i32 3
  store i16 38, i16* %b3, align 2
  %0 = bitcast %struct.four_quarters* %x to i64*
  %1 = load i64* %0, align 1
  call void @f(i64 %1)
  %2 = load i32* @a, align 4
  %cmp = icmp ne i32 %2, 38
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
