; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080117-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gs_imager_state_s = type { %struct.anon }
%struct.anon = type { i32, i32, float }

@gstate_initial = internal constant %struct.gs_imager_state_s { %struct.anon { i32 1, i32 0, float 0.000000e+00 } }, align 4

define void @gstate_path_memory(%struct.gs_imager_state_s* %pgs) nounwind uwtable {
entry:
  %pgs.addr = alloca %struct.gs_imager_state_s*, align 8
  store %struct.gs_imager_state_s* %pgs, %struct.gs_imager_state_s** %pgs.addr, align 8
  %0 = load %struct.gs_imager_state_s** %pgs.addr, align 8
  %1 = bitcast %struct.gs_imager_state_s* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast (%struct.gs_imager_state_s* @gstate_initial to i8*), i64 12, i32 4, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @gs_state_update_overprint() nounwind uwtable {
entry:
  %0 = load i32* getelementptr inbounds (%struct.gs_imager_state_s* @gstate_initial, i32 0, i32 0, i32 0), align 4
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @gs_state_update_overprint()
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
