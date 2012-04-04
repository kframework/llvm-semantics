; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930208-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.T = type { i64 }
%struct.anon = type { i8, i8, i8, i8 }

define i32 @f(i64 %u.coerce) nounwind uwtable {
entry:
  %u = alloca %union.T, align 8
  %coerce.dive = getelementptr %union.T* %u, i32 0, i32 0
  store i64 %u.coerce, i64* %coerce.dive
  %c = bitcast %union.T* %u to %struct.anon*
  %b0 = getelementptr inbounds %struct.anon* %c, i32 0, i32 3
  %0 = load i8* %b0, align 1
  %inc = add i8 %0, 1
  store i8 %inc, i8* %b0, align 1
  %c1 = bitcast %union.T* %u to %struct.anon*
  %b3 = getelementptr inbounds %struct.anon* %c1, i32 0, i32 0
  %1 = load i8* %b3, align 1
  %inc2 = add i8 %1, 1
  store i8 %inc2, i8* %b3, align 1
  %c3 = bitcast %union.T* %u to %struct.anon*
  %b1 = getelementptr inbounds %struct.anon* %c3, i32 0, i32 2
  %2 = load i8* %b1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 2
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %c5 = bitcast %union.T* %u to %struct.anon*
  %b2 = getelementptr inbounds %struct.anon* %c5, i32 0, i32 1
  %3 = load i8* %b2, align 1
  %conv6 = sext i8 %3 to i32
  %cmp7 = icmp ne i32 %conv6, 2
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %4 = phi i1 [ true, %entry ], [ %cmp7, %lor.rhs ]
  %lor.ext = zext i1 %4 to i32
  ret i32 %lor.ext
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %u = alloca %union.T, align 8
  store i32 0, i32* %retval
  %c = bitcast %union.T* %u to %struct.anon*
  %b1 = getelementptr inbounds %struct.anon* %c, i32 0, i32 2
  store i8 2, i8* %b1, align 1
  %c1 = bitcast %union.T* %u to %struct.anon*
  %b2 = getelementptr inbounds %struct.anon* %c1, i32 0, i32 1
  store i8 2, i8* %b2, align 1
  %c2 = bitcast %union.T* %u to %struct.anon*
  %b0 = getelementptr inbounds %struct.anon* %c2, i32 0, i32 3
  store i8 -1, i8* %b0, align 1
  %c3 = bitcast %union.T* %u to %struct.anon*
  %b3 = getelementptr inbounds %struct.anon* %c3, i32 0, i32 0
  store i8 -1, i8* %b3, align 1
  %coerce.dive = getelementptr %union.T* %u, i32 0, i32 0
  %0 = load i64* %coerce.dive
  %call = call i32 @f(i64 %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
