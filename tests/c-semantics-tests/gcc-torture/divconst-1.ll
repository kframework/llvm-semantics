; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/divconst-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.t1 = type { i32, i32, i32, i32 }

define void @f(%struct.t1* %ps) nounwind uwtable {
entry:
  %ps.addr = alloca %struct.t1*, align 8
  store %struct.t1* %ps, %struct.t1** %ps.addr, align 8
  %0 = load %struct.t1** %ps.addr, align 8
  %a = getelementptr inbounds %struct.t1* %0, i32 0, i32 0
  store i32 10000, i32* %a, align 4
  %1 = load %struct.t1** %ps.addr, align 8
  %a1 = getelementptr inbounds %struct.t1* %1, i32 0, i32 0
  %2 = load i32* %a1, align 4
  %div = udiv i32 %2, 3
  %3 = load %struct.t1** %ps.addr, align 8
  %b = getelementptr inbounds %struct.t1* %3, i32 0, i32 1
  store i32 %div, i32* %b, align 4
  %4 = load %struct.t1** %ps.addr, align 8
  %c = getelementptr inbounds %struct.t1* %4, i32 0, i32 2
  store i32 10000, i32* %c, align 4
  %5 = load %struct.t1** %ps.addr, align 8
  %c2 = getelementptr inbounds %struct.t1* %5, i32 0, i32 2
  %6 = load i32* %c2, align 4
  %div3 = udiv i32 %6, 3
  %7 = load %struct.t1** %ps.addr, align 8
  %d = getelementptr inbounds %struct.t1* %7, i32 0, i32 3
  store i32 %div3, i32* %d, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.t1, align 4
  store i32 0, i32* %retval
  call void @f(%struct.t1* %s)
  %a = getelementptr inbounds %struct.t1* %s, i32 0, i32 0
  %0 = load i32* %a, align 4
  %cmp = icmp ne i32 %0, 10000
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.t1* %s, i32 0, i32 1
  %1 = load i32* %b, align 4
  %cmp1 = icmp ne i32 %1, 3333
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.t1* %s, i32 0, i32 2
  %2 = load i32* %c, align 4
  %cmp3 = icmp ne i32 %2, 10000
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %d = getelementptr inbounds %struct.t1* %s, i32 0, i32 3
  %3 = load i32* %d, align 4
  %cmp5 = icmp ne i32 %3, 3333
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
