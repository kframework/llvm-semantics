; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20071202-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@main.s = private unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4

define void @foo(%struct.S* %s) nounwind uwtable noinline {
entry:
  %s.addr = alloca %struct.S*, align 8
  %.compoundliteral = alloca %struct.S, align 4
  store %struct.S* %s, %struct.S** %s.addr, align 8
  %0 = load %struct.S** %s.addr, align 8
  %a = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 0
  %1 = load %struct.S** %s.addr, align 8
  %b = getelementptr inbounds %struct.S* %1, i32 0, i32 1
  %2 = load i32* %b, align 4
  store i32 %2, i32* %a, align 4
  %b1 = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 1
  %3 = load %struct.S** %s.addr, align 8
  %a2 = getelementptr inbounds %struct.S* %3, i32 0, i32 0
  %4 = load i32* %a2, align 4
  store i32 %4, i32* %b1, align 4
  %c = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 2
  %5 = bitcast [6 x i32]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 24, i32 4, i1 false)
  %arrayinit.begin = getelementptr inbounds [6 x i32]* %c, i64 0, i64 0
  %arrayinit.element = getelementptr inbounds i32* %arrayinit.begin, i64 1
  %arrayinit.element3 = getelementptr inbounds i32* %arrayinit.element, i64 1
  %arrayinit.element4 = getelementptr inbounds i32* %arrayinit.element3, i64 1
  %arrayinit.element5 = getelementptr inbounds i32* %arrayinit.element4, i64 1
  %arrayinit.element6 = getelementptr inbounds i32* %arrayinit.element5, i64 1
  %d = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 3
  %6 = load %struct.S** %s.addr, align 8
  %d7 = getelementptr inbounds %struct.S* %6, i32 0, i32 3
  %7 = bitcast %struct.T* %d to i8*
  %8 = bitcast %struct.T* %d7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 36, i32 4, i1 false)
  %9 = bitcast %struct.S* %0 to i8*
  %10 = bitcast %struct.S* %.compoundliteral to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 68, i32 4, i1 false)
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.S, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.S* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.S* @main.s to i8*), i64 68, i32 4, i1 false)
  call void @foo(%struct.S* %s)
  %a = getelementptr inbounds %struct.S* %s, i32 0, i32 0
  %1 = load i32* %a, align 4
  %cmp = icmp ne i32 %1, 12
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.S* %s, i32 0, i32 1
  %2 = load i32* %b, align 4
  %cmp1 = icmp ne i32 %2, 6
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx = getelementptr inbounds [6 x i32]* %c, i32 0, i64 0
  %3 = load i32* %arrayidx, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false2
  %c4 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx5 = getelementptr inbounds [6 x i32]* %c4, i32 0, i64 1
  %4 = load i32* %arrayidx5, align 4
  %tobool6 = icmp ne i32 %4, 0
  br i1 %tobool6, label %if.then, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false3
  %c8 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx9 = getelementptr inbounds [6 x i32]* %c8, i32 0, i64 2
  %5 = load i32* %arrayidx9, align 4
  %tobool10 = icmp ne i32 %5, 0
  br i1 %tobool10, label %if.then, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %lor.lhs.false7
  %c12 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx13 = getelementptr inbounds [6 x i32]* %c12, i32 0, i64 3
  %6 = load i32* %arrayidx13, align 4
  %tobool14 = icmp ne i32 %6, 0
  br i1 %tobool14, label %if.then, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false11
  %c16 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx17 = getelementptr inbounds [6 x i32]* %c16, i32 0, i64 4
  %7 = load i32* %arrayidx17, align 4
  %tobool18 = icmp ne i32 %7, 0
  br i1 %tobool18, label %if.then, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %lor.lhs.false15
  %c20 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx21 = getelementptr inbounds [6 x i32]* %c20, i32 0, i64 5
  %8 = load i32* %arrayidx21, align 4
  %tobool22 = icmp ne i32 %8, 0
  br i1 %tobool22, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false19, %lor.lhs.false15, %lor.lhs.false11, %lor.lhs.false7, %lor.lhs.false3, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false19
  %d = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %t = getelementptr inbounds %struct.T* %d, i32 0, i32 0
  %9 = load i32* %t, align 4
  %cmp23 = icmp ne i32 %9, 7
  br i1 %cmp23, label %if.then63, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %if.end
  %d25 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r = getelementptr inbounds %struct.T* %d25, i32 0, i32 1
  %arrayidx26 = getelementptr inbounds [8 x i32]* %r, i32 0, i64 0
  %10 = load i32* %arrayidx26, align 4
  %cmp27 = icmp ne i32 %10, 8
  br i1 %cmp27, label %if.then63, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %lor.lhs.false24
  %d29 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r30 = getelementptr inbounds %struct.T* %d29, i32 0, i32 1
  %arrayidx31 = getelementptr inbounds [8 x i32]* %r30, i32 0, i64 1
  %11 = load i32* %arrayidx31, align 4
  %cmp32 = icmp ne i32 %11, 9
  br i1 %cmp32, label %if.then63, label %lor.lhs.false33

