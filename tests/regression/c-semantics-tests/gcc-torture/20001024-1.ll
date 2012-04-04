; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001024-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.b = type { %struct.a, %struct.a }
%struct.a = type { i64, i64 }

define i32 @bar(i32 %x, %struct.b* noalias %y, %struct.b* noalias %z) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca %struct.b*, align 8
  %z.addr = alloca %struct.b*, align 8
  store i32 %x, i32* %x.addr, align 4
  store %struct.b* %y, %struct.b** %y.addr, align 8
  store %struct.b* %z, %struct.b** %z.addr, align 8
  %0 = load %struct.b** %y.addr, align 8
  %c = getelementptr inbounds %struct.b* %0, i32 0, i32 0
  %v = getelementptr inbounds %struct.a* %c, i32 0, i32 0
  %1 = load i64* %v, align 8
  %tobool = icmp ne i64 %1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.b** %y.addr, align 8
  %c1 = getelementptr inbounds %struct.b* %2, i32 0, i32 0
  %w = getelementptr inbounds %struct.a* %c1, i32 0, i32 1
  %3 = load i64* %w, align 8
  %cmp = icmp ne i64 %3, 250000
  br i1 %cmp, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %4 = load %struct.b** %y.addr, align 8
  %d = getelementptr inbounds %struct.b* %4, i32 0, i32 1
  %v3 = getelementptr inbounds %struct.a* %d, i32 0, i32 0
  %5 = load i64* %v3, align 8
  %tobool4 = icmp ne i64 %5, 0
  br i1 %tobool4, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false2
  %6 = load %struct.b** %y.addr, align 8
  %d6 = getelementptr inbounds %struct.b* %6, i32 0, i32 1
  %w7 = getelementptr inbounds %struct.a* %d6, i32 0, i32 1
  %7 = load i64* %w7, align 8
  %cmp8 = icmp ne i64 %7, 250000
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false5, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false5
  ret i32 0
}

declare void @abort() noreturn nounwind

define void @foo() nounwind uwtable {
entry:
  %x = alloca %struct.b, align 8
  %c = getelementptr inbounds %struct.b* %x, i32 0, i32 0
  %v = getelementptr inbounds %struct.a* %c, i32 0, i32 0
  store i64 0, i64* %v, align 8
  %c1 = getelementptr inbounds %struct.b* %x, i32 0, i32 0
  %w = getelementptr inbounds %struct.a* %c1, i32 0, i32 1
  store i64 250000, i64* %w, align 8
  %d = getelementptr inbounds %struct.b* %x, i32 0, i32 1
  %c2 = getelementptr inbounds %struct.b* %x, i32 0, i32 0
  %0 = bitcast %struct.a* %d to i8*
  %1 = bitcast %struct.a* %c2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 16, i32 8, i1 false)
  %call = call i32 @bar(i32 0, %struct.b* %x, %struct.b* null)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
