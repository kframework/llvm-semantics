; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010518-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.a_struct = type <{ i16, i64, i16, i16, %struct.b_struct }>
%struct.b_struct = type <{ i8, i8, i8, i8, i8, i8 }>

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.a_struct*, align 8
  %b = alloca %struct.a_struct, align 1
  %.compoundliteral = alloca %struct.a_struct, align 1
  store i32 0, i32* %retval
  store %struct.a_struct* %b, %struct.a_struct** %a, align 8
  %0 = load %struct.a_struct** %a, align 8
  %a1 = getelementptr inbounds %struct.a_struct* %.compoundliteral, i32 0, i32 0
  store i16 1, i16* %a1, align 1
  %b2 = getelementptr inbounds %struct.a_struct* %.compoundliteral, i32 0, i32 1
  store i64 2, i64* %b2, align 1
  %c = getelementptr inbounds %struct.a_struct* %.compoundliteral, i32 0, i32 2
  store i16 3, i16* %c, align 1
  %d = getelementptr inbounds %struct.a_struct* %.compoundliteral, i32 0, i32 3
  store i16 4, i16* %d, align 1
  %e = getelementptr inbounds %struct.a_struct* %.compoundliteral, i32 0, i32 4
  %1 = bitcast %struct.b_struct* %e to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 6, i32 1, i1 false)
  %2 = bitcast %struct.a_struct* %0 to i8*
  %3 = bitcast %struct.a_struct* %.compoundliteral to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 20, i32 1, i1 true)
  %4 = load %struct.a_struct** %a, align 8
  %e3 = getelementptr inbounds %struct.a_struct* %4, i32 0, i32 4
  %b4 = getelementptr inbounds %struct.b_struct* %e3, i32 0, i32 4
  store volatile i8 99, i8* %b4, align 1
  %5 = load %struct.a_struct** %a, align 8
  %a4 = getelementptr inbounds %struct.a_struct* %5, i32 0, i32 0
  %6 = load volatile i16* %a4, align 1
  %conv = sext i16 %6 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %7 = load %struct.a_struct** %a, align 8
  %b6 = getelementptr inbounds %struct.a_struct* %7, i32 0, i32 1
  %8 = load volatile i64* %b6, align 1
  %cmp7 = icmp ne i64 %8, 2
  br i1 %cmp7, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false
  %9 = load %struct.a_struct** %a, align 8
  %c10 = getelementptr inbounds %struct.a_struct* %9, i32 0, i32 2
  %10 = load volatile i16* %c10, align 1
  %conv11 = sext i16 %10 to i32
  %cmp12 = icmp ne i32 %conv11, 3
  br i1 %cmp12, label %if.then, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %lor.lhs.false9
  %11 = load %struct.a_struct** %a, align 8
  %d15 = getelementptr inbounds %struct.a_struct* %11, i32 0, i32 3
  %12 = load volatile i16* %d15, align 1
  %conv16 = sext i16 %12 to i32
  %cmp17 = icmp ne i32 %conv16, 4
  br i1 %cmp17, label %if.then, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %lor.lhs.false14
  %13 = load %struct.a_struct** %a, align 8
  %e20 = getelementptr inbounds %struct.a_struct* %13, i32 0, i32 4
  %b421 = getelementptr inbounds %struct.b_struct* %e20, i32 0, i32 4
  %14 = load volatile i8* %b421, align 1
  %conv22 = sext i8 %14 to i32
  %cmp23 = icmp ne i32 %conv22, 99
  br i1 %cmp23, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false19, %lor.lhs.false14, %lor.lhs.false9, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false19
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %15 = load i32* %retval
  ret i32 %15
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
