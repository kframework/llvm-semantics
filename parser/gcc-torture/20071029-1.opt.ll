; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20071029-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, i32, i32, i32, i32, i32, i32, i32, i64, i64, i32 }
%union.T = type { %struct.anon }

@test.i = internal unnamed_addr global i32 11, align 4

define void @test(%union.T* %t) nounwind uwtable noinline {
entry:
  %f1 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 0
  %tmp1 = load i32* %f1, align 4
  %tmp2 = load i32* @test.i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* @test.i, align 4
  %cmp = icmp eq i32 %tmp1, %tmp2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %f2 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 1
  %tmp5 = load i32* %f2, align 4
  %tobool = icmp eq i32 %tmp5, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then52

lor.lhs.false:                                    ; preds = %if.end
  %f3 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 2
  %tmp8 = load i32* %f3, align 4
  %tobool9 = icmp eq i32 %tmp8, 0
  br i1 %tobool9, label %lor.lhs.false10, label %if.then52

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %f413 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 3
  %tmp14 = load i32* %f413, align 4
  %tobool15 = icmp eq i32 %tmp14, 0
  br i1 %tobool15, label %lor.lhs.false16, label %if.then52

lor.lhs.false16:                                  ; preds = %lor.lhs.false10
  %f5 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 4
  %tmp19 = load i32* %f5, align 4
  %tobool20 = icmp eq i32 %tmp19, 0
  br i1 %tobool20, label %lor.lhs.false21, label %if.then52

lor.lhs.false21:                                  ; preds = %lor.lhs.false16
  %f6 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 5
  %tmp24 = load i32* %f6, align 4
  %tobool25 = icmp eq i32 %tmp24, 0
  br i1 %tobool25, label %lor.lhs.false26, label %if.then52

lor.lhs.false26:                                  ; preds = %lor.lhs.false21
  %f729 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 6
  %tmp30 = load i32* %f729, align 4
  %tobool31 = icmp eq i32 %tmp30, 0
  br i1 %tobool31, label %lor.lhs.false32, label %if.then52

lor.lhs.false32:                                  ; preds = %lor.lhs.false26
  %f8 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 7
  %tmp35 = load i32* %f8, align 4
  %tobool36 = icmp eq i32 %tmp35, 0
  br i1 %tobool36, label %lor.lhs.false37, label %if.then52

lor.lhs.false37:                                  ; preds = %lor.lhs.false32
  %f9 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 8
  %tmp40 = load i64* %f9, align 8
  %tobool41 = icmp eq i64 %tmp40, 0
  br i1 %tobool41, label %lor.lhs.false42, label %if.then52

lor.lhs.false42:                                  ; preds = %lor.lhs.false37
  %f10 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 9
  %tmp45 = load i64* %f10, align 8
  %tobool46 = icmp eq i64 %tmp45, 0
  br i1 %tobool46, label %lor.lhs.false47, label %if.then52

lor.lhs.false47:                                  ; preds = %lor.lhs.false42
  %f11 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 10
  %tmp50 = load i32* %f11, align 4
  %tobool51 = icmp eq i32 %tmp50, 0
  br i1 %tobool51, label %if.end53, label %if.then52

if.then52:                                        ; preds = %lor.lhs.false47, %lor.lhs.false42, %lor.lhs.false37, %lor.lhs.false32, %lor.lhs.false26, %lor.lhs.false21, %lor.lhs.false16, %lor.lhs.false10, %lor.lhs.false, %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %lor.lhs.false47
  %cmp55 = icmp eq i32 %inc, 20
  br i1 %cmp55, label %if.then56, label %if.end57

if.then56:                                        ; preds = %if.end53
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

if.end57:                                         ; preds = %if.end53
  ret void
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

define void @foo(i32 %i) noreturn nounwind uwtable noinline {
entry:
  %t = alloca %union.T, align 8
  %t3.0 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 0
  %t3.1 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 1
  %tmp = add i32 %i, 1
  br label %again

again:                                            ; preds = %again, %entry
  %indvar = phi i32 [ %indvar.next, %again ], [ 0, %entry ]
  %inc = add i32 %tmp, %indvar
  store i32 %inc, i32* %t3.0, align 8
  %0 = bitcast i32* %t3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 48, i32 4, i1 false)
  call void @test(%union.T* %t)
  %indvar.next = add i32 %indvar, 1
  br label %again
}

define i32 @main() noreturn nounwind uwtable {
if.end16:
  call void @foo(i32 10)
  unreachable
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
