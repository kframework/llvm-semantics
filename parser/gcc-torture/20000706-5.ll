; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000706-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i32 }
%struct.baz = type { i32, i32, i32 }

@c = common global %struct.baz* null, align 8

define void @bar(i32 %b) nounwind uwtable {
entry:
  %b.addr = alloca i32, align 4
  store i32 %b, i32* %b.addr, align 4
  %tmp = load %struct.baz** @c, align 8
  %a = getelementptr inbounds %struct.baz* %tmp, i32 0, i32 0
  %tmp1 = load i32* %a, align 4
  %cmp = icmp ne i32 %tmp1, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load %struct.baz** @c, align 8
  %b3 = getelementptr inbounds %struct.baz* %tmp2, i32 0, i32 1
  %tmp4 = load i32* %b3, align 4
  %cmp5 = icmp ne i32 %tmp4, 2
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %tmp7 = load %struct.baz** @c, align 8
  %c = getelementptr inbounds %struct.baz* %tmp7, i32 0, i32 2
  %tmp8 = load i32* %c, align 4
  %cmp9 = icmp ne i32 %tmp8, 3
  br i1 %cmp9, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false6
  %tmp11 = load i32* %b.addr, align 4
  %cmp12 = icmp ne i32 %tmp11, 4
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false10, %lor.lhs.false6, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false10
  ret void
}

declare void @abort() noreturn

define void @foo(i64 %a.coerce0, i32 %a.coerce1, i32 %b) nounwind uwtable {
entry:
  %a = alloca %struct.baz, align 8
  %b.addr = alloca i32, align 4
  %0 = bitcast %struct.baz* %a to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i32 %a.coerce1, i32* %2
  store i32 %b, i32* %b.addr, align 4
  store %struct.baz* %a, %struct.baz** @c, align 8
  %tmp = load i32* %b.addr, align 4
  call void @bar(i32 %tmp)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.baz, align 4
  store i32 0, i32* %retval
  %a1 = getelementptr inbounds %struct.baz* %a, i32 0, i32 0
  store i32 1, i32* %a1, align 4
  %b = getelementptr inbounds %struct.baz* %a, i32 0, i32 1
  store i32 2, i32* %b, align 4
  %c = getelementptr inbounds %struct.baz* %a, i32 0, i32 2
  store i32 3, i32* %c, align 4
  %0 = bitcast %struct.baz* %a to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  %2 = load i64* %1, align 1
  %3 = getelementptr %0* %0, i32 0, i32 1
  %4 = load i32* %3, align 1
  call void @foo(i64 %2, i32 %4, i32 4)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @exit(i32) noreturn
