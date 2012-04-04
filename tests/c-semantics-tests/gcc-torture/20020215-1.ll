; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020215-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i16, i64, i16 }

define void @foo(%struct.s* noalias sret %agg.result, %struct.s* byval align 8 %s) nounwind uwtable {
entry:
  %i2 = getelementptr inbounds %struct.s* %s, i32 0, i32 1
  %0 = load i64* %i2, align 8
  %inc = add nsw i64 %0, 1
  store i64 %inc, i64* %i2, align 8
  %1 = bitcast %struct.s* %agg.result to i8*
  %2 = bitcast %struct.s* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 24, i32 8, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.s, align 8
  %.compoundliteral = alloca %struct.s, align 8
  store i32 0, i32* %retval
  %i1 = getelementptr inbounds %struct.s* %.compoundliteral, i32 0, i32 0
  store i16 1000, i16* %i1, align 2
  %i2 = getelementptr inbounds %struct.s* %.compoundliteral, i32 0, i32 1
  store i64 2000, i64* %i2, align 8
  %i3 = getelementptr inbounds %struct.s* %.compoundliteral, i32 0, i32 2
  store i16 3000, i16* %i3, align 2
  call void @foo(%struct.s* sret %s, %struct.s* byval align 8 %.compoundliteral)
  %i11 = getelementptr inbounds %struct.s* %s, i32 0, i32 0
  %0 = load i16* %i11, align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp ne i32 %conv, 1000
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %i23 = getelementptr inbounds %struct.s* %s, i32 0, i32 1
  %1 = load i64* %i23, align 8
  %cmp4 = icmp ne i64 %1, 2001
  br i1 %cmp4, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %i37 = getelementptr inbounds %struct.s* %s, i32 0, i32 2
  %2 = load i16* %i37, align 2
  %conv8 = sext i16 %2 to i32
  %cmp9 = icmp ne i32 %conv8, 3000
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false6
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
