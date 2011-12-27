; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20071029-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, i32, i32, i32, i32, i32, i32, i32, i64, i64, i32 }
%union.T = type { %struct.anon }

@test.i = internal global i32 11, align 4

define void @test(%union.T* %t) nounwind uwtable noinline {
entry:
  %t.addr = alloca %union.T*, align 8
  store %union.T* %t, %union.T** %t.addr, align 8
  %tmp = load %union.T** %t.addr, align 8
  %f = bitcast %union.T* %tmp to %struct.anon*
  %f1 = getelementptr inbounds %struct.anon* %f, i32 0, i32 0
  %tmp1 = load i32* %f1, align 4
  %tmp2 = load i32* @test.i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* @test.i, align 4
  %cmp = icmp ne i32 %tmp1, %tmp2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %tmp3 = load %union.T** %t.addr, align 8
  %f4 = bitcast %union.T* %tmp3 to %struct.anon*
  %f2 = getelementptr inbounds %struct.anon* %f4, i32 0, i32 1
  %tmp5 = load i32* %f2, align 4
  %tobool = icmp ne i32 %tmp5, 0
  br i1 %tobool, label %if.then52, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %tmp6 = load %union.T** %t.addr, align 8
  %f7 = bitcast %union.T* %tmp6 to %struct.anon*
  %f3 = getelementptr inbounds %struct.anon* %f7, i32 0, i32 2
  %tmp8 = load i32* %f3, align 4
  %tobool9 = icmp ne i32 %tmp8, 0
  br i1 %tobool9, label %if.then52, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %tmp11 = load %union.T** %t.addr, align 8
  %f12 = bitcast %union.T* %tmp11 to %struct.anon*
  %f413 = getelementptr inbounds %struct.anon* %f12, i32 0, i32 3
  %tmp14 = load i32* %f413, align 4
  %tobool15 = icmp ne i32 %tmp14, 0
  br i1 %tobool15, label %if.then52, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %lor.lhs.false10
  %tmp17 = load %union.T** %t.addr, align 8
  %f18 = bitcast %union.T* %tmp17 to %struct.anon*
  %f5 = getelementptr inbounds %struct.anon* %f18, i32 0, i32 4
  %tmp19 = load i32* %f5, align 4
  %tobool20 = icmp ne i32 %tmp19, 0
  br i1 %tobool20, label %if.then52, label %lor.lhs.false21

lor.lhs.false21:                                  ; preds = %lor.lhs.false16
  %tmp22 = load %union.T** %t.addr, align 8
  %f23 = bitcast %union.T* %tmp22 to %struct.anon*
  %f6 = getelementptr inbounds %struct.anon* %f23, i32 0, i32 5
  %tmp24 = load i32* %f6, align 4
  %tobool25 = icmp ne i32 %tmp24, 0
  br i1 %tobool25, label %if.then52, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %lor.lhs.false21
  %tmp27 = load %union.T** %t.addr, align 8
  %f28 = bitcast %union.T* %tmp27 to %struct.anon*
  %f729 = getelementptr inbounds %struct.anon* %f28, i32 0, i32 6
  %tmp30 = load i32* %f729, align 4
  %tobool31 = icmp ne i32 %tmp30, 0
  br i1 %tobool31, label %if.then52, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %lor.lhs.false26
  %tmp33 = load %union.T** %t.addr, align 8
  %f34 = bitcast %union.T* %tmp33 to %struct.anon*
  %f8 = getelementptr inbounds %struct.anon* %f34, i32 0, i32 7
  %tmp35 = load i32* %f8, align 4
  %tobool36 = icmp ne i32 %tmp35, 0
  br i1 %tobool36, label %if.then52, label %lor.lhs.false37

lor.lhs.false37:                                  ; preds = %lor.lhs.false32
  %tmp38 = load %union.T** %t.addr, align 8
  %f39 = bitcast %union.T* %tmp38 to %struct.anon*
  %f9 = getelementptr inbounds %struct.anon* %f39, i32 0, i32 8
  %tmp40 = load i64* %f9, align 8
  %tobool41 = icmp ne i64 %tmp40, 0
  br i1 %tobool41, label %if.then52, label %lor.lhs.false42

lor.lhs.false42:                                  ; preds = %lor.lhs.false37
  %tmp43 = load %union.T** %t.addr, align 8
  %f44 = bitcast %union.T* %tmp43 to %struct.anon*
  %f10 = getelementptr inbounds %struct.anon* %f44, i32 0, i32 9
  %tmp45 = load i64* %f10, align 8
  %tobool46 = icmp ne i64 %tmp45, 0
  br i1 %tobool46, label %if.then52, label %lor.lhs.false47

lor.lhs.false47:                                  ; preds = %lor.lhs.false42
  %tmp48 = load %union.T** %t.addr, align 8
  %f49 = bitcast %union.T* %tmp48 to %struct.anon*
  %f11 = getelementptr inbounds %struct.anon* %f49, i32 0, i32 10
  %tmp50 = load i32* %f11, align 4
  %tobool51 = icmp ne i32 %tmp50, 0
  br i1 %tobool51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %lor.lhs.false47, %lor.lhs.false42, %lor.lhs.false37, %lor.lhs.false32, %lor.lhs.false26, %lor.lhs.false21, %lor.lhs.false16, %lor.lhs.false10, %lor.lhs.false, %if.end
  call void @abort() noreturn
  unreachable

if.end53:                                         ; preds = %lor.lhs.false47
  %tmp54 = load i32* @test.i, align 4
  %cmp55 = icmp eq i32 %tmp54, 20
  br i1 %cmp55, label %if.then56, label %if.end57

if.then56:                                        ; preds = %if.end53
  call void @exit(i32 0) noreturn
  unreachable

if.end57:                                         ; preds = %if.end53
  ret void
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

define void @foo(i32 %i) nounwind uwtable noinline {
entry:
  %i.addr = alloca i32, align 4
  %t = alloca %union.T, align 8
  %.compoundliteral = alloca %union.T, align 8
  store i32 %i, i32* %i.addr, align 4
  br label %again

again:                                            ; preds = %again, %entry
  %f = bitcast %union.T* %.compoundliteral to %struct.anon*
  %f1 = getelementptr inbounds %struct.anon* %f, i32 0, i32 0
  %tmp = load i32* %i.addr, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* %i.addr, align 4
  store i32 %inc, i32* %f1, align 4
  %f2 = getelementptr inbounds %struct.anon* %f, i32 0, i32 1
  store i32 0, i32* %f2, align 4
  %f3 = getelementptr inbounds %struct.anon* %f, i32 0, i32 2
  store i32 0, i32* %f3, align 4
  %f4 = getelementptr inbounds %struct.anon* %f, i32 0, i32 3
  store i32 0, i32* %f4, align 4
  %f5 = getelementptr inbounds %struct.anon* %f, i32 0, i32 4
  store i32 0, i32* %f5, align 4
  %f6 = getelementptr inbounds %struct.anon* %f, i32 0, i32 5
  store i32 0, i32* %f6, align 4
  %f7 = getelementptr inbounds %struct.anon* %f, i32 0, i32 6
  store i32 0, i32* %f7, align 4
  %f8 = getelementptr inbounds %struct.anon* %f, i32 0, i32 7
  store i32 0, i32* %f8, align 4
  %f9 = getelementptr inbounds %struct.anon* %f, i32 0, i32 8
  store i64 0, i64* %f9, align 8
  %f10 = getelementptr inbounds %struct.anon* %f, i32 0, i32 9
  store i64 0, i64* %f10, align 8
  %f11 = getelementptr inbounds %struct.anon* %f, i32 0, i32 10
  store i32 0, i32* %f11, align 4
  %tmp1 = bitcast %union.T* %t to i8*
  %tmp2 = bitcast %union.T* %.compoundliteral to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp1, i8* %tmp2, i64 56, i32 8, i1 false)
  call void @test(%union.T* %t)
  br label %again

return:                                           ; No predecessors!
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %t1 = alloca %union.T*, align 8
  %t2 = alloca %union.T*, align 8
  %cnt = alloca i32, align 4
  %.compoundliteral = alloca %union.T, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %cnt, align 4
  store %union.T* null, %union.T** %t1, align 8
  br label %loop

loop:                                             ; preds = %if.then, %entry
  %tmp = load %union.T** %t1, align 8
  store %union.T* %tmp, %union.T** %t2, align 8
  %0 = bitcast %union.T* %.compoundliteral to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 56, i32 8, i1 false)
  %f = bitcast %union.T* %.compoundliteral to %struct.anon*
  %f9 = getelementptr inbounds %struct.anon* %f, i32 0, i32 8
  %tmp1 = load i32* %cnt, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* %cnt, align 4
  %conv = sext i32 %tmp1 to i64
  store i64 %conv, i64* %f9, align 8
  store %union.T* %.compoundliteral, %union.T** %t1, align 8
  %tmp2 = load i32* %cnt, align 4
  %cmp = icmp slt i32 %tmp2, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %loop
  br label %loop

if.end:                                           ; preds = %loop
  %tmp4 = load %union.T** %t1, align 8
  %tmp5 = load %union.T** %t2, align 8
  %cmp6 = icmp ne %union.T* %tmp4, %tmp5
  br i1 %cmp6, label %if.then15, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %tmp8 = load %union.T** %t1, align 8
  %f10 = bitcast %union.T* %tmp8 to %struct.anon*
  %f911 = getelementptr inbounds %struct.anon* %f10, i32 0, i32 8
  %tmp12 = load i64* %f911, align 8
  %cmp13 = icmp ne i64 %tmp12, 2
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %lor.lhs.false, %if.end
  call void @abort() noreturn
  unreachable

if.end16:                                         ; preds = %lor.lhs.false
  call void @foo(i32 10)
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