lor.lhs.false33:                                  ; preds = %lor.lhs.false28
  %d34 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r35 = getelementptr inbounds %struct.T* %d34, i32 0, i32 1
  %arrayidx36 = getelementptr inbounds [8 x i32]* %r35, i32 0, i64 2
  %12 = load i32* %arrayidx36, align 4
  %cmp37 = icmp ne i32 %12, 10
  br i1 %cmp37, label %if.then63, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %lor.lhs.false33
  %d39 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r40 = getelementptr inbounds %struct.T* %d39, i32 0, i32 1
  %arrayidx41 = getelementptr inbounds [8 x i32]* %r40, i32 0, i64 3
  %13 = load i32* %arrayidx41, align 4
  %cmp42 = icmp ne i32 %13, 11
  br i1 %cmp42, label %if.then63, label %lor.lhs.false43

lor.lhs.false43:                                  ; preds = %lor.lhs.false38
  %d44 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r45 = getelementptr inbounds %struct.T* %d44, i32 0, i32 1
  %arrayidx46 = getelementptr inbounds [8 x i32]* %r45, i32 0, i64 4
  %14 = load i32* %arrayidx46, align 4
  %cmp47 = icmp ne i32 %14, 12
  br i1 %cmp47, label %if.then63, label %lor.lhs.false48

lor.lhs.false48:                                  ; preds = %lor.lhs.false43
  %d49 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r50 = getelementptr inbounds %struct.T* %d49, i32 0, i32 1
  %arrayidx51 = getelementptr inbounds [8 x i32]* %r50, i32 0, i64 5
  %15 = load i32* %arrayidx51, align 4
  %cmp52 = icmp ne i32 %15, 13
  br i1 %cmp52, label %if.then63, label %lor.lhs.false53

lor.lhs.false53:                                  ; preds = %lor.lhs.false48
  %d54 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r55 = getelementptr inbounds %struct.T* %d54, i32 0, i32 1
  %arrayidx56 = getelementptr inbounds [8 x i32]* %r55, i32 0, i64 6
  %16 = load i32* %arrayidx56, align 4
  %cmp57 = icmp ne i32 %16, 14
  br i1 %cmp57, label %if.then63, label %lor.lhs.false58

lor.lhs.false58:                                  ; preds = %lor.lhs.false53
  %d59 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r60 = getelementptr inbounds %struct.T* %d59, i32 0, i32 1
  %arrayidx61 = getelementptr inbounds [8 x i32]* %r60, i32 0, i64 7
  %17 = load i32* %arrayidx61, align 4
  %cmp62 = icmp ne i32 %17, 15
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %lor.lhs.false58, %lor.lhs.false53, %lor.lhs.false48, %lor.lhs.false43, %lor.lhs.false38, %lor.lhs.false33, %lor.lhs.false28, %lor.lhs.false24, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %lor.lhs.false58
  ret i32 0
}

declare void @abort() noreturn nounwind
